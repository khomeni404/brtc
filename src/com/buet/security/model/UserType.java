package com.buet.security.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="USER_TYPE")
public class UserType  implements Serializable {
    /*
    This class has been created to manage privileges instead of managing
    Feature, Component, UserGroup and Authority
    This all will be stay freeze. Some group has been created to handel
    privileges through  UserType class
     */

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String typeName;

    private UserGroup userGroup;

    private String description;

}
