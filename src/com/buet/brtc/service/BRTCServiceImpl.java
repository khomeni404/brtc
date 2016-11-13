package com.buet.brtc.service;


import com.buet.brtc.dao.*;
import com.buet.brtc.model.*;
import com.buet.hrm.dao.DepartmentDAO;
import com.buet.hrm.model.Department;
import com.buet.hrm.model.UserDetails;
import com.buet.security.model.User;
import com.buet.util.CurrentUserCredentials;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * User: M Ayatullah
 */
@Service
public class BRTCServiceImpl implements BRTCService {
    @Autowired
    BrtcProjectDAO projectDAO;
    @Autowired
    AdjustmentDAO adjustmentDAO;
    @Autowired
    ClientDAO clientDAO;
    @Autowired
    ClientPaymentDAO clientPaymentDAO;
    @Autowired
    DistributionDAO distributionDAO;
    @Autowired
    ProjectHistoryDAO projectHistoryDAO;
    @Autowired
    ProjectStatusDAO projectStatusDAO;
    @Autowired
    TeamDAO teamDAO;
    @Autowired
    TeamMemberDAO teamMemberDAO;
    @Autowired
    NegotiateTeamDAO negotiateTeamDAO;
    @Autowired
    ConsultantDAO consultantDAO;
    @Autowired
    PaymentRequestDAO paymentRequestDAO;
    @Autowired
    DepartmentDAO departmentDAO;
    @Autowired
    ReceiverDAO receiverDAO;
    @Autowired
    MessageDAO messageDAO;


    //Reporting Methods Implementation
    @Override
    public Map<String, Object> getFinancialStatus(BRTCProject project) {
        Map<String, Object> map = new HashMap<String, Object>();
        Double submitted = getTotalClientPayment(project, 0);
        Double encashed = getTotalClientPayment(project, 1);
        Double checked = getTotalClientPayment(project, 2);
        map.put("submitted", submitted);
        map.put("encashed", encashed);
        map.put("checked", checked);

        List<ClientPayment> paymentList = project.getClientPaymentList();
        map.put("paymentList", paymentList);

        Double totalReceived = submitted + encashed + checked;
        String statusHead = totalReceived > 0 ? "Partial Received" : "No payment Received";
        if (project.getFinalFee() <= totalReceived)
            statusHead = "Full Received";
        if (project.getFinalFee() <= 0)
            statusHead = "No project fee found";
        map.put("statusHead", statusHead);

        map.put("percent", (totalReceived * 100) / project.getFinalFee());
        return map;
    }

    @Override
    public Double getTotalReceived(BRTCProject project) {
        Double encashed = getTotalClientPayment(project, 1);
        Double checked = getTotalClientPayment(project, 2);
        return encashed + checked;
    }

    @Override
    public Double getTotalReceived(TeamMember teamMember) {
        List<Receiver> list = teamMember.getReceiverList();
        Double total = 0.0;
        if (list != null)
            for (Receiver re : list) {
                total += re.getAmount();
            }
        return total;
    }

    @Override
    public Double getPaSubmittedAmount(BRTCProject project) {
        //0 is the status of not passed checked means PA Submitted
        return getTotalClientPayment(project, 0);
    }

    @Override
    public Map<String, Object> getDistributionStatus(BRTCProject project) {
        Map<String, Object> map = new HashMap<String, Object>();

        Double totalReceived = getTotalReceived(project);
        map.put("totalReceived", totalReceived);
        Double distributed = getTotalDistributed(project);
        map.put("distributed", distributed);

        map.put("distributions", project.getDistributionList().size());

        map.put("percent", (distributed * 100) / totalReceived);
        return map;
    }

    public Double getTotalDistributed(BRTCProject project) {
        Double distributed = 0.0;
        List<Distribution> distributionList = project.getDistributionList();
        if (distributionList != null) {
            for (Distribution d : distributionList) {
                distributed += d.getTotalAmount();
            }
        }
        return distributed;
    }


