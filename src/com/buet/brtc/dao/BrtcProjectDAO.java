package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface BrtcProjectDAO {
    public boolean save(BRTCProject project);

    public boolean update(BRTCProject project);

    public boolean delete(BRTCProject project);

    public List<BRTCProject> findAllBrtcProject();

    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate);

    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate, Integer status);

    public List<BRTCProject> findAllBrtcProject(String queryFor);

    public List<BRTCProject> findAllBrtcProject(String[] param);

    public BRTCProject getBrtcProject(Long id);

    public BRTCProject getBrtcProject(String fileNo);

}
