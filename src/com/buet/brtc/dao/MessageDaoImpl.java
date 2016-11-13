package com.buet.brtc.dao;

import com.buet.brtc.model.BrtcMsg;
import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;
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
public class MessageDaoImpl implements MessageDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(BrtcMsg message) {
        try {
            hibernateTemplate.persist(message);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(BrtcMsg message) {
        hibernateTemplate.merge(message);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(BrtcMsg message) {
        hibernateTemplate.delete(message);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<BrtcMsg> findAllBrtcMsg() {
        return hibernateTemplate.find("from BrtcMsg");
    }
    @Override
    public List<BrtcMsg> findAllBrtcMsg(String searchText) {
        Object[] param = new Object[1];
        param[0] = "%"+searchText+"%";
        try {
            return hibernateTemplate.find("from BrtcMsg where name like ?", param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }

    @Override
    public BrtcMsg getBrtcMsg(Long id) {
        return hibernateTemplate.get(BrtcMsg.class, id);
    }
}
