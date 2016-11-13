package com.buet.brtc.dao;

import com.buet.brtc.model.Adjustment;
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
public class AdjustmentDaoImpl implements AdjustmentDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Adjustment adjustment) {
        try {
            hibernateTemplate.persist(adjustment);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Adjustment adjustment) {
        hibernateTemplate.merge(adjustment);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Adjustment adjustment) {
        hibernateTemplate.delete(adjustment);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Adjustment> findAllAdjustment() {
        return hibernateTemplate.find("from Adjustment");
    }

    @Override
    public Adjustment getAdjustment(Long id) {
        return hibernateTemplate.get(Adjustment.class, id);
    }
}
