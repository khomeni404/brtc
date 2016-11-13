package com.buet.brtc.dao;

import com.buet.brtc.model.Receiver;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ReceiverDAO {
    public boolean save(Receiver receiver);

    public boolean update(Receiver receiver);

    public boolean delete(Receiver receiver);

    public List<Receiver> findAllReceiver();

    public Receiver getReceiver(Long id);

}
