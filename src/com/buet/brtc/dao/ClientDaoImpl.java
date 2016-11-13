package com.buet.brtc.dao;

import com.buet.brtc.model.Client;
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
public class ClientDaoImpl implements ClientDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Client client) {
        try {
            hibernateTemplate.persist(client);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Client client) {
        hibernateTemplate.merge(client);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Client client) {
        hibernateTemplate.delete(client);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<Client> findAllClient() {
        return hibernateTemplate.find("from Client");
    }
    @Override
    public List<Client> findAllClient(String searchText) {
        Object[] param = new Object[1];
        param[0] = "%"+searchText+"%";
        try {
            return hibernateTemplate.find("from Client where name like ?", param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }

    @Override
    public Client getClient(Long id) {
        return hibernateTemplate.get(Client.class, id);
    }
}
