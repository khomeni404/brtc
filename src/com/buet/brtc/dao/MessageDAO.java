package com.buet.brtc.dao;

import com.buet.brtc.model.BrtcMsg;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface MessageDAO {
    public boolean save(BrtcMsg message);

    public boolean update(BrtcMsg message);

    public boolean delete(BrtcMsg message);

    public List<BrtcMsg> findAllBrtcMsg();

    public List<BrtcMsg> findAllBrtcMsg(String searchText);

    public BrtcMsg getBrtcMsg(Long id);

}
