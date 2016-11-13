package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User: M A Khomeni
 */

@Entity
@Table(name = "BRTC_CONSULTANT")
public class Consultant implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private User consultant;

    @ManyToOne
    private NegotiateTeam negotiateTeam;

    private  boolean active;

    @Column(columnDefinition = "text")
    private  String note;

    private Integer type;   //0 = Team Leader,  1 = Member

    @Temporal(TemporalType.DATE)
    private Date activeDate;    //Today

    @Temporal(TemporalType.DATE)
    private Date inactiveDate;

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

    public Date getActiveDate() {
        return activeDate;
    }

    public void setActiveDate(Date activeDate) {
        this.activeDate = activeDate;
    }

    public Date getInactiveDate() {
        return inactiveDate;
    }

    public void setInactiveDate(Date inactiveDate) {
        this.inactiveDate = inactiveDate;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public User getConsultant() {
        return consultant;
    }

    public void setConsultant(User consultant) {
        this.consultant = consultant;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getNote() {
        return note;
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

    public void setNote(String note) {
        this.note = note;
    }

    public NegotiateTeam getNegotiateTeam() {
        return negotiateTeam;
    }

    public void setNegotiateTeam(NegotiateTeam negotiateTeam) {
        this.negotiateTeam = negotiateTeam;
    }
}
