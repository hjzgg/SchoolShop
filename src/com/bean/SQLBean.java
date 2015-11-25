/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author HJZ
 */
public class SQLBean {
     private  Connection con = null;
     private  Statement sta = null;
     private  ResultSet rt = null;
     private  PreparedStatement psta = null;
     public SQLBean(){
     }
      
    /**
     * @return the con
     * 涓�鑸摼鎺ysql
     */
    public Connection getConncetion(){
         try {
             Class.forName("org.gjt.mm.mysql.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost/schoolshop", "root", "hjzgg5211314");
         } catch (ClassNotFoundException e) {
             
         } catch (SQLException e) {
             
         }
        return con;
    }
    /**
     * @return the sta
     */
    public Statement getStatement2(){
        if(con != null){
            try {
                sta = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            } catch (SQLException e) {
                
            }
        }
        return sta;
    }
   
    
   public Statement getStatement(){
        if(con != null){
            try {
                sta = con.createStatement();
            } catch (SQLException e) {
                
            }
        }
        return sta;
    }

    public PreparedStatement getPreparedStatement2(String sql) throws SQLException {
        if(con != null){
            psta = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        }
        return psta;
    }
   public ResultSet getResultSet(String sql){
        if(sta != null)
             try {
                 rt = sta.executeQuery(sql);
        } catch (SQLException ex) {
        }
        return rt;
   }
   public PreparedStatement getPreparedStatement(String sql) throws SQLException {
        if(con != null){
            psta = con.prepareStatement(sql);
        }
        return psta;
    }
   
    /**
     * @return the rt
     */
     
    public void close(){
        try{
                if(rt != null) rt.close();
                if(sta != null) sta.close();
                if(psta != null) psta.close();
                if(con != null) con.close();
        }catch(SQLException e){
        
        }
    }
}
