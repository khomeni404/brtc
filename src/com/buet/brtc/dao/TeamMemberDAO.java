package com.buet.brtc.dao;

import com.buet.brtc.model.Team;
import com.buet.brtc.model.TeamMember;
import com.buet.security.model.User;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface TeamMemberDAO {
    public boolean save(TeamMember member);

    public boolean update(TeamMember member);

    public boolean delete(TeamMember member);

    public boolean deleteAll(List<TeamMember> memberList);

    public List<TeamMember> findAllTeamMember();

    public TeamMember getTeamMember(Long id);

    public TeamMember getTeamMember(Team team, User member);

}
