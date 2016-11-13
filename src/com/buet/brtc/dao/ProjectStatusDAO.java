package com.buet.brtc.dao;

import com.buet.brtc.model.ProjectStatus;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ProjectStatusDAO {
    public boolean save(ProjectStatus status);

    public boolean update(ProjectStatus status);

    public boolean delete(ProjectStatus status);

    public List<ProjectStatus> findAllProjectStatus();

    public ProjectStatus getProjectStatus(Long id);

}