    @Override
    public Map<String, Object> getProgressStatus(BRTCProject project) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Map<String, String>> getAllTeacher(BRTCProject project) {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Map<String, String> map;
/*
        List<Consultant> consultantList = project.getNegotiateTeam() != null ? project.getNegotiateTeam().getConsultantList() : null;
        if (consultantList != null) {
            for (Consultant c : consultantList) {
                UserDetails ud = c.getConsultant().getToken().getUserDetails();
                if (ud != null) {
                    map = new HashMap<String, String>();
                    map.put("id", c.getId() + "");
                    map.put("name", ud.getName());
                    map.put("designation", ud.getDesignation().getName());
                    map.put("type", c.getType() == 0 ? "Leader" : "Member");
                    map.put("team", "N.T.");
                    map.put("active", "active");
                    list.add(map);
                }

            }
        }*/

        List<TeamMember> teamMemberList = project.getTeam() != null ? project.getTeam().getTeamMemberList() : null;
        if (teamMemberList != null) {
            for (TeamMember member : teamMemberList) {
                UserDetails details = member.getTeamMember().getToken().getUserDetails();
                if (details != null) {
                    map = new HashMap<String, String>();
                    map.put("id", member.getId() + "");
                    map.put("name", details.getName());
                    map.put("designation", details.getDesignation().getName());
                    map.put("type", member.getMemberType() == 0 ? "Leader" : "Member");
                    map.put("team", "F.T.");
                    map.put("active", member.isActive() ? "Active" : "Inactive");
                    list.add(map);
                }
            }
        }
        if (list.size() == 0)
            return null;
        else
            return list;
    }

    //BRTC Project
    @Override
    public boolean save(Client client) {
        return clientDAO.save(client);
    }

    @Override
    public boolean update(Client client) {
        return clientDAO.update(client);
    }

    @Override
    public boolean delete(Client client) {
        return clientDAO.delete(client);
    }

    @Override
    public List<Client> findAllClient() {
        return clientDAO.findAllClient();
    }

    @Override
    public List<Client> findAllClient(String searchText) {
        return clientDAO.findAllClient(searchText);
    }

    public List<Client> findAllClientCompName() {
        List<Client> clientList1 = findAllClient();
        List<Map<String, Comparable>> list = new ArrayList<Map<String, Comparable>>();
        Map<String, Comparable> map;

        for (Client client : clientList1) {
            map = new HashMap<String, Comparable>();
            map.put("id", client.getId());
            map.put("name", client.getName());
            list.add(map);
        }

        Collections.sort(list, new Comparator<Map<String, Comparable>>() {
            @Override
            public int compare(Map<String, Comparable> o1, Map<String, Comparable> o2) {
                return o1.get("name").compareTo(o2.get("name"));
            }
        });

        List<Client> clientList2 = new ArrayList<Client>();
        for (Map<String, Comparable> map2 : list) {
            Client client = getClient(Long.valueOf(map2.get("id") + ""));
            clientList2.add(client);
        }
        return clientList2;
    }

    @Override
    public Client getClient(Long id) {
        return clientDAO.getClient(id);
    }


    //BRTC Project
    @Override
    public boolean save(Adjustment adjustment) {
        return adjustmentDAO.save(adjustment);
    }

    @Override
    public boolean update(Adjustment adjustment) {
        return adjustmentDAO.update(adjustment);
    }

    @Override
    public boolean delete(Adjustment adjustment) {
        return adjustmentDAO.delete(adjustment);
    }

    @Override
    public List<Adjustment> findAllAdjustment() {
        return adjustmentDAO.findAllAdjustment();
    }

    @Override
    public Adjustment getAdjustment(Long id) {
        return adjustmentDAO.getAdjustment(id);
    }

    //Adjustment
    @Override
    public boolean save(BRTCProject project) {
        return projectDAO.save(project);
    }

    @Override
    public boolean updateProject(BRTCProject project, Long clientIdOld, Long departmentIdOld) {
        Client oldClient = clientDAO.getClient(clientIdOld);
        Department deptOld = departmentDAO.getDepartment(departmentIdOld);
        try {
            oldClient.getProjectList().remove(project);
            deptOld.getProjectList().remove(project);
            return update(project);
        } catch (Exception ex) {
            return false;
        }

    }

    @Override
    public boolean update(BRTCProject project) {
        return projectDAO.update(project);
    }

