package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User: M A Khomeni
 */
@Entity
@Table(name = "BRTC_ADJUSTMENT")
public class Adjustment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private User adjustedBy;
    @ManyToOne
    private BRTCProject project;

    private Double amount;

    private Integer adjustedWith;       // 0 = Voucher, 1 = Bank Receipt, 3 = Bank Cheque

    @ManyToOne
    private User approvedBy;

    @Temporal(TemporalType.DATE)
    private Date recordDate;

    @ManyToOne
    private User operator;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getAdjustedBy() {
        return adjustedBy;
    }

    public void setAdjustedBy(User adjustedBy) {
        this.adjustedBy = adjustedBy;
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

    public Integer getAdjustedWith() {
        return adjustedWith;
    }

    public void setAdjustedWith(Integer adjustedWith) {
        this.adjustedWith = adjustedWith;
    }

    public User getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(User approvedBy) {
        this.approvedBy = approvedBy;
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
