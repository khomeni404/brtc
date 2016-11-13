package com.buet.brtc.dao;

import com.buet.brtc.model.Adjustment;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface AdjustmentDAO {

    public boolean save(Adjustment adjustment);

    public boolean update(Adjustment adjustment);

    public boolean delete(Adjustment adjustment);

    public List<Adjustment> findAllAdjustment();

    public Adjustment getAdjustment(Long id);

}
