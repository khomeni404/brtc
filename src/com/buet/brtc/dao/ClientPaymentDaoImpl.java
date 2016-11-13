package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.ClientPayment;
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
public class ClientPaymentDaoImpl implements ClientPaymentDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(ClientPayment payment) {
        try {
            hibernateTemplate.persist(payment);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(ClientPayment payment) {
        hibernateTemplate.merge(payment);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(ClientPayment payment) {
        hibernateTemplate.delete(payment);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<ClientPayment> findAllClientPayment() {
        return hibernateTemplate.find("from ClientPayment order by id desc");
    }

    @Override
    public List<ClientPayment> findAllClientPayment(String findFor) {
        Object[] obj = new Object[1];
        obj[0] = "%" + findFor + "%";
        return hibernateTemplate.find("from ClientPayment where brtcNo like ? order by id desc", obj);
    }

    @Override
    public ClientPayment getClientPayment(Long id) {
        return hibernateTemplate.get(ClientPayment.class, id);
    }

    @Override
    public ClientPayment getClientPayment(String brtcNo) {
        Object[] obj = new Object[1];
        obj[0] = "%" + brtcNo + "%";
        try {
            return (ClientPayment) hibernateTemplate.find("from ClientPayment where brtcNo like ?", obj).get(0);
        } catch (IndexOutOfBoundsException ex) {
            return null;
        }
    }
}
