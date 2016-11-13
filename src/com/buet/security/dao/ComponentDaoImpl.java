package com.buet.security.dao;


import com.buet.security.model.Component;
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
public class ComponentDaoImpl implements ComponentDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Component module) {
        try {
            hibernateTemplate.persist(module);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Component module) {
        hibernateTemplate.merge(module);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Component module) {
        hibernateTemplate.delete(module);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Component> findAllComponent() {
        return hibernateTemplate.find("from Component");
    }

    @Override
    public List<Component> findAllComponent(String searchText) {
        Object[] param = new Object[1];
        param[0] = "%"+searchText+"%";
        try {
            return hibernateTemplate.find("from Component where componentName like ?", param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }

    @Override
    public Component getComponent(Long id) {
        return hibernateTemplate.get(Component.class, id);
    }

    @Override
    public Component getComponent(String moduleName){
        Object[] paramArr = new Object[1];
        paramArr[0] = new String(moduleName);
        try {
            return (Component) hibernateTemplate.find("from Component where componentName=?", paramArr).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
}
