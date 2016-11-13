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
@Table(name = "BRTC_TEAM")
public class Team implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne
    private BRTCProject project;

    @Temporal(TemporalType.DATE)
    private Date formedDate;

    @ManyToOne
    private TeamMember teamLeader;

    private Integer teamType;    //0 = Initial, 2 = Final

    private boolean isActive;

    private boolean isApprove;

    @Temporal(TemporalType.DATE)
    private Date recordDate;

    @ManyToOne
    private User operator;

    @OneToMany
    @JoinTable(name = "BRTC_JT_TEAM_TEAM_MEMBER",
            joinColumns = @JoinColumn(name = "TEAM_ID"),
            inverseJoinColumns = @JoinColumn(name = "MEMBER_ID"))
    private List<TeamMember> teamMemberList = new ArrayList<TeamMember>();

    public Long getId() {
        return id;
    }

    public boolean isApprove() {
        return isApprove;
    }

    public void setApprove(boolean approve) {
        isApprove = approve;
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

    public TeamMember getTeamLeader() {
        return teamLeader;
    }

    public void setTeamLeader(TeamMember teamLeader) {
        this.teamLeader = teamLeader;
    }

    public Date getFormedDate() {
        return formedDate;
    }

    public void setFormedDate(Date formedDate) {
        this.formedDate = formedDate;
    }

    public Integer getTeamType() {
        return teamType;
    }

    public void setTeamType(Integer teamType) {
        this.teamType = teamType;
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

    public List<TeamMember> getTeamMemberList() {
        return teamMemberList;
    }

    public void setTeamMemberList(List<TeamMember> teamMemberList) {
        this.teamMemberList = teamMemberList;
    }
}
