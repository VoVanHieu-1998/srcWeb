package com.cdweb.entity;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "reply")
public class Reply {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int repltId;

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="commentId",nullable=false)
    private Comment comment_reply;

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="userId",nullable=true)
    private Users user_reply;
    private String content;

    private String name;
    private String email;
    private String phoneNumber;

    private int activeFlag;
    private Date createDate;
    private Date updateDate;

    public int getRepltId() {
        return repltId;
    }

    public void setRepltId(int repltId) {
        this.repltId = repltId;
    }

    public Comment getComment_reply() {
        return comment_reply;
    }

    public void setComment_reply(Comment comment_reply) {
        this.comment_reply = comment_reply;
    }

    public Users getUser_reply() {
        return user_reply;
    }

    public void setUser_reply(Users user_reply) {
        this.user_reply = user_reply;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getActiveFlag() {
        return activeFlag;
    }

    public void setActiveFlag(int activeFlag) {
        this.activeFlag = activeFlag;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
