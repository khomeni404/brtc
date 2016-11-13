package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.ClientPayment;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ClientPaymentDAO {
    public boolean save(ClientPayment payment);

    public boolean update(ClientPayment payment);

    public boolean delete(ClientPayment payment);

    public List<ClientPayment> findAllClientPayment();

    public List<ClientPayment> findAllClientPayment(String findFor);

    public ClientPayment getClientPayment(Long id);

    public ClientPayment getClientPayment(String brtcNo);



}
