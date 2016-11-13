package com.buet.hrm.service;

import com.buet.hrm.model.Department;
import com.buet.hrm.model.Designation;
import com.buet.hrm.model.UserDetails;

import java.util.List;

public interface HRMService {

    //User Details
    public boolean save(UserDetails userDetails);

    public boolean update(UserDetails userDetails);

    public boolean delete(UserDetails userDetails);

    public List<UserDetails> findAllUserDetails();

    public UserDetails getUserDetails(Long id);

    //Department
    public boolean save(Department department);

    public boolean update(Department department);

    public boolean delete(Department department);

    public List<Department> findAllDepartment();

    public Department getDepartment(Long id);

    //Designation
    public boolean save(Designation designation);

    public boolean update(Designation designation);

    public boolean delete(Designation designation);

    public List<Designation> findAllDesignation();

    public Designation getDesignation(Long id);
}
