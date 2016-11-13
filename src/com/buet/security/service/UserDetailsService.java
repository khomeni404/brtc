/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buet.security.service;

import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.Token;
import com.buet.security.model.User;
import java.util.List;

/**
 *
 * @author ronnie
 */
public interface UserDetailsService{
    
    public User getUser(Long userID);

    public User getUser(String username);

    public User getUserByEmail(String emailAddress);
    
    public boolean saveUser(Token token, String userType);
    
    public boolean saveUser(User user);

    public boolean delete(User user);

    public boolean deleteUser(Token token);
    
    public boolean updateToken(Token token);
    
    public boolean updateToken(User user);

    public User findByUserCodeAndPassword(String username, String password);       
    
    public List<User> getAllUsers();

    public List<User> getAllTeacher();

    public User findUserByUserCode(String userCode);
    
    /*public AuthorizedGroups findByAuthorizedGroupsName(String authorizedGroupsName);
    
    public boolean saveAuthorizedGroups(AuthorizedGroups authorizedGroups);*/
    
    public int count();
    
    public User findByUsernameAndPassword(String username, String password);
    
    public User findByUsername(String username);

    //Token
    public boolean save(Token token);

    public boolean update(Token token);

    public boolean delete(Token token);

    public List<Token> findAllToken();

    public Token getToken(Long id);
    
}
