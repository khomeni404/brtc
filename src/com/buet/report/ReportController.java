
package com.buet.report;


import bd.com.softengine.util.MakDate;
import com.buet.brtc.model.*;
import com.buet.brtc.service.BRTCService;
import com.buet.hrm.model.UserDetails;
import com.buet.hrm.service.HRMService;
import com.buet.report.service.ReportService;
import com.buet.security.model.User;
import com.buet.security.service.UserDetailsService;
import com.buet.util.ERPConstants;
import com.google.gson.Gson;
import jxl.Workbook;
import jxl.write.*;
import jxl.write.Number;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/report/")
public class ReportController {
    @Autowired
    ReportService reportService;
    @Autowired
    BRTCService brtcService;
    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    HRMService hrmService;

    public String[] progressStatusArray = {"Not Assigned", "Assigned", "No Response", "Negotiating", "Negotiation Failed", "Running", "Stopped", "Completed", "Others"};
    public String[] financialStatusArray = {"No deposit", "Partial deposit", "Full deposit", "Others"};
    public String[] distributionStatusArray = {"No distribution", "Partial distributed", "Full distributed", "Others"};
    public String[] consultantTypeArray = {"Leader", "Member", "Other"};
    public String[] memberTypeArray = {"Leader", "Member", "Other"};
    public SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

    @RequestMapping(method = RequestMethod.GET, value = "/reportHome.buet")
    public ModelAndView reportHome() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Report Home");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);
        List<BRTCProject> projectList = brtcService.findAllBrtcProject();
        map.put("projectList", projectList);

