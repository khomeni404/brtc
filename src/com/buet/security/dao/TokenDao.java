package com.buet.security.dao;

import com.buet.security.model.Token;

import java.util.List;

public interface TokenDao {

    public boolean save(Token token);

    public boolean update(Token token);

    public boolean delete(Token token);

    public List<Token> findAllToken();

    public Token getToken(Long id);
}
