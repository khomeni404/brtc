package com.buet.brtc.dao;

import com.buet.brtc.model.Team;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface TeamDAO {
    public boolean save(Team team);

    public boolean update(Team team);

    public boolean delete(Team team);

    public List<Team> findAllTeam();

    public Team getTeam(Long id);

}
