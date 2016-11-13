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
@Table(name = "BRTC_TEAM_MEMBER")
public class TeamMember implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private Team team;

    @ManyToOne
    private User teamMember;

    private Integer memberType;  // 0 = Team Leader, 1 = Member, 2 = Others

    private boolean active;

    @Temporal(TemporalType.DATE)
    private Date activeDate;

    @Temporal(TemporalType.DATE)
    private Date inactiveDate;

    @Column(columnDefinition = "text")
    private String note;

    @Temporal(TemporalType.DATE)
    Date recordDate;

    @ManyToOne
    User operator;

    @OneToMany
    @JoinTable(name = "BRTC_DIST_JT_TEAM_MEMBER_RECEIVER",
            joinColumns = @JoinColumn(name = "TEAM_MEMBER_ID"),
            inverseJoinColumns = @JoinColumn(name = "RECEIVER_ID"))
    private List<Receiver> receiverList = new ArrayList<Receiver>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Team getTeam() {
        return team;
    }

    public Date getInactiveDate() {
        return inactiveDate;
    }

    public void setInactiveDate(Date inactiveDate) {
        this.inactiveDate = inactiveDate;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public Integer getMemberType() {
        return memberType;
    }

    public Date getActiveDate() {
        return activeDate;
    }

    public void setActiveDate(Date activeDate) {
        this.activeDate = activeDate;
    }

    public void setMemberType(Integer memberType) {
        this.memberType = memberType;
    }

    public User getTeamMember() {
        return teamMember;
    }

    public List<Receiver> getReceiverList() {
        return receiverList;
    }

    public void setReceiverList(List<Receiver> receiverList) {
        this.receiverList = receiverList;
    }

    public void setTeamMember(User teamMember) {
        this.teamMember = teamMember;
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

    public void setNote(String note) {
        this.note = note;
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
