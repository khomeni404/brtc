package com.buet.brtc.dao;

import com.buet.brtc.model.Team;
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
public class TeamDaoImpl implements TeamDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Team team) {
        try {
            hibernateTemplate.persist(team);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Team team) {
        hibernateTemplate.merge(team);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Team team) {
        hibernateTemplate.delete(team);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Team> findAllTeam() {
        return hibernateTemplate.find("from Team");
    }

    @Override
    public Team getTeam(Long id) {
        return hibernateTemplate.get(Team.class, id);
    }
}
