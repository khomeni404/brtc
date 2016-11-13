package com.buet.hrm.dao;

import com.buet.hrm.model.Department;
import com.buet.hrm.model.Designation;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface DesignationDAO {
    public boolean save(Designation designation);

    public boolean update(Designation designation);

    public boolean delete(Designation designation);

    public List<Designation> findAllDesignation();

    public Designation getDesignation(Long id);

}
