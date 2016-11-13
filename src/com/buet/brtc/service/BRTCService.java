package com.buet.brtc.service;

import com.buet.brtc.model.*;
import com.buet.hrm.model.Department;
import com.buet.security.model.User;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * User: M Ayatullah
 */
public interface BRTCService {
    //Reporting Methods
    public Map<String, Object> getFinancialStatus(BRTCProject project);

    public Double getTotalReceived(BRTCProject project);

    public Double getTotalReceived(TeamMember teamMember);

    public Double getPaSubmittedAmount(BRTCProject project);

    public Map<String, Object> getDistributionStatus(BRTCProject project);

    public Double getTotalDistributed(BRTCProject project);

    public Map<String, Object> getProgressStatus(BRTCProject project);

    public List<Map<String, String>> getAllTeacher(BRTCProject project);



    //BRTC Project
    public boolean save(BRTCProject project);

    public boolean update(BRTCProject project);

    public boolean updateProject(BRTCProject project, Long clientIdOld, Long departmentIdOld);

    public boolean deleteProject(String fileNo);

    public List<BRTCProject> findAllBrtcProject();

    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate);

    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate, Integer status);

    public List<BRTCProject> findAllBrtcProject(String queryFor);

    public List<BRTCProject> findAllBrtcProject(String statusName, Integer status);

    public List<BRTCProject> findAllBrtcProject(String[] param);

    public BRTCProject getBrtcProject(Long id);

    public BRTCProject getBrtcProject(String fileNo);

    //Adjustment
    public boolean save(Adjustment adjustment);

    public boolean update(Adjustment adjustment);

    public boolean delete(Adjustment adjustment);

    public List<Adjustment> findAllAdjustment();

    public Adjustment getAdjustment(Long id);

    //Client
    public boolean save(Client client);

    public boolean update(Client client);

    public boolean delete(Client client);

    public List<Client> findAllClient();

    public List<Client> findAllClient(String searchText);

    public List<Client> findAllClientCompName();

    public Client getClient(Long id);

    //ClientPayment
    public boolean save(ClientPayment payment);

    public boolean update(ClientPayment payment);

    public boolean delete(ClientPayment payment);

    public List<ClientPayment> findAllClientPayment();

    public List<ClientPayment> findAllClientPayment(String brtcNo);

    public ClientPayment getClientPayment(Long id);

    public ClientPayment getClientPayment(String brtcNo);

    public Double getTotalClientPayment(BRTCProject project, Integer status);



    //Distribution
    public boolean save(Distribution distribution);

    public boolean update(Distribution distribution);

    public boolean delete(Distribution distribution);

    public List<Distribution> findAllDistribution(BRTCProject project);

    public List<Distribution> findAllDistribution();

    public Distribution getDistribution(Long id);

    //Receiver
    public boolean save(Receiver receiver);

    public boolean update(Receiver receiver);

    public boolean delete(Receiver receiver);

    public List<Receiver> findAllReceiver();

    public Receiver getReceiver(Long id);

    //Project History
    public boolean save(ProjectHistory history);

    public boolean update(ProjectHistory history);

    public boolean delete(ProjectHistory history);

    public List<ProjectHistory> findAllProjectHistory();

    //public List<ProjectHistory> findAllProjectHistory(BRTCProject project);

    public ProjectHistory getProjectHistory(Long id);

    public boolean createProjectHistory(BRTCProject project, String note);

    //Project Status
    public boolean save(ProjectStatus status);

    public boolean update(ProjectStatus status);

    public boolean delete(ProjectStatus status);

    public List<ProjectStatus> findAllProjectStatus();

    public ProjectStatus getProjectStatus(Long id);

    public boolean changeProjectStatus(BRTCProject project, String statusOf, Integer statusIndex);

    ////Team
    public boolean save(Team team);

    public boolean update(Team team);

    public boolean delete(Team team);

    public List<Team> findAllTeam();

    public Team getTeam(Long id);

    //Team Member
    public boolean save(TeamMember member);

    public boolean update(TeamMember member);

    public boolean delete(TeamMember member);

    public List<TeamMember> findAllTeamMember();

    public TeamMember getTeamMember(Long id);

    public TeamMember getTeamMember(Team team, User member);


    //Negotiate Team
    public boolean save(NegotiateTeam team);

    public boolean update(NegotiateTeam team);

    public boolean delete(NegotiateTeam team);

    public List<NegotiateTeam> findAllNegotiateTeam();

    public NegotiateTeam getNegotiateTeam(Long id);

    //Consultant  /  Negotiator
    public boolean save(Consultant consultant);

    public boolean update(Consultant consultant);

    public boolean delete(Consultant consultant);

    public List<Consultant> findAllConsultant();

    public List<Consultant> findAllConsultant(NegotiateTeam team);

    public Consultant getConsultant(Long id);

    public Consultant getConsultant(NegotiateTeam team, User member);

    //PaymentRequest
    public boolean save(PaymentRequest paymentRequest);

    public boolean update(PaymentRequest paymentRequest);

    public boolean delete(PaymentRequest paymentRequest,BRTCProject project);

    public List<PaymentRequest> findAllPaymentRequest();

    public List<PaymentRequest> findAllPaymentRequest(BRTCProject project, User user);

    public List<PaymentRequest> findAllPaymentRequest(Integer status);

    public Double getAdvancedAmount(BRTCProject project, User user, int paymentStatus);

    public PaymentRequest getPaymentRequest(Long id);

    //Message
    public boolean save(BrtcMsg message);

    public boolean update(BrtcMsg message);

    public boolean delete(BrtcMsg message);

    public List<BrtcMsg> findAllBrtcMsg();

    public List<BrtcMsg> findAllBrtcMsg(String searchText);

    public List<BrtcMsg> findAllBrtcMsgSent(User user, String type);

    public List<BrtcMsg> findAllBrtcMsgReceived(User user, String type);

    public BrtcMsg getBrtcMsg(Long id);
}
