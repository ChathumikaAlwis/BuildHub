package mypckg;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Chath
 */
public class User {


    /**
     * @return the firstname
     */
    
    void setCPName(String cpname) {
     this.cpname = cpname;
    }

    void setRegId(String regId) {
        this.regId = regId;
    }
    
    
    
    public String getFirstname() {
        return firstname;
    }

    /**
     * @param firstname the firstname to set
     */
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    /**
     * @return the lastname
     */
    public String getLastname() {
        return lastname;
    }

    /**
     * @param lastname the lastname to set
     */
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the tele
     */
    public int getTele() {
        return tele;
    }

    /**
     * @param tele the tele to set
     */
    public void setTele(int tele) {
        this.tele = tele;
    }

    /**
     * @return the regDate
     */
    public String getRegDate() {
        return regDate;
    }

    /**
     * @param regDate the regDate to set
     */
    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the NIC
     */
    public String getNIC() {
        return NIC;
    }

    /**
     * @param NIC the NIC to set
     */
    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

        void setDesc(String desc) {
        this.desc = desc;
    }

    void setRole(String role) {
        this.role = role;
    }
    
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the lastLogin
     */
    public String getLastLogin() {
        return lastLogin;
    }

    /**
     * @param lastLogin the lastLogin to set
     */
    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    /**
     * @return the password
     */
//    public String getPassword() {
//        return password;
//    }

    /**
     * @param password the password to set
     */
    private String password;private String username,role,desc,cpname,regId;
    private String firstname;private String lastname;private String addr;private String dob;private int tele;private String regDate;
    private String gender;private String NIC;private String email;private String lastLogin;
    
    
    
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }
    InputStream ip2;
    public void setProfPic(InputStream ip2) {
        this.ip2 = ip2;
    }

    Connection connection;
    ResultSet rs;
    //String url = "jdbc:mysql://localhost:3306/test?zeroDateTimeBehavior=convertToNull";//path of db for users    
    
    public String addNMUser() throws SQLException, ClassNotFoundException{
    DbConnection con = new DbConnection();    
    String sql = "INSERT INTO customer(Password,Fname,Lname,Contact_No,Address,NIC,Email,Account_Created,Last_Login,Profile_Pic) VALUES('" +password+ "','"+firstname+"','"+lastname+"','"+tele+"','"+addr+"','"+NIC+"','"+email+"','"+regDate+"','"+lastLogin+"','"+ip2+"');";
    String r = con.execInsert(sql);
        System.out.println(r+"blaaaaa");
    return r;
    }
    
    public String addBSUser() throws SQLException, ClassNotFoundException{
    DbConnection con = new DbConnection();    
    String sql = "INSERT INTO business_user(Password,Fname,Lname,Contact_No,Address,NIC,Email,Account_Created,Last_Login,Role,Description,Profile_Pic) VALUES('" +password+ "','"+firstname+"','"+lastname+"','"+tele+"','"+addr+"','"+NIC+"','"+email+"','"+regDate+"','"+lastLogin+"','"+role+"','"+desc+"','"+ip2+"');";
    String r = con.execInsert(sql);
    return r;
    }
    
    public String addSupplier() throws SQLException, ClassNotFoundException{
    DbConnection con = new DbConnection();    
    String sql = "INSERT INTO supplier(Password,company_name,Contact,Address,Email,Account_Created,Last_Login,Bussiness_Regis_ID,Profile_Pic) VALUES('" +password+ "','"+cpname+"','"+tele+"','"+addr+"','"+email+"','"+regDate+"','"+lastLogin+"',"+regId+",'"+ip2+"');";
    String r = con.execInsert(sql);
    return r;
    }
            
    public String validateUser() throws SQLException, ClassNotFoundException{
    DbConnection con = new DbConnection();    
    String sql = "SELECT COUNT(cusid) FROM customer WHERE email='"+username+"' AND password='"+password+"'";
    try{
     rs = con.executeSelect(sql);
    }
    catch(Exception e){return e.getMessage();}
    rs.next();
    String r= rs.getString(1);

    return r;
    }     
    
    public String updateUser(String username) throws SQLException, ClassNotFoundException{
    DbConnection con = new DbConnection();
    String uname = username;
    String sql = "UPDATE customer set lastLogin='"+LocalDateTime.now().toString() +"' WHERE email='"+uname+"'";
    String r = con.execUpdate(sql);
        System.out.println(r);
    System.out.println(r);
    return r;
    }

            
    public String getProjects(String ownerId) throws SQLException, ClassNotFoundException{       
    DbConnection con = new DbConnection();    
    String sql = "SELECT COUNT(Owner) FROM project WHERE Owner='"+ownerId+"'";
    ResultSet rs = con.executeSelect(sql);
    String r = rs.getString(0);  
    return r;
    }
        
    public String getID() throws SQLException, ClassNotFoundException{       
    DbConnection con = new DbConnection();    
    String sql = "SELECT ID FROM customer WHERE email='"+username+"'";
    ResultSet rs = con.executeSelect(sql);
    String r = rs.getString(0);  
    return r;
    }
}
