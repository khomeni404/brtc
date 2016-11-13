package com.buet.security.dao;


import com.buet.security.model.UserGroup;
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
public class UserGroupDaoImpl implements UserGroupDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(UserGroup group) {
        try {
            hibernateTemplate.persist(group);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(UserGroup group) {
        hibernateTemplate.merge(group);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(UserGroup group) {
        hibernateTemplate.delete(group);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<UserGroup> findAllUserGroup() {
        return hibernateTemplate.find("from UserGroup");
    }

    @Override
    public List<UserGroup> findAllUserGroup(String searchText) {
        Object[] param = new Object[1];
        param[0] = "%"+searchText+"%";
        try {
            return hibernateTemplate.find("from UserGroup where name like ?", param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }

    @Override
    public UserGroup getUserGroup(Long id) {
        return hibernateTemplate.get(UserGroup.class, id);
    }

    @Override
    public UserGroup getUserGroup(String groupName){
        Object[] paramArr = new Object[1];
        paramArr[0] = new String(groupName);
        try {
            return (UserGroup) hibernateTemplate.find("from UserGroup where groupName=?", paramArr).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
}
