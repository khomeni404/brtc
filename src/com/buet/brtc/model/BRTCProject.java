package com.buet.brtc.model;

import com.buet.hrm.model.Department;
import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * User: M A Khomeni
 */
@Entity
@Table(name = "BRTC_PROJECT")
public class BRTCProject implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String fileNo;

    @Column(columnDefinition = "text")
    private String projectTitle;

    @ManyToOne
    private Client client;

    @ManyToOne
    private Department department;

    @ManyToOne
    private User assignBy;

    private Double initialFee;

    private Double finalFee;

    @OneToOne(mappedBy = "project")
    private Team team;

    @OneToOne(mappedBy = "project")
    private NegotiateTeam negotiateTeam;

    private boolean isActive;

    @Temporal(TemporalType.DATE)
    private Date recordDate;    //Today

    @ManyToOne
    private User operator;

    @OneToOne
    private ProjectStatus projectStatus;
    /*This could be useless because project.getNegotiatingTeam().getConsultantList() will return this List *//*
    @OneToMany
    @JoinTable(name = "BRTC_JT_PROJECT_CONSULTANT",
            joinColumns = @JoinColumn(name = "PROJECT_ID"),
            inverseJoinColumns = @JoinColumn(name = "CONSULTANT_ID"))
    private List<Consultant> consultantList = new ArrayList<Consultant>();
    */
    @OneToMany
    @JoinTable(name = "BRTC_JT_PROJECT_PROJECT_HISTORY",
            joinColumns = @JoinColumn(name = "PROJECT_ID"),
            inverseJoinColumns = @JoinColumn(name = "HISTORY_ID"))
    private List<ProjectHistory> historyList = new ArrayList<ProjectHistory>();

    @OneToMany
    @JoinTable(name = "BRTC_JT_PROJECT_CLIENT_PAYMENT",
            joinColumns = @JoinColumn(name = "PROJECT_ID"),
            inverseJoinColumns = @JoinColumn(name = "PAYMENT_ID"))
    private List<ClientPayment> clientPaymentList = new ArrayList<ClientPayment>();

    @OneToMany
    @JoinTable(name = "BRTC_JT_PROJECT_ADJUSTMENT",
            joinColumns = @JoinColumn(name = "PROJECT_ID"),
            inverseJoinColumns = @JoinColumn(name = "ADJUSTMENT_ID"))
    private List<Adjustment> adjustmentList = new ArrayList<Adjustment>();

    @OneToMany
    @JoinTable(name = "BRTC_JT_PROJECT_PAYMENT_REQUEST",
            joinColumns = @JoinColumn(name = "PROJECT_ID"),
            inverseJoinColumns = @JoinColumn(name = "REQUEST_ID"))
    private List<PaymentRequest> paymentRequestList = new ArrayList<PaymentRequest>();

    @OneToMany
    @JoinTable(name = "BRTC_DIST_JT_PROJECT_DISTRIBUTION",
            joinColumns = @JoinColumn(name = "PROJECT_ID"),
            inverseJoinColumns = @JoinColumn(name = "DISTRIBUTION_ID"))
    private List<Distribution> distributionList = new ArrayList<Distribution>();


    public List<Distribution> getDistributionList() {
        return distributionList;
    }

    public void setDistributionList(List<Distribution> distributionList) {
        this.distributionList = distributionList;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileNo() {
        return fileNo;
    }

    public void setFileNo(String fileNo) {
        this.fileNo = fileNo;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<PaymentRequest> getPaymentRequestList() {
        return paymentRequestList;
    }

    public void setPaymentRequestList(List<PaymentRequest> paymentRequestList) {
        this.paymentRequestList = paymentRequestList;
    }

    public String getProjectTitle() {
        return projectTitle;
    }

    public void setProjectTitle(String projectTitle) {
        this.projectTitle = projectTitle;
    }

    public User getAssignBy() {
        return assignBy;
    }

    public void setAssignBy(User assignBy) {
        this.assignBy = assignBy;
    }

    public Double getInitialFee() {
        return initialFee;
    }

    public void setInitialFee(Double initialFee) {
        this.initialFee = initialFee;
    }

    public Double getFinalFee() {
        return finalFee;
    }

    public void setFinalFee(Double finalFee) {
        this.finalFee = finalFee;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public User getOperator() {
        return operator;
    }

    public void setOperator(User operator) {
        this.operator = operator;
    }

    public ProjectStatus getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(ProjectStatus projectStatus) {
        this.projectStatus = projectStatus;
    }

    public List<ProjectHistory> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<ProjectHistory> historyList) {
        this.historyList = historyList;
    }

    public List<ClientPayment> getClientPaymentList() {
        return clientPaymentList;
    }

    public void setClientPaymentList(List<ClientPayment> clientPaymentList) {
        this.clientPaymentList = clientPaymentList;
    }

    public List<Adjustment> getAdjustmentList() {
        return adjustmentList;
    }

    public void setAdjustmentList(List<Adjustment> adjustmentList) {
        this.adjustmentList = adjustmentList;
    }

    public NegotiateTeam getNegotiateTeam() {
        return negotiateTeam;
    }

    public void setNegotiateTeam(NegotiateTeam negotiateTeam) {
        this.negotiateTeam = negotiateTeam;
    }
}
