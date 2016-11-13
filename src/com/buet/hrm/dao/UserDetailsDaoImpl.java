package com.buet.hrm.dao;

import com.buet.hrm.model.Department;
import com.buet.hrm.model.UserDetails;
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
public class UserDetailsDaoImpl implements UserDetailsDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(UserDetails details) {
        try {
            hibernateTemplate.persist(details);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(UserDetails details) {
        hibernateTemplate.merge(details);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(UserDetails details) {
        hibernateTemplate.delete(details);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<UserDetails> findAllUserDetails() {
        return hibernateTemplate.find("from UserDetails");
    }

    @Override
    public UserDetails getUserDetails(Long id) {
        return hibernateTemplate.get(UserDetails.class, id);
    }
}
