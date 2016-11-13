package com.buet.security.dao;


import com.buet.security.model.Component;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface ComponentDAO {
    public boolean save(Component module);

    public boolean update(Component module);

    public boolean delete(Component module);

    public List<Component> findAllComponent();

    public List<Component> findAllComponent(String searchText);

    public Component getComponent(Long id);

    public Component getComponent(String moduleName);

}
