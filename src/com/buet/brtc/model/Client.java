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
@Table(name = "BRTC_CLIENT")
public class Client implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    @Column(columnDefinition = "text")
    private String address;

    private String phone;

    private  String email;

    private  String fax;

    @Column(columnDefinition = "text")
    private String description;

    @Column(name = "spokes_man")
    private String spokesMan;

    @Column(name = "spokes_man_cell")
    private String spokesManCell;

    @Column(name = "record_date")
    @Temporal(TemporalType.DATE)
    private Date recordDate;

    @ManyToOne
    private User operator;

    @OneToMany
    @JoinTable(name = "BRTC_JT_CLIENT_PROJECT",
            joinColumns = @JoinColumn(name = "CLIENT_ID"),
            inverseJoinColumns = @JoinColumn(name = "PROJECT_ID"))
    private List<BRTCProject> projectList= new ArrayList<BRTCProject>();



    public User getOperator() {
        return operator;
    }

    public void setOperator(User operator) {
        this.operator = operator;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSpokesMan() {
        return spokesMan;
    }

    public void setSpokesMan(String spokesMan) {
        this.spokesMan = spokesMan;
    }

    public String getSpokesManCell() {
        return spokesManCell;
    }

    public void setSpokesManCell(String spokesManCell) {
        this.spokesManCell = spokesManCell;
    }

    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public List<BRTCProject> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<BRTCProject> projectList) {
        this.projectList = projectList;
    }
}
