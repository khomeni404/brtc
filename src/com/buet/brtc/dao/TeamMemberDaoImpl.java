package com.buet.brtc.dao;

import com.buet.brtc.model.Team;
import com.buet.brtc.model.TeamMember;
import com.buet.security.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:18 PM
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class TeamMemberDaoImpl implements TeamMemberDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(TeamMember member) {
        try {
            hibernateTemplate.persist(member);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(TeamMember member) {
        hibernateTemplate.merge(member);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(TeamMember member) {
        hibernateTemplate.delete(member);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean deleteAll(List<TeamMember> memberList) {
        hibernateTemplate.deleteAll(memberList);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<TeamMember> findAllTeamMember() {
        return hibernateTemplate.find("from TeamMember");
    }

    @Override
    public TeamMember getTeamMember(Long id) {
        return hibernateTemplate.get(TeamMember.class, id);
    }

    @Override
    public TeamMember getTeamMember(Team team, User member) {
        Object[] params = new Object[2];
        params[0] = team;
        params[1] = member;
        try {
            return (TeamMember) hibernateTemplate.find("from TeamMember where team=? and teamMember=?", params).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
}
