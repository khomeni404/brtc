package com.buet.brtc;


import bd.com.softengine.util.MakDate;
import bd.com.softengine.util.MakString;
import com.buet.brtc.dao.BrtcProjectDAO;
import com.buet.brtc.model.*;
import com.buet.brtc.service.BRTCService;
import com.buet.util.CurrentUserCredentials;
import com.buet.hrm.model.Department;
import com.buet.hrm.service.HRMService;
import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.User;
import com.buet.security.service.SecurityService;
import com.buet.security.service.UserDetailsService;
import com.buet.util.ERPConstants;
import com.buet.util.TheDates;
import com.google.gson.Gson;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.JRLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

/**
 * User: M Ayatullah
 */
@Controller
@RequestMapping("/brtc/")
public class BRTCController {
    @Autowired
    SecurityService securityService;
    @Autowired
    BRTCService brtcService;
    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    HRMService hrmService;
    @Autowired
    BrtcProjectDAO brtcProjectDAO;

    SimpleDateFormat sdfdmy = new SimpleDateFormat("dd/MM/yyyy");
    String progressStatusArray[] = {"Not Assigned", "Assigned", "No Response", "Negotiating", "Negotiation Failed", "Running", "Stopped", "Completed", "Others"};
    String distributionStatusArray[] = {"No distribution", "Partially distributed", "Fully distributed"};
    String financialStatusArray[] = {"No deposit", "Partially deposited", "Fully deposited"};

    @RequestMapping(value = "/reportShow.buet", method = RequestMethod.GET)
    @ResponseBody
    public void reportShow(HttpServletResponse response, @RequestParam("reportName") String reportName) throws JRException, IOException {
        InputStream jasperStream = this.getClass().getResourceAsStream("/com/buet/report/test/report8.jasper");
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("title", reportName);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, new JREmptyDataSource());

        response.setContentType("application/x-pdf");
        response.setHeader("Content-disposition", "inline; filename=" + reportName + ".pdf");

