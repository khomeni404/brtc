package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "BRTC_NEGOTIATE_TEAM")
public class NegotiateTeam implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne
    private BRTCProject project;

    @Temporal(TemporalType.DATE)
    private Date assignDate;

    @ManyToOne
    private User teamLeader;

    private boolean isActive;

    @Temporal(TemporalType.DATE)
    private Date recordDate;

    @ManyToOne
    private User operator;

    @OneToMany
    @JoinTable(name = "BRTC_JT_NEGOTIATE_TEAM_CONSULTANT",
            joinColumns = @JoinColumn(name = "TEAM_ID"),
            inverseJoinColumns = @JoinColumn(name = "CONSULTANT_ID"))
    private List<Consultant> consultantList = new ArrayList<Consultant>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BRTCProject getProject() {
        return project;
    }

    public User getTeamLeader() {
        return teamLeader;
    }

    public void setTeamLeader(User teamLeader) {
        this.teamLeader = teamLeader;
    }

    public void setProject(BRTCProject project) {
        this.project = project;
    }

    public Date getAssignDate() {
        return assignDate;
    }

    public void setAssignDate(Date assignDate) {
        this.assignDate = assignDate;
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

    public List<Consultant> getConsultantList() {
        return consultantList;
    }

    public void setConsultantList(List<Consultant> consultantList) {
        this.consultantList = consultantList;
    }
}