        List<User> teacherList = userDetailsService.getAllTeacher();
        map.put("teacherList", teacherList);
        return new ModelAndView("/report/report_home", map);
    }


    @RequestMapping(value = "/paymentRequest.buet", method = RequestMethod.GET)
    @ResponseBody
    public void paymentRequest(HttpServletResponse response,
                               @RequestParam("APRId") Long APRId)
            throws JRException, IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Map<String, Object> params = new HashMap<String, Object>();
        PaymentRequest pr = brtcService.getPaymentRequest(APRId);
        params.put("RequestedBy", pr.getAppliedBy().getToken().getUserDetails().getName());
        params.put("RequestedOn", sdf.format(pr.getApplyDate()));
        params.put("InFavourOf", pr.getInFavourOf());
        params.put("CounteredBy", pr.getCounteredBy() == null ? "-------------------" : pr.getCounteredBy().getToken().getUserDetails().getName());
        params.put("ApprovedBy", pr.getAcceptedBy() == null ? "-------------------" : pr.getAcceptedBy().getToken().getUserDetails().getName());
        params.put("ReceivedBy", pr.getReceivedBy() == null ? "-------------------" : pr.getReceivedBy().getToken().getUserDetails().getName());

        params.put("Amount", pr.getAmount() + "");
        params.put("FileNo", pr.getProject().getFileNo());
        params.put("ProjectName", pr.getProject().getProjectTitle());
        params.put("BrtcNo", pr.getBrtcNumber());
        params.put("Purposes", pr.getPurposes());
        //params.put("PreviousAdvance", "todo..");


        List<PaymentRequest> requestList = pr.getProject().getPaymentRequestList();
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        Double totalAdvance = 0.0;
        for (PaymentRequest request : requestList) {
            if (request.getAppliedBy() == pr.getAppliedBy() && request.getReceivedBy() != null && pr != request) {
                map = new HashMap<String, String>();
                map.put("Date", sdf.format(request.getReceiveDate()));
                map.put("Amount", request.getAmount() + "");
                totalAdvance += request.getAmount();
                dataList.add(map);
            }
        }
        if (totalAdvance == 0.0) {
            map = new HashMap<String, String>();
            map.put("Date", "---");
            map.put("Amount", "---");
            dataList.add(map);
        }
        params.put("PreviousAdvance", totalAdvance + "");

        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", "Payment Request");
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "PaymentRequest", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/teacherProjects.buet", method = RequestMethod.GET)
    @ResponseBody
    public void teacherProjects(HttpServletResponse response,
                                @RequestParam("deptId") Long deptId,
                                @RequestParam("teacherId") Long teacherId) throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        User teacher = userDetailsService.getUser(teacherId);
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;


        List<TeamMember> memberList = teacher.getMemberList();
        int totalProject = memberList.size();
        int asLeader = 0;
        int asMember = 0;
        int completed = 0;
        int running = 0;
        if (memberList.size() == 0) {
            map = new HashMap<String, String>();
            map.put("Serial", "---");
            map.put("FileNo", "---");
            map.put("ProjectTitle", "---");
            map.put("ActAs", "---");
            map.put("ProgStatus", "---");
            dataList.add(map);
        } else {
            int serial = 1;
            for (TeamMember member : memberList) {
                map = new HashMap<String, String>();
                BRTCProject p = member.getTeam().getProject();
                Integer ps = p.getProjectStatus().getProgressStatus();
                map.put("Serial", serial + "");
                map.put("FileNo", p.getFileNo());
                map.put("ProjectTitle", p.getProjectTitle());
                map.put("ActAs", memberTypeArray[member.getMemberType()]);
                map.put("ProgStatus", progressStatusArray[ps]);
                dataList.add(map);

                serial++;
                if (member.getMemberType().equals(0))
                    asLeader++;
                else if (member.getMemberType().equals(1))
                    asMember++;
                if (ps.equals(5))
                    running++;
                else if (ps.equals(7))
                    completed++;
            }
        }
        params.put("TotalProject", totalProject + "");
        params.put("AsLeader", asLeader + "");
        params.put("AsMember", asMember + "");
        params.put("Finished", completed + "");   //7
        params.put("Running", running + "");     //5

        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", "Teacher Project");
        params.put("Name", teacher.getToken().getUserDetails().getName());
        params.put("Department", hrmService.getDepartment(deptId).getName());
        params.put("Designation", hrmService.getDesignation(deptId).getName());
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "TeacherProjects", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/teacherFinance.buet", method = RequestMethod.GET)
    @ResponseBody
    public void teacherFinance(HttpServletResponse response,
                               @RequestParam("deptId") Long deptId,
                               @RequestParam("teacherId") Long teacherId) throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        User teacher = userDetailsService.getUser(teacherId);
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;


        List<TeamMember> memberList = teacher.getMemberList();
        int totalProject = memberList.size();
        double asLeader = 0.0;
        double asMember = 0.0;
        if (memberList.size() == 0) {
            map = new HashMap<String, String>();
            map.put("Serial", "---");
            map.put("FileNo", "---");
            map.put("ProjectTitle", "---");
            map.put("ActAs", "---");
            map.put("Amount", "---");
            map.put("ProgStatus", "");
            dataList.add(map);
        } else {
            int serial = 1;
            for (TeamMember member : memberList) {
                map = new HashMap<String, String>();
                BRTCProject p = member.getTeam().getProject();
                Integer ps = p.getProjectStatus().getProgressStatus();

                List<Receiver> receiverList = member.getReceiverList();
                double amount = 0.0;
                for (Receiver r : receiverList) {
                    if (r.getTeamMember().getMemberType().equals(0)) {
                        asLeader += r.getAmount();
                        amount += r.getAmount();
                    } else if (r.getTeamMember().getMemberType().equals(1)) {
                        asMember += r.getAmount();
                        amount += r.getAmount();
                    }
                }
                map.put("Serial", serial + "");
                map.put("FileNo", p.getFileNo());
                map.put("ProjectTitle", p.getProjectTitle());
                map.put("ActAs", memberTypeArray[member.getMemberType()]);
                map.put("Amount", amount + "/=");
                map.put("ProgStatus", progressStatusArray[ps]);
                dataList.add(map);
                serial++;
            }
        }
        params.put("TotalProject", totalProject + "");
        params.put("AsLeader", asLeader + "/=");
        params.put("AsMember", asMember + "/=");
        params.put("TotalReceived", asLeader + asMember + "/=");

        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Name", teacher.getToken().getUserDetails().getName());
        params.put("Department", hrmService.getDepartment(deptId).getName());
        params.put("Designation", hrmService.getDesignation(deptId).getName());
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "TeacherFinance", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/teachersProject.buet", method = RequestMethod.GET)
    @ResponseBody
    public void teachersProject(HttpServletResponse response, @RequestParam("deptId") Long deptId) throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        List<User> teacherList = userDetailsService.getAllTeacher();
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        for (User teacher : teacherList) {
            map = new HashMap<String, String>();
            UserDetails userDetails = teacher.getToken().getUserDetails();
            map.put("Name", userDetails.getName());
            int projects = 0;
            int negotiating = 0;
            int running = 0;
            int completed = 0;
            List<TeamMember> memberList = teacher.getMemberList();
            if (memberList.size() == 0) {
                map.put("Projects", projects + "");
                map.put("Negotiating", negotiating + "");
                map.put("Running", running + "");
                map.put("Completed", completed + "");
                map.put("Others", "0");
                dataList.add(map);
            } else {
                for (TeamMember member : memberList) {
                    Integer ps = member.getTeam().getProject().getProjectStatus().getProgressStatus();
                    if (ps.equals(3))
                        negotiating++;
                    else if (ps.equals(5))
                        running++;
                    else if (ps.equals(7))
                        completed++;
                    projects++;
                }
                map.put("Projects", projects + "");
                map.put("Negotiating", negotiating + "");
                map.put("Running", running + "");
                map.put("Completed", completed + "");
                map.put("Others", projects - negotiating - running - completed + "");
                dataList.add(map);
            }
        }
        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", "Teacher Project");
        params.put("Department", hrmService.getDepartment(deptId).getName());
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "TeachersProject", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/teachersProjectView.buet", method = RequestMethod.GET)
    public ModelAndView teachersProjectView(@RequestParam("deptId") Long deptId) {
        Map<String, Object> params = new HashMap<String, Object>();
        List<User> teacherList = userDetailsService.getAllTeacher();
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        for (User teacher : teacherList) {
            map = new HashMap<String, String>();
            UserDetails userDetails = teacher.getToken().getUserDetails();
            map.put("Name", userDetails.getName());
            map.put("Designation", userDetails.getDesignation().getName());
            int projects = 0;
            int negotiating = 0;
            int running = 0;
            int completed = 0;
            List<TeamMember> memberList = teacher.getMemberList();
            if (memberList.size() == 0) {
                map.put("Projects", projects + "");
                map.put("Negotiating", negotiating + "");
                map.put("Running", running + "");
                map.put("Completed", completed + "");
                map.put("Others", "0");
                dataList.add(map);
            } else {
                for (TeamMember member : memberList) {
                    Integer ps = member.getTeam().getProject().getProjectStatus().getProgressStatus();
                    if (ps.equals(3))
                        negotiating++;
                    else if (ps.equals(5))
                        running++;
                    else if (ps.equals(7))
                        completed++;
                    projects++;
                }
                map.put("Projects", projects + "");
                map.put("Negotiating", negotiating + "");
                map.put("Running", running + "");
                map.put("Completed", completed + "");
                map.put("Others", projects - negotiating - running - completed + "");
                dataList.add(map);
            }
        }
        params.put("DeptId", deptId);
        params.put("PageTitle", "Teachers Project");
        params.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        params.put("Department", hrmService.getDepartment(deptId).getName());
        params.put("dataList", dataList);
        return new ModelAndView("report/teacher/teachers_project_view", params);
    }

    @RequestMapping(value = "/teachersFinance.buet", method = RequestMethod.GET)
    @ResponseBody
    public void teachersFinance(HttpServletResponse response, @RequestParam("deptId") Long deptId) throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        List<User> teacherList = userDetailsService.getAllTeacher();
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        for (User teacher : teacherList) {
            map = new HashMap<String, String>();
            UserDetails userDetails = teacher.getToken().getUserDetails();
            map.put("Name", userDetails.getName());
            int projects = 0;
            int asLeader = 0;
            int asMember = 0;
            Double received = 0.0;
            List<TeamMember> memberList = teacher.getMemberList();
            if (memberList.size() == 0) {
                map.put("Projects", "0");
                map.put("AsLeader", "---");
                map.put("AsMember", "---");
                map.put("Received", "---");
                dataList.add(map);
            } else {
                for (TeamMember member : memberList) {
                    Integer type = member.getMemberType();
                    if (type.equals(0))
                        asLeader++;
                    else if (type.equals(1))
                        asMember++;
                    received += brtcService.getTotalReceived(member);
                    projects++;
                }
                map.put("Projects", projects + "");
                map.put("AsLeader", asLeader + "");
                map.put("AsMember", asMember + "");
                map.put("Received", Math.round(received) + "/=");
                dataList.add(map);
            }
        }
        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", "Teacher Finance");
        params.put("Department", hrmService.getDepartment(deptId).getName());
        params.put("RealPath", reportService.getRealPath("/"));
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        params.put("Date", sdf.format(new Date()));
        reportService.createReport(response, params, "TeachersFinance", dataSource); //new JREmptyDataSource()

    }

    @RequestMapping(value = "/teachersFinanceView.buet", method = RequestMethod.GET)
    public ModelAndView teachersFinanceView(@RequestParam("deptId") Long deptId) throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        List<User> teacherList = userDetailsService.getAllTeacher();
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        for (User teacher : teacherList) {
            map = new HashMap<String, String>();
            UserDetails userDetails = teacher.getToken().getUserDetails();
            map.put("Name", userDetails.getName());
            map.put("Designation", userDetails.getDesignation().getName());
            int projects = 0;
            int asLeader = 0;
            int asMember = 0;
            Double received = 0.0;
            List<TeamMember> memberList = teacher.getMemberList();
            if (memberList.size() == 0) {
                map.put("Projects", "0");
                map.put("AsLeader", "---");
                map.put("AsMember", "---");
                map.put("Received", "---");
                dataList.add(map);
            } else {
                for (TeamMember member : memberList) {
                    Integer type = member.getMemberType();
                    if (type.equals(0))
                        asLeader++;
                    else if (type.equals(1))
                        asMember++;
                    received += brtcService.getTotalReceived(member);
                    projects++;
                }
                map.put("Projects", projects + "");
                map.put("AsLeader", asLeader + "");
                map.put("AsMember", asMember + "");
                map.put("Received", Math.round(received) + "/=");
                dataList.add(map);
            }
        }
        params.put("DeptId", deptId);
        params.put("dataList", dataList);
        params.put("Department", hrmService.getDepartment(deptId).getName());
        params.put("RealPath", reportService.getRealPath("/"));
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        params.put("Date", sdf.format(new Date()));
        params.put("PageTitle", "Teachers Project");
        params.put("DashBoardLink", ERPConstants.DASHBOARD_LINK);
        return new ModelAndView("report/teacher/teachers_finance_view", params);
    }

    @RequestMapping(value = "/projectDetails.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectDetails(HttpServletResponse response,
                               @RequestParam("fileNo") String fileNo)
            throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        List<TeamMember> memberList = project.getTeam() == null ? null : project.getTeam().getTeamMemberList();
        if (memberList != null) {
            for (TeamMember tm : memberList) {
                UserDetails details = tm.getTeamMember().getToken().getUserDetails();
                map = new HashMap<String, String>();
                map.put("Name", details.getName() + "");
                map.put("Designation", details.getDesignation().getName() + "");
                map.put("Department", details.getDepartment().getName() + "");
                map.put("Act", tm.getMemberType() == 0 ? "Leader" : "Member");
                if (tm.isActive()) {
                    map.put("ActiveDate", sdf.format(tm.getActiveDate()) + "");
                    map.put("IsActive", "Active");
                    map.put("InactiveDate", "---");
                } else {
                    map.put("ActiveDate", "---");
                    map.put("IsActive", "Inactive");
                    if (tm.getInactiveDate() != null)
                        map.put("InactiveDate", sdf.format(tm.getInactiveDate()) + "");
                    else
                        map.put("InactiveDate", "---");
                }
                dataList.add(map);
            }
        } else {
            map = new HashMap<String, String>();
            map.put("Name", "---");
            map.put("Designation", "---");
            map.put("Department", "---");
            map.put("Act", "---");
            map.put("ActiveDate", "---");
            map.put("IsActive", "---");
            map.put("InactiveDate", "---");
            dataList.add(map);
        }
        Double projectFee = project.getFinalFee();
        Double totalReceived = brtcService.getTotalReceived(project);
        Double distributed = brtcService.getTotalDistributed(project);

        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", project.getProjectTitle() + "");
        params.put("FileNo", project.getFileNo() + "");
        params.put("EntryDate", sdf.format(project.getRecordDate()) + "");
        params.put("ProgressStatus", progressStatusArray[project.getProjectStatus().getProgressStatus()] + "");

        Client client = project.getClient();
        params.put("WorkingTeam", project.getTeam() == null ? "[ No Team Formed Yet ! ]" : project.getTeam().getId() + "");
        params.put("Client", client.getName() + "");
        params.put("Address", client.getAddress() + "");
        params.put("Contacts", client.getEmail() + ", " + client.getPhone());
        params.put("SpokesMan", client.getSpokesMan());
        params.put("SpokesCell", client.getSpokesManCell() + "");

        params.put("ProjectFee", projectFee + "/=");
        params.put("TotalReceived", totalReceived + "/=");
        params.put("Distributed", distributed + "/=");
        params.put("Distributions", project.getDistributionList().size() + "");
        params.put("Undistributed", totalReceived - distributed + "/=");
        params.put("Due", projectFee - totalReceived + "/=");

        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "ProjectDetails", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/projectHistory.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectHistory(HttpServletResponse response,
                               @RequestParam("fileNo") String fileNo)
            throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;

        List<ProjectHistory> historyList = project.getHistoryList();
        Comparator<ProjectHistory> comparator = new Comparator<ProjectHistory>() {
            public int compare(ProjectHistory c1, ProjectHistory c2) {
                return Integer.parseInt(c2.getId() + "") - Integer.parseInt(c1.getId() + "");
            }
        };
        Collections.sort(historyList, comparator);
        for (ProjectHistory history : historyList) {
            map = new HashMap<String, String>();
            map.put("RecordDate", sdf.format(history.getRecordDate()));
            map.put("Note", history.getNote());
            map.put("Author", history.getCreatedBy().getToken().getUserDetails().getName());
            dataList.add(map);
        }

        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", project.getProjectTitle() + "");
        params.put("FileNo", project.getFileNo() + "");
        params.put("Date", sdf.format(new Date()));
        params.put("ProgressStatus", progressStatusArray[project.getProjectStatus().getProgressStatus()] + "");

        Client client = project.getClient();
        params.put("Client", client.getName() + "");

        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "ProjectHistory", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/projectFinance.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectFinance(HttpServletResponse response,
                               @RequestParam("fileNo") String fileNo)
            throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        Double projectFee = project.getFinalFee();
        Double totalReceived = brtcService.getTotalReceived(project);
        Double paSubmitted = brtcService.getPaSubmittedAmount(project);
        Double distributed = 0.0;
        Double teacherFee = 0.0;
        Double departmentAdvance = 0.0;
        Double others = 0.0;
        List<Distribution> distributionList = project.getDistributionList();
        if (distributionList.size() == 0) {
            map = new HashMap<String, String>();
            map.put("Date", "No distribution found !");
            map.put("Name", "");
            map.put("Designation", "");
            map.put("Act", "");
            map.put("Amount", "");
            dataList.add(map);
        }
        for (Distribution distribution : distributionList) {
            map = new HashMap<String, String>();
            map.put("Date", sdf.format(distribution.getDistributionDate()));
            map.put("Name", "");
            map.put("Designation", "");
            map.put("Act", "");
            map.put("Amount", "");
            dataList.add(map);

            distributed += distribution.getTotalAmount();
            teacherFee += distribution.getConsultantFees();
            departmentAdvance += distribution.getAdvances();
            others += distribution.getOthers();
            List<Receiver> receiverList = distribution.getReceiverList();
            for (Receiver receiver : receiverList) {
                UserDetails teacher = receiver.getSanctionFor().getToken().getUserDetails();
                map = new HashMap<String, String>();
                map.put("Date", "");
                map.put("Name", teacher.getName());
                map.put("Designation", teacher.getDesignation().getName());
                map.put("Act", receiver.getTeamMember().getMemberType() == 0 ? "Leader" : "Member");
                map.put("Amount", receiver.getAmount() + "");
                dataList.add(map);
            }
        }
        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", project.getProjectTitle());
        params.put("FileNo", project.getFileNo());
        params.put("Client", project.getClient().getName());
        params.put("Distributions", distributionList.size() + "");
        params.put("ProjectFee", projectFee + "/=");
        params.put("TotalReceived", totalReceived + "/=");
        params.put("Distributed", distributed + "/=");
        params.put("TeacherFee", teacherFee + "/=");

        params.put("PaSubmitted", paSubmitted + "/=");
        params.put("DeptAdvances", departmentAdvance + "/=");
        params.put("Others", others + "/=");
        params.put("Undistributed", totalReceived - distributed + "/=");
        params.put("Due", projectFee - totalReceived + "/=");

        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "ProjectFinance", dataSource); //new JREmptyDataSource()
    }


    @RequestMapping(value = "/projectList.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectList(HttpServletResponse response, @RequestParam("deptId") Long deptId)
            throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        List<BRTCProject> projectList = brtcService.findAllBrtcProject();
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;
        for (BRTCProject project : projectList) {
            map = new HashMap<String, String>();
            map.put("FileNo", project.getFileNo());
            map.put("Title", project.getProjectTitle());
            map.put("FinalFee", project.getFinalFee() + "/=");
            map.put("Client", project.getClient().getName());
            map.put("Status", progressStatusArray[project.getProjectStatus().getProgressStatus()]);
            dataList.add(map);
        }
        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Department", hrmService.getDepartment(deptId).getName());
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "ProjectList", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/projectPayments.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectPayments(HttpServletResponse response, @RequestParam("fileNo") String fileNo)
            throws JRException, IOException {
        BRTCProject project = brtcService.getBrtcProject(fileNo);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("FileNo", project.getFileNo());
        params.put("Title", project.getProjectTitle());
        params.put("FinalFee", project.getFinalFee() + "/=");
        params.put("Client", project.getClient().getName());
        params.put("Status", progressStatusArray[project.getProjectStatus().getProgressStatus()]);
        params.put("Department", project.getDepartment().getName());
        List<ClientPayment> paymentList = project.getClientPaymentList();
        Map<String, String> map;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        if (paymentList.size() != 0) {
            for (ClientPayment p : paymentList) {
                map = new HashMap<String, String>();
                map.put("RecordDate", sdf.format(p.getRecordDate()));
                map.put("Amount", p.getAmount() + "/=");
                map.put("EnchashDate", p.getEncashDate() == null ? "---" : sdf.format(p.getEncashDate()));
                map.put("BrtcNo", p.getBrtcNo());
                map.put("MoneyReceipt", p.getMrNo() == null ? "---" : p.getMrNo());
                dataList.add(map);

            }
        } else {
            map = new HashMap<String, String>();
            ;
            map.put("RecordDate", "---");
            map.put("Amount", "---");
            map.put("EnchashDate", "---");
            map.put("BrtcNo", "---");
            map.put("MoneyReceipt", "---");
            dataList.add(map);
        }
        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);

        params.put("Date", sdf.format(new Date()));
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "ProjectPayments", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/projectListAccordingStatuses.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectListAccordingStatuses(HttpServletResponse response,
                                             @RequestParam("paramArr") String paramArr) throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        String[] param = paramArr.split(",");


        List<BRTCProject> projectList = brtcService.findAllBrtcProject();
        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;

        for (BRTCProject project : projectList) {
            boolean ps = param[0].equals("all") || project.getProjectStatus().getProgressStatus().toString().equals(param[0]);
            boolean fs = param[1].equals("all") || project.getProjectStatus().getFinancialStatus().toString().equals(param[1]);
            boolean ds = param[2].equals("all") || project.getProjectStatus().getDistributionStatus().toString().equals(param[2]);
            if (ps && fs && ds) {
                map = new HashMap<String, String>();
                Double received = brtcService.getTotalReceived(project);
                Double distributed = brtcService.getTotalDistributed(project);
                map.put("Name", project.getFileNo() + " : " + project.getProjectTitle());
                map.put("FinalFee", project.getFinalFee() + "/=");
                map.put("Received", received + "/=");
                map.put("Distributed", distributed + "/=");
                map.put("Undistributed", received - distributed + "/=");
                dataList.add(map);
            }

        }
        params.put("Progress", param[0].equals("all") ? "All" : progressStatusArray[Integer.parseInt(param[0])]);
        params.put("Financial", param[1].equals("all") ? "All" : financialStatusArray[Integer.parseInt(param[1])]);
        params.put("Distribution", param[2].equals("all") ? "All" : distributionStatusArray[Integer.parseInt(param[2])]);
        params.put("Department", "Civil Engineering (CE)");
        params.put("Date", "");
        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", "Project List");
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "ProjectListStatuses", dataSource); //new JREmptyDataSource()
    }


    @RequestMapping(value = "/projectListAccordingStatusesByDate.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectListAccordingStatusesByDate(HttpServletResponse response,
                                                   @RequestParam("paramArr") String paramArr) throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        String[] param = paramArr.split(",");
        Date startDate = MakDate.toDate(param[0]);
        Date endDate = MakDate.toDate(param[1]);
        String status = param[2];


        List<BRTCProject> projectList;
        if (status.equals("all")) {
            projectList = brtcService.findAllBrtcProject(startDate, endDate);
        } else {
            projectList = brtcService.findAllBrtcProject(startDate, endDate, Integer.parseInt(status));
        }


        List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
        Map<String, String> map;

        for (BRTCProject project : projectList) {
            map = new HashMap<String, String>();
            Double received = brtcService.getTotalReceived(project);
            Double distributed = brtcService.getTotalDistributed(project);
            map.put("Name", project.getFileNo() + " : " + project.getProjectTitle());
            map.put("FinalFee", project.getFinalFee() + "/=");
            map.put("Received", received + "/=");
            map.put("Distributed", distributed + "/=");
            map.put("Undistributed", received - distributed + "/=");
            dataList.add(map);
        }
        params.put("Progress", status.equals("all") ? "All" : progressStatusArray[Integer.parseInt(status)]);
        params.put("Department", "Civil Engineering (CE)");
        params.put("Date", sdf.format(new Date()));
        params.put("DateRange", sdf.format(startDate) + "   to   " + sdf.format(endDate));
        JRDataSource dataSource = new JRBeanCollectionDataSource(dataList);
        params.put("Title", "Project List");
        params.put("RealPath", reportService.getRealPath("/"));
        reportService.createReport(response, params, "ProjectListStatusesByDate", dataSource); //new JREmptyDataSource()
    }


    @RequestMapping(value = "/assignmentLetter.buet", method = RequestMethod.GET)
    @ResponseBody
    public void assignmentLetter(HttpServletResponse response,
                                 @RequestParam("fileNo") String fileNo)
            throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        BRTCProject p = brtcService.getBrtcProject(fileNo);
        NegotiateTeam nt = p.getNegotiateTeam();


        params.put("Date", sdf.format(nt.getAssignDate()));
        params.put("ProjectName", p.getProjectTitle());
        params.put("Department", p.getDepartment().getName());
        Client c = p.getClient();
        params.put("ClientName", c.getName());
        params.put("ClientAddress", c.getAddress());
        params.put("ClientContact", "Phone : " + c.getPhone() + ", Fax: " + c.getFax() + ", Email : " + c.getEmail());
        params.put("SpokesMan", c.getSpokesMan() + " (" + c.getSpokesManCell() + ")");
        String consultants = "";
        int counter = 0;
        for (Consultant consultant : nt.getConsultantList()) {
            UserDetails details = consultant.getConsultant().getToken().getUserDetails();
            if (counter != 0)
                consultants += ", ";
            consultants += details.getName() + " (as " + consultantTypeArray[consultant.getType()] + ")";
            counter++;
        }
        params.put("Consultants", consultants);
        params.put("RealPath", reportService.getRealPath("/"));


        JRDataSource dataSource = new JREmptyDataSource();
        reportService.createReport(response, params, "ProjectAssignmentLetter", dataSource); //new JREmptyDataSource()
    }

    @RequestMapping(value = "/showReport.buet", method = RequestMethod.GET)
    @ResponseBody
    public void showReport(HttpServletResponse response,
                           @RequestParam("reportName") String fileName)
            throws JRException, IOException {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("title", fileName);
        params.put("RealPath", reportService.getRealPath("/"));
        JRDataSource dataSource = new JREmptyDataSource();
        reportService.createReport(response, params, fileName, null);
    }

    @RequestMapping(value = "/projectListExcel.buet", method = RequestMethod.GET)
    @ResponseBody
    public void projectListExcel()
            throws JRException, IOException {
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            WritableWorkbook workbook = Workbook.createWorkbook(new File("D:\\projectList.xls"));
            WritableSheet sheet = workbook.createSheet("First Sheet", 0);
            List<BRTCProject> projectList = brtcService.findAllBrtcProject();

            sheet.addCell(new Label(0, 0, "File No"));
            sheet.addCell(new Label(1, 0, "Project Title"));
            sheet.addCell(new Label(2, 0, "Final Fee"));
            int row = 1;
            for (BRTCProject project : projectList) {
                String file = project.getFileNo();
                String name = project.getProjectTitle();
                Double fee = project.getFinalFee();

                Label fileLab = new Label(0, row, file);
                sheet.addCell(fileLab);
                Label nameLab = new Label(1, row, name);
                sheet.addCell(nameLab);
                Number feeAmount = new Number(2, row, fee);
                sheet.addCell(feeAmount);
                row++;
            }
            /*CellView cv = sheet.getColumnView(1);
            cv.setSize(5055 * 256 + 100);*/

            workbook.write();
            workbook.close();

            map.put("success", "true");
            map.put("msg", "Project List has been downloaded to D:\\");
        } catch (Exception ex) {
            map.put("success", "false");
            map.put("msg", "Project List has not been downloaded.");
        }
        String json = gson.toJson(map);
        //return json;

    }

}
