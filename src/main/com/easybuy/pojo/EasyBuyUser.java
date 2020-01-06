package com.easybuy.pojo;

import java.util.Date;

/**
 * 存放用户基本信息类
 * @author Allen
 * @date 2019/12/23 15:45
 */
public class EasyBuyUser {
    private String userId; //用户名 主键
    private String userName;//用户真实姓名
    private String passWords;//密码
    private String sex;//性别 T为男 F为女
    private Date birthday;//出生日期
    private String identityCode;//身份证号码
    private String email;//电子邮箱
    private String mobile;//手机号码
    private String address;//收货地址
    private double login;//是否登录
    private int statuss;//用户类型 1为普通用户 2为管理员

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWords() {
        return passWords;
    }

    public void setPassWords(String passWords) {
        this.passWords = passWords;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIdentityCode() {
        return identityCode;
    }

    public void setIdentityCode(String identityCode) {
        this.identityCode = identityCode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLogin() {
        return login;
    }

    public void setLogin(double login) {
        this.login = login;
    }

    public int getStatuss() {
        return statuss;
    }

    public void setStatuss(int statuss) {
        this.statuss = statuss;
    }

    public EasyBuyUser(String userId, String userName, String passWords, String sex, Date birthday, String identityCode, String email, String mobile, String address, double login, int statuss) {
        this.userId = userId;
        this.userName = userName;
        this.passWords = passWords;
        this.sex = sex;
        this.birthday = birthday;
        this.identityCode = identityCode;
        this.email = email;
        this.mobile = mobile;
        this.address = address;
        this.login = login;
        this.statuss = statuss;
    }

    public EasyBuyUser() {
    }
}
