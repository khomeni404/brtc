package com.buet.brtc.dao;

import com.buet.brtc.model.Adjustment;
import com.buet.brtc.model.Consultant;
import com.buet.brtc.model.NegotiateTeam;
import com.buet.brtc.model.Team;
import com.buet.security.model.User;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ConsultantDAO {
    public boolean save(Consultant consultant);

    public boolean update(Consultant consultant);

    public boolean delete(Consultant consultant);

    public boolean deleteAll(List<Consultant> consultantList);

    public List<Consultant> findAllConsultant();

    public List<Consultant> findAllConsultant(NegotiateTeam team);

    public Consultant getConsultant(Long id);

    public Consultant getConsultant(NegotiateTeam team, User member);

}
