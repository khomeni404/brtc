package com.buet.hrm.dao;

import com.buet.hrm.model.Designation;
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
public class DesignationDaoImpl implements DesignationDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Designation designation) {
        try {
            hibernateTemplate.persist(designation);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Designation designation) {
        hibernateTemplate.merge(designation);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Designation designation) {
        hibernateTemplate.delete(designation);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Designation> findAllDesignation() {
        return hibernateTemplate.find("from Designation");
    }

    @Override
    public Designation getDesignation(Long id) {
        return hibernateTemplate.get(Designation.class, id);
    }
}
