package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.Client;
import com.buet.brtc.model.Distribution;
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
public class DistributionDaoImpl implements DistributionDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Distribution distribution) {
        try {
            hibernateTemplate.persist(distribution);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Distribution distribution) {
        hibernateTemplate.merge(distribution);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Distribution distribution) {
        hibernateTemplate.delete(distribution);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Distribution> findAllDistribution(BRTCProject project) {
        Object[] param = new Object[1];
        param[0] = project;
        return hibernateTemplate.find("from Distribution where project=? ORDER BY id DESC", param);
    }

    @Override
    public List<Distribution> findAllDistribution() {
        return hibernateTemplate.find("from Distribution ORDER BY id DESC");
    }

    @Override
    public Distribution getDistribution(Long id) {
        return hibernateTemplate.get(Distribution.class, id);
    }
}
