package com.buet.security.dao;

import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.UserGroup;
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
public class AuthorizedGroupsDaoImpl implements AuthorizedGroupsDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(AuthorizedGroups groups) {
        try {
            hibernateTemplate.persist(groups);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(AuthorizedGroups groups) {
        hibernateTemplate.merge(groups);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(AuthorizedGroups groups) {
        hibernateTemplate.delete(groups);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<AuthorizedGroups> findAllAuthorizedGroups() {
        return hibernateTemplate.find("from AuthorizedGroups");
    }

    @Override
    public AuthorizedGroups getAuthorizedGroups(Long id) {
        return hibernateTemplate.get(AuthorizedGroups.class, id);
    }

    @Override
    public AuthorizedGroups getAuthorizedGroups(String groupName){
        Object[] paramArr = new Object[1];
        paramArr[0] = new String(groupName);
        try {
            return (AuthorizedGroups) hibernateTemplate.find("from AuthorizedGroups where authorizationName=?", paramArr).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
}
