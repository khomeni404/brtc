package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User: M A Khomeni
 */
@Entity
@Table(name = "BRTC_PROJECT_STATUS")
public class ProjectStatus implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(mappedBy = "projectStatus")
    private BRTCProject project;

    @Column(name = "financial_status")
    private Integer financialStatus;  //  0 = No deposit, 1 = Partially deposited, 2 = Fully deposited

    @Column(name = "distribution_status")
    private Integer distributionStatus;     // 0 = No distribution, 1 = Partial distributed, 2 = Full distributed

    @Column(name = "progress_status")
    private Integer progressStatus;      //0 = Not Assigned,  1 = Assigned, 2 = No Response, 3 = Negotiating, 4 = Negotiation Failed,
    // 5 = Running, 6 = Stopped, 7 = Completed,

    @Column(name = "record_date")
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

    public BRTCProject getProject() {
        return project;
    }

    public void setProject(BRTCProject project) {
        this.project = project;
    }

    public Integer getFinancialStatus() {
        return financialStatus;
    }

    public void setFinancialStatus(Integer financialStatus) {
        this.financialStatus = financialStatus;
    }

    public Integer getDistributionStatus() {
        return distributionStatus;
    }

    public void setDistributionStatus(Integer distributionStatus) {
        this.distributionStatus = distributionStatus;
    }

    public Integer getProgressStatus() {
        return progressStatus;
    }

    public void setProgressStatus(Integer progressStatus) {
        this.progressStatus = progressStatus;
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
