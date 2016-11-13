package com.buet.brtc.dao;

import com.buet.brtc.model.NegotiateTeam;
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
public class NegotiateTeamDaoImpl implements NegotiateTeamDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(NegotiateTeam team) {
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
    public boolean update(NegotiateTeam team) {
        hibernateTemplate.merge(team);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(NegotiateTeam team) {
        hibernateTemplate.delete(team);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<NegotiateTeam> findAllNegotiateTeam() {
        return hibernateTemplate.find("from NegotiateTeam");
    }

    @Override
    public NegotiateTeam getNegotiateTeam(Long id) {
        return hibernateTemplate.get(NegotiateTeam.class, id);
    }
}
