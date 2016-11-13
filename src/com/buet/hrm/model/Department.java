package com.buet.hrm.model;

import com.buet.brtc.model.BRTCProject;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="HRM_DEPARTMENT")
public class Department  implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    private String description;

    private String phone;



    private String email;

    @Column(columnDefinition = "text")
    private String address;

    @OneToMany
    private List<UserDetails> userDetailsList = new ArrayList<UserDetails>();

    @OneToMany
    @JoinTable(name = "BRTC_JT_DEPARTMENT_PROJECT",
            joinColumns = @JoinColumn(name = "DEPARTMENT_ID"),
            inverseJoinColumns = @JoinColumn(name = "PROJECT_ID"))
    private List<BRTCProject> projectList = new ArrayList<BRTCProject>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<UserDetails> getUserDetailsList() {
        return userDetailsList;
    }

    public void setUserDetailsList(List<UserDetails> userDetailsList) {
        this.userDetailsList = userDetailsList;
    }

    public List<BRTCProject> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<BRTCProject> projectList) {
        this.projectList = projectList;
    }
}
