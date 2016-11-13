package com.buet.brtc.dao;

import com.buet.brtc.model.Consultant;
import com.buet.brtc.model.NegotiateTeam;
import com.buet.brtc.model.Team;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface NegotiateTeamDAO {
    public boolean save(NegotiateTeam team);

    public boolean update(NegotiateTeam team);

    public boolean delete(NegotiateTeam team);

    public List<NegotiateTeam> findAllNegotiateTeam();

    public NegotiateTeam getNegotiateTeam(Long id);

}
