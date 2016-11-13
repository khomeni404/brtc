package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.ProjectHistory;
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
public class ProjectHistoryDaoImpl implements ProjectHistoryDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(ProjectHistory history) {
        try {
            hibernateTemplate.persist(history);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(ProjectHistory history) {
        hibernateTemplate.merge(history);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(ProjectHistory history) {
        hibernateTemplate.delete(history);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<ProjectHistory> findAllProjectHistory() {
        return hibernateTemplate.find("from ProjectHistory order by id desc ");
    }

   /* @Override
    public List<ProjectHistory> findAllProjectHistory(BRTCProject project) {
        Object[] args = new Object[1];
        args[0] = project;
        try {
            return hibernateTemplate.find("from ProjectHistory where project=? order by id desc ", args);
        } catch (NullPointerException ex) {
            return null;
        }
    }*/

    @Override
    public ProjectHistory getProjectHistory(Long id) {
        return hibernateTemplate.get(ProjectHistory.class, id);
    }
}
