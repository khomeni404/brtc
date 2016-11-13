package com.buet.hrm.dao;

import com.buet.hrm.model.Department;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface DepartmentDAO {
    public boolean save(Department department);

    public boolean update(Department department);

    public boolean delete(Department department);

    public List<Department> findAllDepartment();

    public Department getDepartment(Long id);

}
