package com.buet.hrm.dao;

import com.buet.hrm.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: M Ayatullah
 * Date: 8/23/14
 * Time: 4:18 PM
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class DepartmentDaoImpl implements DepartmentDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Department department) {
        try {
            hibernateTemplate.persist(department);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Department department) {
        hibernateTemplate.merge(department);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Department department) {
        hibernateTemplate.delete(department);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Department> findAllDepartment() {
        return hibernateTemplate.find("from Department");
    }

    @Override
    public Department getDepartment(Long id) {
        return hibernateTemplate.get(Department.class, id);
    }
}
