package com.buet.brtc.dao;

import com.buet.brtc.model.ProjectStatus;
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
public class ProjectStatusDaoImpl implements ProjectStatusDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(ProjectStatus status) {
        try {
            hibernateTemplate.persist(status);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(ProjectStatus status) {
        hibernateTemplate.merge(status);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(ProjectStatus status) {
        hibernateTemplate.delete(status);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<ProjectStatus> findAllProjectStatus() {
        return hibernateTemplate.find("from ProjectStatus");
    }

    @Override
    public ProjectStatus getProjectStatus(Long id) {
        return hibernateTemplate.get(ProjectStatus.class, id);
    }
}
