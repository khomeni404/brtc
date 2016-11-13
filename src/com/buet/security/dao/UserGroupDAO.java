package com.buet.security.dao;


import com.buet.security.model.UserGroup;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface UserGroupDAO {
    public boolean save(UserGroup group);

    public boolean update(UserGroup group);

    public boolean delete(UserGroup group);

    public List<UserGroup> findAllUserGroup();

    public List<UserGroup> findAllUserGroup(String searchText);

    public UserGroup getUserGroup(Long id);

    public UserGroup getUserGroup(String groupName);

}
