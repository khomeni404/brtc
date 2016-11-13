package com.buet.brtc.dao;

import com.buet.brtc.model.Adjustment;
import com.buet.brtc.model.Client;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ClientDAO {
    public boolean save(Client client);

    public boolean update(Client client);

    public boolean delete(Client client);

    public List<Client> findAllClient();

    public List<Client> findAllClient(String searchText);

    public Client getClient(Long id);

}