    @Override
    public boolean deleteProject(String fileNo) {
        BRTCProject project = projectDAO.getBrtcProject(fileNo);
        project.getPaymentRequestList().removeAll(project.getPaymentRequestList());
        project.getClientPaymentList().removeAll(project.getClientPaymentList());
        project.getAdjustmentList().removeAll(project.getAdjustmentList());
        project.getHistoryList().removeAll(project.getHistoryList());
        Team team = project.getTeam();
        if (team != null)
            delete(team);
        NegotiateTeam negotiateTeam = project.getNegotiateTeam();
        if (negotiateTeam != null)
            delete(negotiateTeam);

        Client client = project.getClient();
        client.getProjectList().remove(project);
        Department department = project.getDepartment();
        department.getProjectList().remove(project);
        projectDAO.delete(project);
        ProjectStatus projectStatus = project.getProjectStatus();
        projectStatusDAO.delete(projectStatus);
        return true;
    }

    @Override
    public List<BRTCProject> findAllBrtcProject() {
        List<BRTCProject> list = projectDAO.findAllBrtcProject();
        Comparator<BRTCProject> comparator = new Comparator<BRTCProject>() {
            public int compare(BRTCProject c1, BRTCProject c2) {
                return Integer.parseInt(c2.getId() + "") - Integer.parseInt(c1.getId() + ""); // use your logic
            }
        };
        Collections.sort(list, comparator);
        return list;
    }

