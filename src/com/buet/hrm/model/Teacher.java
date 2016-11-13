package com.buet.hrm.model;

import com.buet.security.model.User;

import javax.persistence.*;

@Entity
@DiscriminatorValue("teacher")
public class Teacher extends User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String fullName;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
