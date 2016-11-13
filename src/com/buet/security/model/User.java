

package com.buet.security.model;

import com.buet.brtc.model.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
/*@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "user_type", discriminatorType = DiscriminatorType.STRING)
@DiscriminatorValue("admin")*/
@Table(name = "ABC_USER_AUTH")
public class User implements Serializable {

    private static final long serialVersionUID = 7389991231663740924L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long authorizeId;

    @OneToOne
    private Token token;

    private boolean active;

    private String userType;

    @ManyToMany
    private List<AuthorizedGroups> authorizedGroups;


    @OneToMany
    @JoinTable(name = "BRTC_JT_USER_PAY_REQUEST",
            joinColumns = @JoinColumn(name = "USER_ID"),
            inverseJoinColumns = @JoinColumn(name = "REQUEST_ID"))
    private List<PaymentRequest> requestList = new ArrayList<PaymentRequest>();

    @OneToMany
    @JoinTable(name = "BRTC_JT_USER_CONSULTANT",
            joinColumns = @JoinColumn(name = "USER_ID"),
            inverseJoinColumns = @JoinColumn(name = "CONSULTANT_ID"))
    private List<Consultant> consultantList = new ArrayList<Consultant>();


    @OneToMany
    @JoinTable(name = "BRTC_JT_USER_TEAM_MEMBER",
            joinColumns = @JoinColumn(name = "USER_ID"),
            inverseJoinColumns = @JoinColumn(name = "MEMBER_ID"))
    private List<TeamMember> memberList = new ArrayList<TeamMember>();

    @OneToMany
    @JoinTable(name = "BRTC_DIST_JT_TEACHER_RECEIVED",
            joinColumns = @JoinColumn(name = "TEACHER_ID"),
            inverseJoinColumns = @JoinColumn(name = "RECEIVER_ID"))
    private List<Receiver> receiverList = new ArrayList<Receiver>();

    @OneToMany
    @JoinTable(name = "MSG_JT_RECEIVER_MESSAGE",
            joinColumns = @JoinColumn(name = "RECEIVER_ID"),
            inverseJoinColumns = @JoinColumn(name = "MESSAGE_ID"))
    private List<BrtcMsg> receivedMessageList = new ArrayList<BrtcMsg>();

    @OneToMany
    @JoinTable(name = "MSG_JT_SENDER_MESSAGE",
            joinColumns = @JoinColumn(name = "SENDER_ID"),
            inverseJoinColumns = @JoinColumn(name = "MESSAGE_ID"))
    private List<BrtcMsg> sentMessageList = new ArrayList<BrtcMsg>();


    public Long getAuthorizeId() {
        return authorizeId;
    }

    public void setAuthorizeId(Long authorizeId) {
        this.authorizeId = authorizeId;
    }

    public Token getToken() {
        return token;
    }

    public void setToken(Token token) {
        this.token = token;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public List<AuthorizedGroups> getAuthorizedGroups() {
        return authorizedGroups;
    }

    public void setAuthorizedGroups(List<AuthorizedGroups> authorizedGroups) {
        this.authorizedGroups = authorizedGroups;
    }

    public List<PaymentRequest> getRequestList() {
        return requestList;
    }

    public void setRequestList(List<PaymentRequest> requestList) {
        this.requestList = requestList;
    }

    public List<Consultant> getConsultantList() {
        return consultantList;
    }

    public void setConsultantList(List<Consultant> consultantList) {
        this.consultantList = consultantList;
    }

    public List<TeamMember> getMemberList() {
        return memberList;
    }

    public void setMemberList(List<TeamMember> memberList) {
        this.memberList = memberList;
    }

    public List<Receiver> getReceiverList() {
        return receiverList;
    }

    public void setReceiverList(List<Receiver> receiverList) {
        this.receiverList = receiverList;
    }

    public List<BrtcMsg> getReceivedMessageList() {
        return receivedMessageList;
    }

    public void setReceivedMessageList(List<BrtcMsg> receivedMessageList) {
        this.receivedMessageList = receivedMessageList;
    }

    public List<BrtcMsg> getSentMessageList() {
        return sentMessageList;
    }

    public void setSentMessageList(List<BrtcMsg> sentMessageList) {
        this.sentMessageList = sentMessageList;
    }
}
