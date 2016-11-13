package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User: M A Khomeni
 */
@Entity
@Table(name = "BRTC_CLIENT_PAYMENT")
public class ClientPayment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String brtcNo;

    private String depositNo;
    private String mrNo;
    private String refNo;
    private String chequeDetails;

    @ManyToOne
    private BRTCProject project;

    private Double amount;

    private Integer status;     //0 = PA Submitted,  1 = Encashed, 2 = Checked        http://www.oxforddictionaries.com/definition/english/encash

    @Temporal(TemporalType.DATE)
    private Date encashDate;

    @ManyToOne
    private User checkedBy;

    @Temporal(TemporalType.DATE)
    private Date recordDate;    //Today

    @ManyToOne
    private User operator;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBrtcNo() {
        return brtcNo;
    }

    public void setBrtcNo(String brtcNo) {
        this.brtcNo = brtcNo;
    }

    public String getMrNo() {
        return mrNo;
    }

    public String getDepositNo() {
        return depositNo;
    }

    public void setDepositNo(String depositNo) {
        this.depositNo = depositNo;
    }

    public String getRefNo() {
        return refNo;
    }

    public void setRefNo(String refNo) {
        this.refNo = refNo;
    }

    public String getChequeDetails() {
        return chequeDetails;
    }

    public void setChequeDetails(String chequeDetails) {
        this.chequeDetails = chequeDetails;
    }

    public void setMrNo(String mrNo) {
        this.mrNo = mrNo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public BRTCProject getProject() {
        return project;
    }

    public void setProject(BRTCProject project) {
        this.project = project;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Date getEncashDate() {
        return encashDate;
    }

    public void setEncashDate(Date encashDate) {
        this.encashDate = encashDate;
    }

    public User getCheckedBy() {
        return checkedBy;
    }

    public void setCheckedBy(User checkedBy) {
        this.checkedBy = checkedBy;
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
