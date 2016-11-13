package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.Client;
import com.buet.brtc.model.Distribution;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface DistributionDAO {
    public boolean save(Distribution distribution);

    public boolean update(Distribution distribution);

    public boolean delete(Distribution distribution);

    public List<Distribution> findAllDistribution(BRTCProject project);

    public List<Distribution> findAllDistribution();

    public Distribution getDistribution(Long id);

}