        final OutputStream outStream = response.getOutputStream();
        JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
    }


    @RequestMapping(method = RequestMethod.GET, value = "/test.buet")
    public ModelAndView test() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Test");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        List<AuthorizedGroups> groupsList = securityService.findAllAuthorizedGroups();
        map.put("groupsList", groupsList);
        return new ModelAndView("/brtc/test", map);
    }

    //=========== Project =============================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createBrtcProject.buet")
    public ModelAndView createBrtcProject() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Project");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        List<Client> clientList = brtcService.findAllClientCompName();
        map.put("clientList", clientList);

        List<BRTCProject> projectList = brtcService.findAllBrtcProject();
        int suggestedFileNo = 0;
        for (BRTCProject p : projectList) {
            try {
                int fileNo = Integer.parseInt(p.getFileNo());
                suggestedFileNo = fileNo > suggestedFileNo ? fileNo : suggestedFileNo;
            } catch (Exception pe) {

            }
        }
        map.put("SuggestedFileNo", suggestedFileNo + 1);
        return new ModelAndView("brtc/project_create", map);
    }

    //Ajax Call
    @RequestMapping(value = "/checkDuplicateProject.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String checkDuplicateProject(@RequestParam("fileNo") String fileNo) {
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        if (project != null) {
            map.put("msg", "Yes");
            map.put("projectTitle", project.getProjectTitle());
        } else {
            map.put("msg", "No");
        }
        String json = gson.toJson(map);
        return json;
    }


    @RequestMapping(method = RequestMethod.POST, value = "/saveBrtcProject.buet")
    public ModelAndView saveBrtcProject(@RequestParam("fileNo") String fileNo,
                                        @RequestParam("projectTitle") String projectTitle,
                                        @RequestParam("departmentId") Long departmentId,  //Collected from a hidden field
                                        @RequestParam("clientId") Long clientId) {
        User operator = new CurrentUserCredentials().user;

        //Saving ProjectStatus first for OneToOne Relationship mapping
        ProjectStatus projectStatus = new ProjectStatus();
        projectStatus.setFinancialStatus(0);
        projectStatus.setDistributionStatus(0);
        projectStatus.setProgressStatus(0);
        projectStatus.setRecordDate(new Date());
        projectStatus.setOperator(operator);
        brtcService.save(projectStatus);

        Client client = brtcService.getClient(clientId);
        Department department = hrmService.getDepartment(departmentId);  //Collected from a hidden field
        BRTCProject project = new BRTCProject();
        project.setFileNo(fileNo);
        project.setProjectTitle(projectTitle);
        project.setInitialFee(0.0);
        project.setClient(client);
        //TODO... project.setAssignBy();
        project.setFinalFee(0.0);
        project.setActive(false);
        project.setRecordDate(new Date());
        project.setOperator(operator);
        project.setProjectStatus(projectStatus);
        project.setDepartment(department);

        client.getProjectList().add(project);
        department.getProjectList().add(project);
        brtcService.save(project);

        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo="+fileNo);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/editBrtcProject.buet")
    public ModelAndView editBrtcProject(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Project Edit");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        BRTCProject project = brtcService.getBrtcProject(id);
        map.put("project", project);
        List<Client> clientList = brtcService.findAllClientCompName();
        map.put("clientList", clientList);
        return new ModelAndView("brtc/project_edit", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/updateBrtcProject.buet")
    public ModelAndView updateBrtcProject(@RequestParam("fileNo") String fileNo,
                                          @RequestParam("projectTitle") String projectTitle,
                                          @RequestParam("needReset") String needReset,
                                          @RequestParam("needDelete") String needDelete,
                                          @RequestParam("departmentId") Long departmentId,  //Collected from a hidden field
                                          @RequestParam("departmentIdOld") Long departmentIdOld,  //Collected from a hidden field
                                          @RequestParam("clientIdOld") Long clientIdOld,  //Collected from a hidden field
                                          @RequestParam("clientId") Long clientId) {
        User operator = new CurrentUserCredentials().user;
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        //Saving ProjectStatus first for OneToOne Relationship mapping
        if (needReset.equals("Checked")) {
            ProjectStatus projectStatus = project.getProjectStatus();
            projectStatus.setFinancialStatus(0);
            projectStatus.setDistributionStatus(0);
            projectStatus.setProgressStatus(0);
            projectStatus.setOperator(operator);
            brtcService.update(projectStatus);
        }
        if (needDelete.equals("Checked")) {
            //TODO
        }
        Client client = brtcService.getClient(clientId);
        Department department = hrmService.getDepartment(departmentId);  //Collected from a hidden field
        //BRTCProject project = new BRTCProject();
        project.setFileNo(fileNo);
        project.setProjectTitle(projectTitle);
        //TODO... project.setAssignBy();
        project.setOperator(operator);

        project.setClient(client);
        project.setDepartment(department);

        department.getProjectList().add(project);
        client.getProjectList().add(project);

        //TODO... for new and old department.sql
        brtcService.updateProject(project, clientIdOld, departmentIdOld);

        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo=" + fileNo);
    }

    //updateProjectFee.buet?fileNo=33&finalFee=1400000
    @RequestMapping(method = RequestMethod.GET, value = "/updateProjectFee.buet")
    public
    @ResponseBody
    String updateProjectFee(@RequestParam("fileNo") String fileNo,
                            @RequestParam("finalFee") Double finalFee) {
        //TODO ...checkedBy, recordDate, operator
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();

        BRTCProject project = brtcService.getBrtcProject(fileNo);
        Double initialFee = project.getFinalFee();
        project.setFinalFee(finalFee);
        try {
            brtcService.update(project);
            map.put("success", "Yes");
            map.put("msg", "Price set to <b>BDT." + finalFee + "/=</b> <br> Initial price was <b>BDT." + initialFee + "/=</b>");
        } catch (Exception ex) {
            map.put("success", "No");
        }

        brtcService.createProjectHistory(project, "Change final fee : " + finalFee + "/=");
        String json = gson.toJson(map);
        return json;
    }

    //
    @RequestMapping(value = "/checkDuplicateTeamMember.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String checkDuplicateTeamMember(@RequestParam("teamId") Long teamId,
                                    @RequestParam("memberId") Long memberId) {
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        Team team = brtcService.getTeam(teamId);
        User member = userDetailsService.getUser(memberId);
        TeamMember memberDuplicate = brtcService.getTeamMember(team, member);

        if (memberDuplicate != null) {
            map.put("msg", "Yes");
            map.put("memberName", memberDuplicate.getTeamMember().getToken().getUserDetails().getName());
            String memberType[] = {"Team Leader", "General Member", "Special Member", "Peon"};
            map.put("memberType", memberType[memberDuplicate.getMemberType()]);
        } else {
            map.put("msg", "No");
        }
        String json = gson.toJson(map);
        return json;

    }

    @RequestMapping(value = "/deleteBrtcProject.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteBrtcProject(@RequestParam("fileNo") String fileNo) {
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            brtcService.deleteProject(fileNo);
            map.put("success", "true");
        } catch (Exception e) {
            map.put("success", "false");
            map.put("msg", "<b>Note : </b><br/>This project already engaged with too much miscellaneous project relevant data.");
            String teamLeader = project.getTeam() == null ? "[No team formed yet]" : project.getTeam().getTeamLeader() == null ? "[No Team Leader found !]" : project.getTeam().getTeamLeader().getTeamMember().getToken().getUserDetails().getName();
            map.put("teamLeader", "<b>Team Leader : </b>" + teamLeader);
        }
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/brtcProjectList.buet")
    public ModelAndView brtcProjectList(@RequestParam("findFor") String findFor) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Project");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        List<BRTCProject> projectList;
        if (findFor.toUpperCase().equals("ALL")) {
            projectList = brtcService.findAllBrtcProject();
        } else {
            if (findFor.contains("SOption")) {
                String statusName = findFor.substring(0, 1);
                Integer status = Integer.parseInt(findFor.substring(8, 9));
                projectList = brtcService.findAllBrtcProject(statusName, status);
            } else {
                projectList = brtcService.findAllBrtcProject(findFor);
            }
        }
        map.put("projectList", projectList);
        map.put("searchText", findFor + "");
        return new ModelAndView("brtc/project_list", map);
    }

    //View Project by Long id
    @RequestMapping(method = RequestMethod.GET, value = "/viewBrtcProject.buet")
    public ModelAndView viewBrtcProject(@RequestParam("fileNo") String fileNo) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Project");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        map.put("project", project);
        if (project != null) {
            Client client = project.getClient();
            map.put("client", client);

            ProjectStatus status = project.getProjectStatus();
            map.put("status", status);

            Team team = project.getTeam();
            map.put("team", team);

            NegotiateTeam negotiateTeam = project.getNegotiateTeam();
            map.put("negotiateTeam", negotiateTeam);

            //For view Project's Financial Status Modal
            Map<String, Object> financialStatus;
            try {
                financialStatus = brtcService.getFinancialStatus(project);
                map.put("financialStatus", financialStatus);
            } catch (NullPointerException ex) {
                map.put("financialStatus", null);
            }

            //For viewing Project History
            List<ProjectHistory> historyList = project.getHistoryList();// brtcService.findAllProjectHistory(project);
            map.put("historyList", historyList);
            if (historyList != null) {
                ProjectHistory lastHistory = historyList.size() != 0 ? historyList.get(historyList.size() - 1) : null;
                map.put("lastHistory", lastHistory);
            } else {
                map.put("lastHistory", null);
            }

            //For view Project's Financial Status Modal
            Map<String, Object> distributionStatus;
            try {
                distributionStatus = brtcService.getDistributionStatus(project);
                map.put("distributionStatus", distributionStatus);
            } catch (NullPointerException ex) {
                map.put("distributionStatus", null);
            }

            //For add team member Modal
            List<User> userList = userDetailsService.getAllTeacher();
            map.put("userList", userList);

        }


        map.put("today", new TheDates().getTodaySmart());
        map.put("user", new CurrentUserCredentials().user.getToken().getUserDetails().getName());

        return new ModelAndView("brtc/project_view", map);
    }

    //Find Project by fileNo
    @RequestMapping(value = "findBrtcProject.buet", method = RequestMethod.POST)
    public
    @ResponseBody
    String findBrtcProject(@RequestParam("fileNumber") final String fileNo) {
        Gson gson = new Gson();
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        Map<String, Object> map;

        if (project != null) {
            map = new HashMap<String, Object>();
            map.put("title", project.getProjectTitle());
            map.put("client", project.getClient().getName());
            map.put("address", project.getClient().getAddress());
            map.put("spokesMan", project.getClient().getSpokesMan());
            map.put("spokesManCell", project.getClient().getSpokesManCell());
            int i = 0;
            String brtcNos = "<option>--Select a BRTC number--</option><option>No BRTC Number</option>";
            for (; i < project.getClientPaymentList().size(); i++) {
                brtcNos += "<option>" + project.getClientPaymentList().get(i).getBrtcNo() + "</option>";
            }
            map.put("brtcNos", brtcNos);
            map.put("totalBrtc", i);
            map.put("receivedAmount", brtcService.getAdvancedAmount(project, new CurrentUserCredentials().user, 3));
            map.put("found", true);
        } else {
            map = new HashMap<String, Object>();
            map.put("title", "No Project Found !");
            map.put("client", "---");
            map.put("address", "---");
            map.put("totalBrtc", 0);
            map.put("receivedAmount", "00");
            map.put("found", false);
        }
        String json = gson.toJson(map);

        return json;
    }

    //========== Team ==========================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createTeam.buet")
    public ModelAndView createTeam(@RequestParam("projectId") Long projectId) {
        BRTCProject project = brtcService.getBrtcProject(projectId);
        Team team = new Team();
        team.setProject(project);
        team.setRecordDate(new Date());
        team.setOperator(new CurrentUserCredentials().user);
        team.setFormedDate(new Date());
        team.setTeamType(0);
        brtcService.save(team);

        List<TeamMember> teamMemberList = team.getTeamMemberList();
        if (teamMemberList.size() <= 1) {
            ProjectStatus status = project.getProjectStatus();
            status.setProgressStatus(1);
            brtcService.update(status);

            // To activate a newly created project
            project.setActive(true);
            String note = "Initial working team has been formed by " + new CurrentUserCredentials().user.getToken().getUserDetails().getName() + " on " + new SimpleDateFormat("dd/MM/yyyy").format(new Date());
            brtcService.createProjectHistory(project, note);
        }
        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo=" + project.getFileNo());
    }


    @RequestMapping(method = RequestMethod.GET, value = "/viewTeam.buet")
    public ModelAndView viewTeam(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Client");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        Team team = brtcService.getTeam(id);
        map.put("team", team);
        return new ModelAndView("brtc/team_view", map);
    }


    //========== Team Member ==========================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createTeamMember.buet")
    public ModelAndView createTeamMember(@RequestParam("teamId") Long teamId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Team Member");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        Team team = brtcService.getTeam(teamId);
        map.put("team", team);

        List<User> userList = userDetailsService.getAllUsers();
        map.put("userList", userList);

        map.put("today", new TheDates().getTodaySmart());
        map.put("user", new CurrentUserCredentials().user.getToken().getUserDetails().getName());

        return new ModelAndView("brtc/team_member_create", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveTeamMember.buet")
    public ModelAndView saveTeamMember(@RequestParam("teamId") Long teamId,
                                       @RequestParam("memberId") Long memberId,
                                       @RequestParam("memberTypeIndex") Integer memberTypeIndex,
                                       @RequestParam("notes") String note) {
        Team team = brtcService.getTeam(teamId);

        //TODO...

        if (memberTypeIndex == 0) {
            List<TeamMember> memberList = team.getTeamMemberList();
            for (TeamMember member1 : memberList) {
                if (member1.getMemberType() == 0) {
                    member1.setMemberType(1);
                    brtcService.update(member1);
                }
            }
        }

        User member = userDetailsService.getUser(memberId);

        TeamMember teamMember = new TeamMember();
        teamMember.setTeam(team);
        teamMember.setTeamMember(member);
        teamMember.setOperator(new CurrentUserCredentials().user);
        teamMember.setRecordDate(new Date());
        teamMember.setMemberType(memberTypeIndex);
        teamMember.setNote(MakString.getDashOnEmpty(note));
        team.getTeamMemberList().add(teamMember);
        //TODO..  [No member can active in more than one project at a time]
        member.getMemberList().add(teamMember);
        brtcService.save(teamMember);

        if (memberTypeIndex == 0) {
            team = brtcService.getTeam(teamId);
            team.setTeamLeader(teamMember);
            brtcService.update(team);
        }

        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo=" + team.getProject().getFileNo());
    }

    @RequestMapping(value = "/deleteTeamMember.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteTeamMember(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        TeamMember member = brtcService.getTeamMember(id);
        User user = member.getTeamMember();
        user.getMemberList().remove(member);
        Team team = member.getTeam();
        team.getTeamMemberList().remove(member);
        if (member.getMemberType() == 0) {
            team.setTeamLeader(null);
            brtcService.update(team);
        }
        try {
            brtcService.delete(member);
            map.put("success", "true");
        } catch (Exception e) {
            map.put("success", "false");
            map.put("msg", "<b>Note : </b><br/>This member already engaged with too much miscellaneous project relevant data.");
        }
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping(value = "/updateTeamMember.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String updateTeamMember(@RequestParam("array") String dataArray) {
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        String[] data = dataArray.split(",");
        TeamMember member = brtcService.getTeamMember(Long.parseLong(data[0]));

        try {
            if (data[data.length - 1].equals("activateDeactivate")) {
                boolean isActive = member.isActive();
                if (isActive) {
                    member.setActive(false);
                    member.setInactiveDate(new Date());
                    brtcService.update(member);
                } else {
                    member.setActive(true);
                    member.setActiveDate(new Date());
                    member.setInactiveDate(null);
                    brtcService.update(member);
                }
            } else {
                //TODO. for other property update
            }
            map.put("success", "true");
        } catch (Exception e) {
            map.put("success", "false");
            map.put("msg", "<b>Note : </b><br/>This consultant already engaged with too much miscellaneous project relevant data.");
        }
        String json = gson.toJson(map);
        return json;
    }


    //========== Negotiate Team ==========================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createNegotiateTeam.buet")
    public ModelAndView createNegotiateTeam(@RequestParam("projectId") Long projectId) {
        BRTCProject project = brtcService.getBrtcProject(projectId);
        NegotiateTeam team = new NegotiateTeam();
        team.setProject(project);
        team.setActive(true);
        team.setAssignDate(new Date());
        team.setRecordDate(new Date());
        team.setOperator(new CurrentUserCredentials().user);
        brtcService.save(team);
        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo=" + project.getFileNo());
    }

    //========== Consultant ==========================================================
    //Ajax Call
    @RequestMapping(value = "/checkDuplicateConsultant.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String checkDuplicateConsultant(@RequestParam("negoTeamId") Long negoTeamId,
                                    @RequestParam("consultantId") Long consultantId) {
        NegotiateTeam team = brtcService.getNegotiateTeam(negoTeamId);
        User member = userDetailsService.getUser(consultantId);
        Consultant consultantDuplicate = brtcService.getConsultant(team, member);
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        if (consultantDuplicate != null) {
            map.put("msg", "Yes");
            map.put("memberName", consultantDuplicate.getConsultant().getToken().getUserDetails().getName());
            String memberType[] = {"Team Leader", "Member"};
            map.put("memberType", memberType[consultantDuplicate.getType()]);
        } else {
            map.put("msg", "No");
        }
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveConsultant.buet")
    public ModelAndView saveConsultant(@RequestParam("negoTeamId") Long negoTeamId,
                                       @RequestParam("consultantId") Long consultantId,
                                       @RequestParam("consultantTypeIndex") Integer consultantTypeIndex,
                                       @RequestParam("notes") String note) {
        NegotiateTeam negotiateTeam = brtcService.getNegotiateTeam(negoTeamId);
        User member = userDetailsService.getUser(consultantId);
        BRTCProject project = negotiateTeam.getProject();

        if (consultantTypeIndex == 0) {
            List<Consultant> consultantList = negotiateTeam.getConsultantList();
            for (Consultant consultant : consultantList) {
                if (consultant.getType() == 0) {
                    consultant.setType(1);
                    brtcService.update(consultant);
                }
            }
        }

        Consultant consultant = new Consultant();
        consultant.setNegotiateTeam(negotiateTeam);
        consultant.setConsultant(member);
        consultant.setOperator(new CurrentUserCredentials().user);
        consultant.setRecordDate(new Date());
        consultant.setActiveDate(new Date());
        consultant.setActive(true);
        consultant.setType(consultantTypeIndex);
        consultant.setNote(note);

        negotiateTeam.getConsultantList().add(consultant);
        //TODO..  [No member can active in more than one project at a time]
        member.getConsultantList().add(consultant);
        brtcService.save(consultant);

        //To change Progress status along with FIRST Consultant adding
        List<Consultant> consultantList = brtcService.findAllConsultant(negotiateTeam);
        if (consultantList.size() <= 1) {
            brtcService.changeProjectStatus(project, "progress", 1);

            //To activate a newly created project
            project.setActive(true);
            String notes = ("Project Assigned to " + member.getToken().getUserDetails().getName() + " on " + new SimpleDateFormat("dd/MM/yyyy").format(new Date()));
            brtcService.createProjectHistory(project, notes);
        }

        if (consultantTypeIndex == 0) {
            negotiateTeam = brtcService.getNegotiateTeam(negoTeamId);
            negotiateTeam.setTeamLeader(member);
            brtcService.update(negotiateTeam);
        }
        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo=" + negotiateTeam.getProject().getFileNo());
    }

    @RequestMapping(value = "/deleteConsultant.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteConsultant(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        Consultant consultant = brtcService.getConsultant(id);
        User user = consultant.getConsultant();
        user.getConsultantList().remove(consultant);
        NegotiateTeam negotiateTeam = consultant.getNegotiateTeam();
        negotiateTeam.getConsultantList().remove(consultant);

        try {
            brtcService.delete(consultant);
            map.put("success", "true");
        } catch (Exception e) {
            map.put("success", "false");
            map.put("msg", "<b>Note : </b><br/>This consultant already engaged with too much miscellaneous project relevant data.");
        }
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping(value = "/updateConsultant.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String updateConsultant(@RequestParam("array") String dataArray) {
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();
        String[] data = dataArray.split(",");
        Consultant consultant = brtcService.getConsultant(Long.parseLong(data[0]));

        try {
            if (data[data.length - 1].equals("activateDeactivate")) {
                boolean isActive = consultant.isActive();
                if (isActive) {
                    consultant.setActive(false);
                    consultant.setInactiveDate(new Date());
                    brtcService.update(consultant);
                } else {
                    consultant.setActive(true);
                    consultant.setActiveDate(new Date());
                    consultant.setInactiveDate(null);
                    brtcService.update(consultant);
                }
            } else {
                //TODO. for other property update
            }
            map.put("success", "true");
        } catch (Exception e) {
            map.put("success", "false");
            map.put("msg", "<b>Note : </b><br/>This consultant already engaged with too much miscellaneous project relevant data.");
        }
        String json = gson.toJson(map);
        return json;
    }

    //========== Client ==========================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createClient.buet")
    public ModelAndView createClient() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Client");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        //map.put("today", new TheDates().getTodaySmart());
        //map.put("user", new CurrentUserCredentials().user.getToken().getUserDetails().getName());
        return new ModelAndView("brtc/client_create", map);
    }

    //Ajax Call
    @RequestMapping(value = "/checkDuplicateClient.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String checkDuplicateClient(@RequestParam("findFor") String findFor) {
        List<Client> clientList = brtcService.findAllClient(findFor);
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        if (clientList != null) {
            map.put("success", "got");
            String msg = "<table class=\"table table-bordered table-hover table-striped\"><tr><td>Client ID</td><td>Client Name</td></tr>";
            for (Client c : clientList) {
                msg += "<tr><td>" + c.getId() + "</td><td>" + c.getName() + "</td></tr>";
            }
            map.put("msg", msg + "</table>");
        } else {
            map.put("success", "not");
        }
        return gson.toJson(map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveClient.buet")
    public ModelAndView saveClient(@RequestParam("name") String name,
                                   @RequestParam("phone") String phone,
                                   @RequestParam("email") String email,
                                   @RequestParam("address") String address,
                                   @RequestParam("fax") String fax,
                                   @RequestParam("description") String description,
                                   @RequestParam("spokesMan") String spokesMan,
                                   @RequestParam("spokesManCell") String spokesManCell) {
        //TODO...  Client Duplicate
        Client client = new Client();
        client.setName(name);
        client.setPhone(MakString.getDashOnEmpty(phone));
        client.setFax(MakString.getDashOnEmpty(fax));
        client.setEmail(MakString.getDashOnEmpty(email));
        client.setAddress(MakString.getDashOnEmpty(address));
        client.setDescription(MakString.getDashOnEmpty(description));
        client.setSpokesMan(MakString.getDashOnEmpty(spokesMan));
        client.setSpokesManCell(MakString.getDashOnEmpty(spokesManCell));
        //client.setOperator(new CurrentUserCredentials().user);
        client.setRecordDate(new Date());
        brtcService.save(client);

        Map<String, String> map = new HashMap<String, String>();
        map.put("findFor", "All");
        return new ModelAndView("redirect:/brtc/clientList.buet", map);
    }

    @RequestMapping(value = "/deleteClient.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteClient(@RequestParam("id") Long id) {
        Client client = brtcService.getClient(id);
        int numProject = client.getProjectList().size();
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        if (numProject <= 0) {
            brtcService.delete(client);
            map.put("success", "yes");
        } else {
            map.put("success", "no");
            map.put("msg", "<b>Note : </b><br/>This client already engaged with " + numProject +
                    " project" + (numProject <= 1 ? "." : "s.").toString());
        }
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/clientList.buet")
    public ModelAndView clientList(@RequestParam("findFor") String findFor) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Client");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        List<Client> clientList;
        if (findFor.toUpperCase().equals("ALL")) {
            clientList = brtcService.findAllClient();
        } else {
            clientList = brtcService.findAllClient(findFor);
        }
        map.put("clientList", clientList);
        map.put("searchText", findFor);

        return new ModelAndView("/brtc/client_list", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/editClient.buet")
    public ModelAndView editClient(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Client");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        Client client = brtcService.getClient(id);
        map.put("client", client);

        map.put("user", new CurrentUserCredentials().user.getToken().getUserDetails().getName());
        return new ModelAndView("/brtc/client_edit", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateClient.buet")
    public ModelAndView updateClient(@RequestParam("id") Long id,
                                     @RequestParam("phone") String phone,
                                     @RequestParam("email") String email,
                                     @RequestParam("address") String address,
                                     @RequestParam("fax") String fax,
                                     @RequestParam("description") String description,
                                     @RequestParam("spokesMan") String spokesMan,
                                     @RequestParam("spokesManCell") String spokesManCell) {
        Client client = brtcService.getClient(id);
        client.setPhone(MakString.getDashOnEmpty(phone));
        client.setFax(MakString.getDashOnEmpty(fax));
        client.setEmail(MakString.getDashOnEmpty(email));
        client.setAddress(MakString.getDashOnEmpty(address));
        client.setDescription(MakString.getDashOnEmpty(description));
        client.setSpokesMan(MakString.getDashOnEmpty(spokesMan));
        client.setSpokesManCell(MakString.getDashOnEmpty(spokesManCell));
        client.setOperator(new CurrentUserCredentials().user);
        brtcService.update(client);
        return new ModelAndView("redirect:/brtc/editClient.buet?id=" + id);
    }

    //========== Client Payment ==========================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createClientPayment.buet")
    public ModelAndView createClientPayment(@RequestParam("for") String forWhat) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "PA");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        List<Client> clientList = brtcService.findAllClient();
        map.put("clientList", clientList);
        List<BRTCProject> projectList = brtcService.findAllBrtcProject();
        map.put("projectList", projectList);
        if (forWhat.equals("new")) {
            map.put("fileNo", "");
        } else {
            map.put("fileNo", forWhat);
        }
        map.put("today", new TheDates().getTodaySmart());
        map.put("user", new CurrentUserCredentials().user.getToken().getUserDetails().getName());
        return new ModelAndView("brtc/client_payment_create", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/saveClientPayment.buet")
    public
    @ResponseBody
    String saveClientPayment(@RequestParam("brtcNo") String brtcNo,
                             @RequestParam("fileNo") String fileNo,
                             @RequestParam("depositNo") String depositNo,
                             @RequestParam("refNo") String refNo,
                             @RequestParam("chequeDetails") String chequeDetails,
                             @RequestParam("amount") Double amount) {
        Gson gson = new Gson();
        Map<String, String> map = new HashMap<String, String>();

        ClientPayment paymentDuplicate = brtcService.getClientPayment(brtcNo);
        if (paymentDuplicate != null) {
            map.put("success", "No");
            map.put("msg", "This BRTC No already exists belongs file-" + paymentDuplicate.getProject().getFileNo());
            return gson.toJson(map);
            //return new ModelAndView("redirect:/brtc/clientPaymentList.buet?status=0");
        } else {
            BRTCProject project = brtcService.getBrtcProject(fileNo);
            ClientPayment payment = new ClientPayment();
            payment.setBrtcNo(MakString.getDashOnEmpty(brtcNo));
            payment.setStatus(0);
            payment.setProject(project);
            payment.setDepositNo(MakString.getDashOnEmpty(depositNo));
            payment.setRefNo(MakString.getDashOnEmpty(refNo));
            payment.setChequeDetails(MakString.getDashOnEmpty(chequeDetails));
            payment.setAmount(amount);
            payment.setOperator(new CurrentUserCredentials().user);
            payment.setRecordDate(new Date());

            project.getClientPaymentList().add(payment);
            brtcService.save(payment);

            brtcService.createProjectHistory(project, "BDT. " + amount + "/= has been deposited on " + sdfdmy.format(new Date()) + ". Where BRTC No. " + brtcNo + ". Deposit No." + depositNo + ".");

            map.put("success", "Yes");
            return gson.toJson(map);
            //return new ModelAndView("redirect:/brtc/clientPaymentList.buet?findFor=all&status=0");
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateClientPayment.buet")
    public ModelAndView updateClientPayment(@RequestParam("brtcNo") String brtcNo,
                                            @RequestParam("mrNo") String mrNo,
                                            @RequestParam("encashDate") String encashDate) {
        //checkedBy, recordDate, operator
        ClientPayment payment = brtcService.getClientPayment(brtcNo);
        payment.setMrNo(MakString.getDashOnEmpty(mrNo));
        payment.setStatus(1);
        payment.setEncashDate(MakDate.toDate(encashDate));
        payment.setOperator(new CurrentUserCredentials().user);
        brtcService.update(payment);

        ProjectStatus projectStatus = payment.getProject().getProjectStatus();
        projectStatus.setFinancialStatus(1);
        brtcService.update(projectStatus);

        brtcService.createProjectHistory(payment.getProject(), "BRTC No. " + brtcNo + " encashed. Encash Date: " + sdfdmy.format(MakDate.toDate(encashDate)) + ". Money Receipt No. " + mrNo);

        return new ModelAndView("redirect:/brtc/clientPaymentList.buet?findFor="+payment.getBrtcNo()+"&status="+payment.getStatus());
    }

    @RequestMapping(method = RequestMethod.GET, value = "/clientPaymentList.buet")
    public ModelAndView clientPaymentList(@RequestParam("findFor") String findFor,
                                          @RequestParam("status") Integer status) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Client Payment");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
       //findFor=all&status=2
        //status=3&findFor=2014
        List<ClientPayment> paymentList = null;
        if (findFor.toUpperCase().equals("ALL")) {
            paymentList = brtcService.findAllClientPayment();
        }else if (!findFor.toUpperCase().equals("ALL")) {
            paymentList = brtcService.findAllClientPayment(findFor);
            //System.out.println("paymentList.size() = " + paymentList.size());
        }else if (!findFor.toUpperCase().equals("ALL") && status != 3) {
            //Temporary code this line below
            paymentList = brtcService.findAllClientPayment();

        } else {
            ClientPayment payment = brtcService.getClientPayment(findFor);
            if (payment != null) {
                paymentList = new ArrayList<ClientPayment>();
                paymentList.add(payment);
                status = payment.getStatus();
            }
        }
        map.put("status", status);
        map.put("findFor", findFor);
        map.put("paymentList", paymentList);

        return new ModelAndView("/brtc/client_payment_list", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/checkClientPayment.buet")
    public ModelAndView checkClientPayment(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Client Payment");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        ClientPayment clientPayment = brtcService.getClientPayment(id);
        clientPayment.setCheckedBy(new CurrentUserCredentials().user);
        clientPayment.setStatus(2);
        brtcService.update(clientPayment);
        return new ModelAndView("redirect:/brtc/clientPaymentList.buet?findFor="+clientPayment.getBrtcNo()+"&status=3");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/deleteClientPayment.buet")
    public ModelAndView deleteClientPayment(@RequestParam("id") Long id) {
        ClientPayment clientPayment = brtcService.getClientPayment(id);
        BRTCProject project = clientPayment.getProject();
        project.getClientPaymentList().remove(clientPayment);
        brtcService.delete(clientPayment);
        return new ModelAndView("redirect:/brtc/clientPaymentList.buet?findFor=all&status=0");
    }

    //To updateProject all status (Financial, Progress, Distribution)
    @RequestMapping(method = RequestMethod.GET, value = "/updateProjectStatus.buet")
    public ModelAndView updateProjectStatus(@RequestParam("statusId") Long statusId,
                                            @RequestParam("fileNo") String fileNo,
                                            @RequestParam("type") String type,
                                            @RequestParam("statusIndex") Integer statusIndex) {
        //ProjectStatus status = brtcService.getProjectStatus(statusId);
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        if (type.toUpperCase().equals("PROGRESS")) {
            brtcService.createProjectHistory(project, "Progress status change to " + progressStatusArray[statusIndex]);
        } else if (type.toUpperCase().equals("FINANCIAL")) {
            brtcService.createProjectHistory(project, "Financial status change to \"" + financialStatusArray[statusIndex] + "\"");
            //TODO.. Dynamically add History and add a menu to Update
        } else if (type.toUpperCase().equals("DISTRIBUTION")) {
            brtcService.createProjectHistory(project, "Distribution status change to \"" + distributionStatusArray[statusIndex] + "\"");
        }
        brtcService.changeProjectStatus(project, type, statusIndex);
        //brtcService.update(status);
        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo=" + fileNo);
    }


    @RequestMapping(method = RequestMethod.POST, value = "/saveProjectHistory.buet")
    public ModelAndView saveProjectHistory(@RequestParam("fileNo") String fileNo,
                                           @RequestParam("historyNote") String historyNote) {
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        brtcService.createProjectHistory(project, historyNote);
        return new ModelAndView("redirect:/brtc/viewBrtcProject.buet?fileNo=" + fileNo);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/projectHistoryList.buet")
    public ModelAndView projectHistoryList(@RequestParam("fileNo") String fileNo) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Project History");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        map.put("fileNo", fileNo);
        List<ProjectHistory> historyList;
        if (fileNo.toUpperCase().equals("ALL")) {
            historyList = brtcService.findAllProjectHistory();
            map.put("fileNo", "ALL");
        } else {
            BRTCProject project = brtcService.getBrtcProject(fileNo);
            map.put("project", project);
            historyList = project == null ? null : project.getHistoryList();
            if (historyList != null) {
                Comparator<ProjectHistory> comparator = new Comparator<ProjectHistory>() {
                    public int compare(ProjectHistory c1, ProjectHistory c2) {
                        return Integer.parseInt(c2.getId() + "")
                                - Integer.parseInt(c1.getId() + "");
                    }
                };
                Collections.sort(historyList, comparator);
            } else {
                map.put("historyList", null);
                return new ModelAndView("/brtc/project_history_list", map);
            }
        }

        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Map<String, String> listMap;
        for (ProjectHistory history : historyList) {
            listMap = new HashMap<String, String>();
            listMap.put("recordDate", sdfdmy.format(history.getRecordDate()));
            listMap.put("note", history.getNote());
            listMap.put("createdBy", history.getCreatedBy().getToken().getUserDetails().getName());
            listMap.put("before", MakDate.timeDiffToStringToMin(MakDate.computeDiff(history.getRecordDate(), new Date())));
            list.add(listMap);
        }
        //TODO. project.getHistoryList();
        map.put("historyList", list);
        return new ModelAndView("/brtc/project_history_list", map);
    }

    //========== Payment Request =====================================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createPaymentRequest.buet")
    public ModelAndView createPaymentRequest() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Payment Request");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        List<Client> clientList = brtcService.findAllClient();
        map.put("clientList", clientList);
        List<BRTCProject> projectList = brtcService.findAllBrtcProject();
        map.put("projectList", projectList);

        map.put("today", new TheDates().getTodaySmart());
        map.put("user", new CurrentUserCredentials().user.getToken().getUserDetails().getName());
        return new ModelAndView("brtc/payment_request_create", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/savePaymentRequest.buet")
    public ModelAndView savePaymentRequest(@RequestParam("fileNumber") String fileNo,
                                           @RequestParam("inFavourOf") String inFavourOf,
                                           @RequestParam("brtcNumber") String brtcNumber,
                                           @RequestParam("amount") Double amount,
                                           @RequestParam("purposes") String purposes) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Payment Request");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        User user = new CurrentUserCredentials().user;
        inFavourOf = inFavourOf.toUpperCase().equals("SELF") ? user.getToken().getUserDetails().getName() : inFavourOf;
        BRTCProject project = brtcService.getBrtcProject(fileNo);

        PaymentRequest paymentRequest = new PaymentRequest();
        paymentRequest.setProject(project);
        paymentRequest.setAmount(amount);
        paymentRequest.setPurposes(purposes);
        paymentRequest.setInFavourOf(inFavourOf);
        paymentRequest.setBrtcNumber(brtcNumber);
        paymentRequest.setStatus(0);
        paymentRequest.setAppliedBy(user);
        paymentRequest.setApplyDate(new Date());
        project.getPaymentRequestList().add(paymentRequest);

        brtcService.save(paymentRequest);
        return new ModelAndView("redirect:/brtc/paymentRequestList.buet?status=0", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updatePaymentRequest.buet")
    public ModelAndView updatePaymentRequest(@RequestParam("brtcNo") String brtcNo,
                                             @RequestParam("mrNo") String mrNo,
                                             @RequestParam("encashDate") String encashDate) {
        //checkedBy, recordDate, operator
        ClientPayment payment = brtcService.getClientPayment(brtcNo);
        payment.setMrNo(mrNo);
        payment.setStatus(1);
        payment.setEncashDate(new TheDates().toDate(encashDate));
        payment.setOperator(new CurrentUserCredentials().user);
        brtcService.update(payment);

        ProjectStatus projectStatus = payment.getProject().getProjectStatus();
        projectStatus.setFinancialStatus(1);
        brtcService.update(projectStatus);

        return new ModelAndView("redirect:/brtc/paymentRequestList.buet?status=0");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/paymentRequestList.buet")
    public ModelAndView paymentRequestList(@RequestParam("status") Integer status) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Payment Request");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        List<PaymentRequest> requestList = brtcService.findAllPaymentRequest(status);
        map.put("status", status);

        map.put("requestList", requestList);

        return new ModelAndView("/brtc/payment_request_list", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/viewPaymentRequest.buet")
    public ModelAndView viewPaymentRequest(@RequestParam("AprId") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Payment Request");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        PaymentRequest request = brtcService.getPaymentRequest(id);
        map.put("request", request);

        try {
            List<PaymentRequest> requestList = request.getProject().getPaymentRequestList();
            map.put("requestList", requestList);
            map.put("encashed", brtcService.getTotalClientPayment(request.getProject(), 1));
            return new ModelAndView("brtc/payment_request_view", map);
        } catch (NullPointerException e) {
            return new ModelAndView("brtc/payment_request_view", map);
        }

    }


    @RequestMapping(value = "/deletePaymentRequest.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String deletePaymentRequest(@RequestParam("id") Long id) {
        PaymentRequest request = brtcService.getPaymentRequest(id);
        BRTCProject project = request.getProject();
        Long currentUserId = new CurrentUserCredentials().authorizeId;
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();

        if (request.getStatus() == 2) {
            map.put("msg", "Can't be delete ! <br/> This payment has already been Accepted");
        } else if (request.getStatus() == 3) {
            map.put("success", false);
            map.put("msg", "Can't be delete ! <br/> This payment has already been paid");
        } else {
            if (request.getStatus() < 2 && request.getAppliedBy().getAuthorizeId() == currentUserId) {
                map.put("success", brtcService.delete(request, project));
                map.put("msg", "Payment Request has been deleted");
            } else {
                map.put("success", false);
                map.put("msg", "Can't be delete ! <br/> This is requested by " + request.getAppliedBy().getToken().getUserDetails().getName());
            }
        }
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping("/ajax.buet")
    public ModelAndView helloAjaxTest() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Payment Request");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        map.put("message", "Crunchify Spring MVC with Ajax and JQuery Demo..");
        return new ModelAndView("/brtc/ajax", map);//"message", "Crunchify Spring MVC with Ajax and JQuery Demo..");
    }

    @RequestMapping(value = "/ajaxTest.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String getTime() {

        Random rand = new Random();
        float r = rand.nextFloat() * 100;
        String result = "<br>Next Random # is <b>" + r + "</b>. Generated on <b>" + new Date().toString() + "</b>";
        System.out.println("Debug Message from CrunchifySpringAjaxJQuery Controller.." + new Date().toString());
        return r + "";
    }


    @RequestMapping(value = "signPaymentRequest.buet", method = RequestMethod.POST)
    public
    @ResponseBody
    String signPaymentRequest(@RequestParam("id") final Long id,
                              @RequestParam("signFor") final String signFor) {
        Gson gson = new Gson();
        User user = new CurrentUserCredentials().user;
        PaymentRequest request = brtcService.getPaymentRequest(id);
        if (signFor.equals("COUNTER")) {
            request.setCounteredBy(user);
            request.setStatus(1);
        } else if (signFor.equals("APPROVE")) {
            request.setAcceptedBy(user);
            request.setStatus(2);
        } else if (signFor.equals("RECEIVE")) {
            request.setReceivedBy(user);
            request.setStatus(3);
            request.setReceiveDate(new Date());
            request.setReceivingNote("Check received on " + new Date());
        }

        brtcService.update(request);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", user.getToken().getUserDetails().getName());
        String json = gson.toJson(map);
        return json;
    }

    //Distribution
    @RequestMapping(value = "/createDistribution.buet", method = RequestMethod.GET)
    public ModelAndView createDistribution(@RequestParam("fileNo") String fileNo) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Payment Request");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        Toolkit.getDefaultToolkit().beep();
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        Toolkit.getDefaultToolkit().beep();
        List<Map<String, String>> teacherList = brtcService.getAllTeacher(project);
        map.put("teacherList", teacherList);
        map.put("fileNo", fileNo);

        List<ClientPayment> paymentList = project.getClientPaymentList();
        String select = "<select class=\"form-control\" name=\"brtcNos\" id=\"brtcNos\">";
        if (paymentList.size() > 0) select += "<option value=\"null\">--Select a BRTC No--</option> ";
        else select += "<option value=\"No BRTC\">No BRTC</option>";
        for (ClientPayment cp : paymentList) {
            select += "<option value=\"" + cp.getBrtcNo() + "\">" + cp.getBrtcNo() + "</option>";
        }
        map.put("brtcNos", select + "</select>");
        map.put("project", project);
        return new ModelAndView("brtc/distribution_create", map);
    }


    @RequestMapping(value = "/saveDistribution.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String saveDistribution(@RequestParam("totalAmount") String totalAmount,
                            @RequestParam("advances") String advances,
                            @RequestParam("consultantFeesTotal") String consultantFeesTotal,
                            @RequestParam("others") String others,
                            @RequestParam("consultantFees") String consultantFees,
                            @RequestParam("consultantIds") String consultantIds,
                            @RequestParam("fileNo") String fileNo,
                            @RequestParam("brtcNos") String brtcNos) {
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        int totalDist = project.getDistributionList().size();
        Date distDate = new Date();
        Distribution distribution = new Distribution();
        distribution.setProject(project);
        distribution.setBrtcNos(brtcNos);
        distribution.setTotalAmount(parseMe(totalAmount));
        distribution.setAdvances(parseMe(advances));
        distribution.setConsultantFees(parseMe(consultantFeesTotal));
        distribution.setOthers(parseMe(others));
        //TODO .. setting Distribution date
        distribution.setDistributionDate(distDate);
        distribution.setRecordDate(new Date());
        distribution.setOperator(new CurrentUserCredentials().user);
        project.getDistributionList().add(distribution);

        brtcService.save(distribution);

        String[] feesArray = consultantFees.split(",");
        String[] idArray = consultantIds.split(",");

        Receiver receiver;
        for (int i = 0; i < feesArray.length; i++) {
            receiver = new Receiver();
            receiver.setReceive(true);//TODO...
            receiver.setAmount(parseMe(feesArray[i]));
            receiver.setReceivingDate(new Date());

            receiver.setDistribution(distribution);

            TeamMember member = brtcService.getTeamMember(Long.parseLong(idArray[i]));
            receiver.setTeamMember(member);

            User user = member.getTeamMember();
            receiver.setSanctionFor(user);

            member.getReceiverList().add(receiver);
            user.getReceiverList().add(receiver);
            distribution.getReceiverList().add(receiver);
            try {
                brtcService.save(receiver);
                map.put("success", "yes");

            } catch (Exception ex) {
                map.put("success", "no");
            }
        }
        if (totalDist == 0) {
            brtcService.changeProjectStatus(project, "distribution", 1);
            brtcService.createProjectHistory(brtcService.getBrtcProject(fileNo), "Distributed an amount of Tk." + totalAmount + "/= on " + sdfdmy.format(distDate) + ".");
        }

        map.put("msg", "Distribution saved successfully ! <br/>" +
                "Click <a href='/brtc/brtc/distributionList.buet?fileNo=" + fileNo + "'>here</a> " +
                "to view all distribution");
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping(method = RequestMethod.GET, value = "/distributionList.buet")
    public ModelAndView distributionList(@RequestParam("fileNo") String fileNo) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Distribution List");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);

        List<Distribution> distributionList;
        if (fileNo.toUpperCase().equals("ALL")) {
            distributionList = brtcService.findAllDistribution();
        } else {
            BRTCProject project = brtcService.getBrtcProject(fileNo);
            distributionList = brtcService.findAllDistribution(project);
        }
        map.put("distList", distributionList);

        return new ModelAndView("/brtc/distribution_list", map);
    }

    public static Double parseMe(String s) {
        try {
            return Double.parseDouble(s);
        } catch (Exception pe) {
            return 0.0;
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/createBrtcMsg.buet")
    public ModelAndView createBrtcMsg() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Create Message");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        map.put("sender", CurrentUserCredentials.staticUser);
        List<User> teacherList = userDetailsService.getAllTeacher();
        //System.out.println("userList.size() = " + teacherList.size());
        map.put("userList", teacherList);
        map.put("msg", "");
        return new ModelAndView("/brtc/msg_create", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveBrtcMsg.buet")
    public ModelAndView saveBrtcMsg(@RequestParam("content") String content,
                                    @RequestParam("receiverId") Long receiverId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Create Message");
        map.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        map.put("msg", "");



        BrtcMsg message = new BrtcMsg();
        message.setContent("Hi");
        brtcService.save(message);



        map.put("sender", CurrentUserCredentials.staticUser);
        List<User> teacherList = userDetailsService.getAllTeacher();
        //System.out.println("userList.size() = " + teacherList.size());
        map.put("userList", teacherList);
        return new ModelAndView("/brtc/msg_create", map);
    }


}
