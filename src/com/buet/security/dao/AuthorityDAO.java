package com.buet.security.dao;


import com.buet.security.model.Authority;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:16 PM
 * To change this template use File | Settings | File Templates.
 */
public interface AuthorityDAO {
    public boolean save(Authority authority);

    public boolean update(Authority authority);

    public boolean delete(Authority authority);

    public List<Authority> findAllAuthority();

    public List<Authority> findAllAuthority(String searchText);

    public Authority getAuthority(Long id);

    public Authority findByAuthorityName(String authorityName);

}
