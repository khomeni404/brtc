package com.buet.security.dao;

import com.buet.security.model.AuthorizedGroups;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface AuthorizedGroupsDAO {
    public boolean save(AuthorizedGroups groups);

    public boolean update(AuthorizedGroups groups);

    public boolean delete(AuthorizedGroups groups);

    public List<AuthorizedGroups> findAllAuthorizedGroups();

    public AuthorizedGroups getAuthorizedGroups(Long id);

    public AuthorizedGroups getAuthorizedGroups(String groupName);

}
