package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.Client;
import com.buet.brtc.model.ProjectHistory;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ProjectHistoryDAO {
    public boolean save(ProjectHistory history);

    public boolean update(ProjectHistory history);

    public boolean delete(ProjectHistory history);

    public List<ProjectHistory> findAllProjectHistory();

    //public List<ProjectHistory> findAllProjectHistory(BRTCProject project);

    public ProjectHistory getProjectHistory(Long id);

}
