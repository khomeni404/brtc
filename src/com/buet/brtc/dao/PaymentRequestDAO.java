package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.PaymentRequest;
import com.buet.security.model.User;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface PaymentRequestDAO {
    public boolean save(PaymentRequest paymentRequest);

    public boolean update(PaymentRequest paymentRequest);

    public boolean delete(PaymentRequest paymentRequest);

    public List<PaymentRequest> findAllPaymentRequest();

    public List<PaymentRequest> findAllPaymentRequest(BRTCProject project, User user);

    public List<PaymentRequest> findAllPaymentRequest(Integer status);

    public PaymentRequest getPaymentRequest(Long id);

}
