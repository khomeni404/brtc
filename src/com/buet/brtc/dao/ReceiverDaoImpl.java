package com.buet.brtc.dao;

import com.buet.brtc.model.Receiver;
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
public class ReceiverDaoImpl implements ReceiverDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Receiver receiver) {
        try {
            hibernateTemplate.persist(receiver);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Receiver receiver) {
        hibernateTemplate.merge(receiver);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Receiver receiver) {
        hibernateTemplate.delete(receiver);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Receiver> findAllReceiver() {
        return hibernateTemplate.find("from Receiver");
    }

    @Override
    public Receiver getReceiver(Long id) {
        return hibernateTemplate.get(Receiver.class, id);
    }
}
