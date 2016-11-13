package com.buet.security.dao;


import com.buet.security.model.Authority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:18 PM
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class AuthorityDaoImpl implements AuthorityDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Authority authority) {
        try {
            hibernateTemplate.persist(authority);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Authority authority) {
        hibernateTemplate.merge(authority);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Authority authority) {
        hibernateTemplate.delete(authority);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Authority> findAllAuthority() {
        return hibernateTemplate.find("from Authority");
    }

    @Override
    public List<Authority> findAllAuthority(String searchText) {
        Object[] param = new Object[1];
        param[0] = "%"+searchText+"%";
        try {
            return hibernateTemplate.find("from Authority where name like ?", param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }

    @Override
    public Authority getAuthority(Long id) {
        return hibernateTemplate.get(Authority.class, id);
    }

    @Override
    public Authority findByAuthorityName(String authorityName){
        Object[] paramArr = new Object[1];
        paramArr[0] = new String(authorityName);
        try {
            return (Authority) hibernateTemplate.find("from Authority where authorityName=?", paramArr).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
}
