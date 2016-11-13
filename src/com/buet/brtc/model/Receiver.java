package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "BRTC_DIST_RECEIVER")
public class Receiver implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private Distribution distribution;

    @ManyToOne
    private User sanctionFor;

    @ManyToOne
    private TeamMember teamMember;

    private Double amount;

    private boolean receive;

    @Temporal(TemporalType.DATE)
    private Date receivingDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Distribution getDistribution() {
        return distribution;
    }

    public void setDistribution(Distribution distribution) {
        this.distribution = distribution;
    }

    public User getSanctionFor() {
        return sanctionFor;
    }

    public void setSanctionFor(User sanctionFor) {
        this.sanctionFor = sanctionFor;
    }

    public Double getAmount() {
        return amount;
    }

    public TeamMember getTeamMember() {
        return teamMember;
    }

    public void setTeamMember(TeamMember teamMember) {
        this.teamMember = teamMember;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public boolean isReceive() {
        return receive;
    }

    public void setReceive(boolean receive) {
        this.receive = receive;
    }

    public Date getReceivingDate() {
        return receivingDate;
    }

    public void setReceivingDate(Date receivingDate) {
        this.receivingDate = receivingDate;
    }
}
