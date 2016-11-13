package com.buet.brtc.model;

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
@Table(name = "BRTC_DIST_DISTRIBUTION")
public class Distribution implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private BRTCProject project;

    @Column(columnDefinition = "text")
    private String brtcNos;

    private Double totalAmount;

    private Double advances;

    private Double consultantFees;

    private Double others;

    @Temporal(TemporalType.DATE)
    private Date distributionDate;

    @Temporal(TemporalType.DATE)
    private Date recordDate;

    @ManyToOne
    private User operator;

    @OneToMany
    @JoinTable(name = "BRTC_DIST_JT_DISTRIBUTION_RECEIVER",
            joinColumns = @JoinColumn(name = "DISTRIBUTION_ID"),
            inverseJoinColumns = @JoinColumn(name = "RECEIVER_ID"))
    private List<Receiver> receiverList = new ArrayList<Receiver>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



    public BRTCProject getProject() {
        return project;
    }

    public void setProject(BRTCProject project) {
        this.project = project;
    }


    public String getBrtcNos() {
        return brtcNos;
    }

    public void setBrtcNos(String brtcNos) {
        this.brtcNos = brtcNos;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Double getAdvances() {
        return advances;
    }

    public void setAdvances(Double advances) {
        this.advances = advances;
    }

    public Double getConsultantFees() {
        return consultantFees;
    }

    public void setConsultantFees(Double consultantFees) {
        this.consultantFees = consultantFees;
    }

    public Double getOthers() {
        return others;
    }

    public void setOthers(Double others) {
        this.others = others;
    }

    public List<Receiver> getReceiverList() {
        return receiverList;
    }

    public void setReceiverList(List<Receiver> receiverList) {
        this.receiverList = receiverList;
    }

    public Date getDistributionDate() {
        return distributionDate;
    }

    public void setDistributionDate(Date distributionDate) {
        this.distributionDate = distributionDate;
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

}
