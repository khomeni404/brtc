package com.buet.brtc.dao;

import com.buet.brtc.model.Consultant;
import com.buet.brtc.model.NegotiateTeam;
import com.buet.security.model.User;
import com.buet.security.service.UserDetailsService;
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
public class ConsultantDaoImpl implements ConsultantDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;
    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Consultant consultant) {
        try {
            hibernateTemplate.persist(consultant);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Consultant consultant) {
        hibernateTemplate.merge(consultant);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Consultant consultant) {
        hibernateTemplate.delete(consultant);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean deleteAll(List<Consultant> consultantList) {
        User member;
        for(Consultant consultant : consultantList){
            member = userDetailsService.getUser(consultant.getId());
            member.getConsultantList().remove(consultant);
        }
        hibernateTemplate.deleteAll(consultantList);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Consultant> findAllConsultant() {
        return hibernateTemplate.find("from Consultant");
    }

    @Override
    public List<Consultant> findAllConsultant(NegotiateTeam team) {
        Object[] params = new Object[1];
        params[0] = team;
        return hibernateTemplate.find("from Consultant where negotiateTeam=?", params);
    }

    @Override
    public Consultant getConsultant(Long id) {
        return hibernateTemplate.get(Consultant.class, id);
    }

    @Override
    public Consultant getConsultant(NegotiateTeam team, User member) {
        Object[] params = new Object[2];
        params[0] = team;
        params[1] = member;
        try {
            return (Consultant) hibernateTemplate.find("from Consultant where negotiateTeam=? and consultant=?", params).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
}
