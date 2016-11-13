package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User: M A Khomeni
 */
@Entity
@Table(name = "BRTC_PAYMENT_REQUEST")
public class PaymentRequest implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private User appliedBy;

    @ManyToOne
    private User receivedBy;

    @ManyToOne
    private BRTCProject project;

    private Double amount;

    @Column(columnDefinition = "text")
    private String purposes;

    private String inFavourOf;

    private String brtcNumber;

    @Column(columnDefinition = "text", name = "receiving_note")
    private String receivingNote;

    private Integer status;     //  0 = Requested,  1 = Countered, 2 = Accepted, 3 = Received

    @ManyToOne
    private User counteredBy;

    @ManyToOne
    private User acceptedBy;

    @Temporal(TemporalType.DATE)
    private Date receiveDate;

    @Temporal(TemporalType.DATE)
    private Date applyDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getReceivedBy() {
        return receivedBy;
    }

    public String getInFavourOf() {
        return inFavourOf;
    }

    public void setInFavourOf(String inFavourOf) {
        this.inFavourOf = inFavourOf;
    }

    public void setReceivedBy(User receivedBy) {
        this.receivedBy = receivedBy;
    }

    public String getBrtcNumber() {
        return brtcNumber;
    }

    public void setBrtcNumber(String brtcNumber) {
        this.brtcNumber = brtcNumber;
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

    public String getPurposes() {
        return purposes;
    }

    public void setPurposes(String purposes) {
        this.purposes = purposes;
    }

    public String getReceivingNote() {
        return receivingNote;
    }

    public void setReceivingNote(String receivingNote) {
        this.receivingNote = receivingNote;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public User getCounteredBy() {
        return counteredBy;
    }

    public void setCounteredBy(User counteredBy) {
        this.counteredBy = counteredBy;
    }

    public User getAppliedBy() {
        return appliedBy;
    }

    public void setAppliedBy(User appliedBy) {
        this.appliedBy = appliedBy;
    }

    public User getAcceptedBy() {
        return acceptedBy;
    }

    public void setAcceptedBy(User acceptedBy) {
        this.acceptedBy = acceptedBy;
    }

    public Date getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(Date receiveDate) {
        this.receiveDate = receiveDate;
    }

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

}
