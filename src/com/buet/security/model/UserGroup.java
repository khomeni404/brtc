

package com.buet.security.model;

import org.hibernate.annotations.CollectionOfElements;

import java.io.Serializable;
import java.util.*;

import javax.persistence.*;

@Entity
@Table(name = "ABC_USER_GROUP")
public class UserGroup implements Serializable {

    private static final long serialVersionUID = 7389991231663740924L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long groupId;

    @Column (name="group_name")
    private String groupName;

    private String groupDescription;

    @ManyToMany
    @CollectionOfElements
    private Set<User> userList = new HashSet<User>();

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Set<User> getUserList() {
        return userList;
    }

    public void setUserList(Set<User> userList) {
        this.userList = userList;
    }

    public String getGroupDescription() {
        return groupDescription;
    }

    public void setGroupDescription(String groupDescription) {
        this.groupDescription = groupDescription;
    }
}
