package com.vivi.bugTracking.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class RoleDao {

    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;

}