    @Override
    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate) {
        return projectDAO.findAllBrtcProject(startDate, endDate);
    }
    @Override
    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate, Integer status) {
        return projectDAO.findAllBrtcProject(startDate, endDate, status);
    }

    @Override
    public List<BRTCProject> findAllBrtcProject(String queryFor) {
        List<BRTCProject> list = projectDAO.findAllBrtcProject(queryFor);
        /*Comparator<BRTCProject> comparator = new Comparator<BRTCProject>() {
            public int compare(BRTCProject c1, BRTCProject c2) {
                return Integer.parseInt(c2.getId() + "") - Integer.parseInt(c1.getId() + ""); // use your logic
            }
        };
        Collections.sort(list, comparator);*/
        return list;
    }

    @Override
    public List<BRTCProject> findAllBrtcProject(String statusName, Integer status) {
        List<BRTCProject> projectList = projectDAO.findAllBrtcProject();
        List<BRTCProject> list = new ArrayList<BRTCProject>();
        for (BRTCProject p : projectList) {
            if (statusName.equals("P") && p.getProjectStatus().getProgressStatus().equals(status)) {
                list.add(p);
            } else if (statusName.equals("D") && p.getProjectStatus().getDistributionStatus().equals(status)) {
                list.add(p);
            } else if (statusName.equals("F") && p.getProjectStatus().getFinancialStatus().equals(status)) {
                list.add(p);
            }
        }
        return list;
    }

    @Override
    public List<BRTCProject> findAllBrtcProject(String[] param) {
        return projectDAO.findAllBrtcProject(param);
    }

    @Override
    public BRTCProject getBrtcProject(Long id) {
        return projectDAO.getBrtcProject(id);
    }

    @Override
    public BRTCProject getBrtcProject(String fileNo) {
        return projectDAO.getBrtcProject(fileNo);
    }

    //Client Payment
    @Override
    public boolean save(ClientPayment payment) {
        return clientPaymentDAO.save(payment);
    }

    @Override
    public boolean update(ClientPayment payment) {
        return clientPaymentDAO.update(payment);
    }

    @Override
    public boolean delete(ClientPayment payment) {
        return clientPaymentDAO.delete(payment);
    }

    @Override
    public List<ClientPayment> findAllClientPayment() {
        return clientPaymentDAO.findAllClientPayment();
    }

    @Override
    public List<ClientPayment> findAllClientPayment(String findFor) {
        return clientPaymentDAO.findAllClientPayment(findFor);
    }

    @Override
    public ClientPayment getClientPayment(Long id) {
        return clientPaymentDAO.getClientPayment(id);
    }

    @Override
    public ClientPayment getClientPayment(String brtcNo) {
        return clientPaymentDAO.getClientPayment(brtcNo);
    }

    @Override
    public Double getTotalClientPayment(BRTCProject project, Integer status) {
        Double total = 0.0;
        List<ClientPayment> paymentList = project.getClientPaymentList();
        if (paymentList != null) {
            for (ClientPayment payment : paymentList) {
                if (payment.getStatus().equals(status)) {
                    total += payment.getAmount();
                }
            }
        }
        return total;
    }

    //Consultant
    @Override
    public boolean save(Consultant consultant) {
        return consultantDAO.save(consultant);
    }

    @Override
    public boolean update(Consultant consultant) {
        return consultantDAO.update(consultant);
    }

    @Override
    public boolean delete(Consultant consultant) {
        return consultantDAO.delete(consultant);
    }

    @Override
    public List<Consultant> findAllConsultant() {
        return consultantDAO.findAllConsultant();
    }

    @Override
    public List<Consultant> findAllConsultant(NegotiateTeam team) {
        return consultantDAO.findAllConsultant(team);
    }

    @Override
    public Consultant getConsultant(Long id) {
        return consultantDAO.getConsultant(id);
    }

    @Override
    public Consultant getConsultant(NegotiateTeam team, User member) {
        return consultantDAO.getConsultant(team, member);
    }

    //PaymentRequest
    @Override
    public boolean save(PaymentRequest paymentRequest) {
        return paymentRequestDAO.save(paymentRequest);
    }

    @Override
    public boolean update(PaymentRequest paymentRequest) {
        return paymentRequestDAO.update(paymentRequest);
    }

    @Override
    public boolean delete(PaymentRequest paymentRequest, BRTCProject project) {
        try {
            project.getPaymentRequestList().remove(paymentRequest);
            paymentRequestDAO.delete(paymentRequest);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public List<PaymentRequest> findAllPaymentRequest() {
        return paymentRequestDAO.findAllPaymentRequest();
    }

    @Override
    public List<PaymentRequest> findAllPaymentRequest(BRTCProject project, User user) {
        return paymentRequestDAO.findAllPaymentRequest(project, user);
    }

    public Double getAdvancedAmount(BRTCProject project, User user, int paymentStatus) {
        List<PaymentRequest> requestList = findAllPaymentRequest(project, user);
        Double amount = 0.0;
        for (PaymentRequest pr : requestList) {
            if (pr.getStatus() == paymentStatus) {
                amount += pr.getAmount();
            }
        }
        return amount;
    }

    @Override
    public List<PaymentRequest> findAllPaymentRequest(Integer status) {
        return paymentRequestDAO.findAllPaymentRequest(status);
    }

    @Override
    public PaymentRequest getPaymentRequest(Long id) {
        return paymentRequestDAO.getPaymentRequest(id);
    }

    //Distribution
    @Override
    public boolean save(Distribution distribution) {
        return distributionDAO.save(distribution);
    }

    @Override
    public boolean update(Distribution distribution) {
        return distributionDAO.update(distribution);
    }

    @Override
    public boolean delete(Distribution distribution) {
        return distributionDAO.delete(distribution);
    }

    @Override
    public List<Distribution> findAllDistribution() {
        return distributionDAO.findAllDistribution();
    }

    public List<Distribution> findAllDistribution(BRTCProject project){
        return distributionDAO.findAllDistribution(project);
    }

    @Override
    public Distribution getDistribution(Long id) {
        return distributionDAO.getDistribution(id);
    }

    //Receiver
    @Override
    public boolean save(Receiver receiver) {
        return receiverDAO.save(receiver);
    }

    @Override
    public boolean update(Receiver receiver) {
        return receiverDAO.update(receiver);
    }

    @Override
    public boolean delete(Receiver receiver) {
        return receiverDAO.delete(receiver);
    }

    @Override
    public List<Receiver> findAllReceiver() {
        return receiverDAO.findAllReceiver();
    }

    @Override
    public Receiver getReceiver(Long id) {
        return receiverDAO.getReceiver(id);
    }

    //ProjectHistory
    @Override
    public boolean save(ProjectHistory history) {
        return projectHistoryDAO.save(history);
    }

    @Override
    public boolean update(ProjectHistory history) {
        return projectHistoryDAO.update(history);
    }

    @Override
    public boolean delete(ProjectHistory history) {
        return projectHistoryDAO.delete(history);
    }

    @Override
    public List<ProjectHistory> findAllProjectHistory() {
        return projectHistoryDAO.findAllProjectHistory();
    }

   /* @Override
    public List<ProjectHistory> findAllProjectHistory(BRTCProject project) {
        return projectHistoryDAO.findAllProjectHistory(project);
    }*/

    @Override
    public ProjectHistory getProjectHistory(Long id) {
        return projectHistoryDAO.getProjectHistory(id);
    }

    @Override
    public boolean createProjectHistory(BRTCProject project, String note) {
        ProjectHistory history = new ProjectHistory();
        history.setCreatedBy(new CurrentUserCredentials().user);
        history.setProject(project);
        history.setRecordDate(new Date());
        history.setNote(note);
        project.getHistoryList().add(history);
        save(history);
        return true;
    }

    //ProjectStatus
    @Override
    public boolean save(ProjectStatus status) {
        return projectStatusDAO.save(status);
    }

    @Override
    public boolean update(ProjectStatus status) {
        return projectStatusDAO.update(status);
    }

    @Override
    public boolean delete(ProjectStatus status) {
        return projectStatusDAO.delete(status);
    }

    @Override
    public List<ProjectStatus> findAllProjectStatus() {
        return projectStatusDAO.findAllProjectStatus();
    }

    @Override
    public ProjectStatus getProjectStatus(Long id) {
        return projectStatusDAO.getProjectStatus(id);
    }

    @Override
    public boolean changeProjectStatus(BRTCProject project, String statusOf, Integer statusIndex) {
        ProjectStatus status = project.getProjectStatus();
        if (statusOf.toUpperCase().equals("PROGRESS")){
            status.setProgressStatus(statusIndex);
        }else if (statusOf.toUpperCase().equals("FINANCIAL")){
            status.setFinancialStatus(statusIndex);
        }else if (statusOf.toUpperCase().equals("DISTRIBUTION")){
            status.setDistributionStatus(statusIndex);
        }
        return projectStatusDAO.update(status);
    }

    //Team
    @Override
    public boolean save(Team team) {
        return teamDAO.save(team);
    }

    @Override
    public boolean update(Team team) {
        return teamDAO.update(team);
    }

    @Override
    public boolean delete(Team team) {
        List<TeamMember> memberList = team.getTeamMemberList();
        if (memberList.size() != 0)
            teamMemberDAO.deleteAll(memberList);
        return teamDAO.delete(team);
    }

    @Override
    public List<Team> findAllTeam() {
        return teamDAO.findAllTeam();
    }

    @Override
    public Team getTeam(Long id) {
        return teamDAO.getTeam(id);
    }

    //Team Member
    @Override
    public boolean save(TeamMember member) {
        return teamMemberDAO.save(member);
    }

    @Override
    public boolean update(TeamMember member) {
        return teamMemberDAO.update(member);
    }

    @Override
    public boolean delete(TeamMember member) {
        return teamMemberDAO.delete(member);
    }

    @Override
    public List<TeamMember> findAllTeamMember() {
        return teamMemberDAO.findAllTeamMember();
    }

    @Override
    public TeamMember getTeamMember(Long id) {
        return teamMemberDAO.getTeamMember(id);
    }

    @Override
    public TeamMember getTeamMember(Team team, User member) {
        return teamMemberDAO.getTeamMember(team, member);
    }

    //Negotiate Team
    @Override
    public boolean save(NegotiateTeam team) {
        return negotiateTeamDAO.save(team);
    }

    @Override
    public boolean update(NegotiateTeam team) {
        return negotiateTeamDAO.update(team);
    }

    @Override
    public boolean delete(NegotiateTeam team) {
        List<Consultant> consultantList = team.getConsultantList();
        consultantDAO.deleteAll(consultantList);
        return negotiateTeamDAO.delete(team);
    }

    @Override
    public List<NegotiateTeam> findAllNegotiateTeam() {
        return negotiateTeamDAO.findAllNegotiateTeam();
    }

    @Override
    public NegotiateTeam getNegotiateTeam(Long id) {
        return negotiateTeamDAO.getNegotiateTeam(id);
    }


    //Message
    @Override
    public boolean save(BrtcMsg message) {
        return messageDAO.save(message);
    }

    @Override
    public boolean update(BrtcMsg message) {
        return messageDAO.update(message);
    }

    @Override
    public boolean delete(BrtcMsg message) {
        return messageDAO.delete(message);
    }

    @Override
    public List<BrtcMsg> findAllBrtcMsg() {
        return messageDAO.findAllBrtcMsg();
    }

    @Override
    public List<BrtcMsg> findAllBrtcMsg(String searchText) {
        return messageDAO.findAllBrtcMsg(searchText);
    }

    @Override
    public BrtcMsg getBrtcMsg(Long id) {
        return messageDAO.getBrtcMsg(id);
    }

    @Override
    public List<BrtcMsg> findAllBrtcMsgSent(User user, String type) {
        return null;
    }

    @Override
    public List<BrtcMsg> findAllBrtcMsgReceived(User user, String type) {
        return null;
    }
}
