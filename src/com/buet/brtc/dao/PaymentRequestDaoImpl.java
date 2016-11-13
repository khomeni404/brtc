package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.PaymentRequest;
import com.buet.security.model.User;
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
public class PaymentRequestDaoImpl implements PaymentRequestDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(PaymentRequest paymentRequest) {
        try {
            hibernateTemplate.persist(paymentRequest);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(PaymentRequest paymentRequest) {
        hibernateTemplate.merge(paymentRequest);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(PaymentRequest paymentRequest) {
        hibernateTemplate.delete(paymentRequest);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<PaymentRequest> findAllPaymentRequest() {
        return hibernateTemplate.find("from PaymentRequest");
    }

    @Override
    public List<PaymentRequest> findAllPaymentRequest(Integer status) {
        Object[] obj = new Object[1];
        obj[0] = status;
        return hibernateTemplate.find("from PaymentRequest where status=?", obj);
    }


    @Override
    public List<PaymentRequest> findAllPaymentRequest(BRTCProject project, User user) {
        Object[] obj = new Object[2];
        obj[0] = project;
        obj[1] = user;
        return hibernateTemplate.find("from PaymentRequest where project=? and receivedBy=?", obj);

    }

    @Override
    public PaymentRequest getPaymentRequest(Long id) {
        try {
            return hibernateTemplate.get(PaymentRequest.class, id);
        }catch (NullPointerException ex){
            return null;
        }
    }
}
