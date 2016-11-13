package com.buet.brtc.model;

import com.buet.security.model.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User: M A Khomeni
 */
@Entity
@Table(name = "BRTC_PROJECT_HISTORY")
public class ProjectHistory implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private BRTCProject project;

    @Column(columnDefinition = "text")
    private String note;

    @Temporal(TemporalType.TIMESTAMP)
    private Date recordDate;    //Today

    @ManyToOne
    private User createdBy;

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

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }
}
