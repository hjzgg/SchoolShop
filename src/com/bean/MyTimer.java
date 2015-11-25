/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.TimerTask; 
import java.util.Timer; 
import javax.servlet.ServletContextEvent; 
import javax.servlet.ServletContextListener; 
 
public class MyTimer implements ServletContextListener { 
   
    private Timer timer = null; 
    public void contextInitialized(ServletContextEvent event) { 
        timer = new Timer(false); 
        /* 
         * 这里开始循环执行 MyJob()方法了 
         * schedule(param1, param2,param3)这个函数的三个参数的意思分别是： 
         *    param1：你要执行的方法；param2：延迟执行的时间，单位毫秒；param3：循环间隔时间，单位毫秒 
         */ 
        timer.schedule(new MyTask(), 0, 5000); 
    } 

    public void contextDestroyed(ServletContextEvent event) { 
        timer.cancel(); 
    } 
} 


class MyTask extends TimerTask {  
    ResultSet rs = null;
    Statement sta = null, stax = null;
    Connection con = null;
    SQLBean dbMsg = null;
    public void run() {  
        try {
            dbMsg = new SQLBean();
            con = dbMsg.getConncetion();
            con.setAutoCommit(false);
            sta = con.createStatement();
            stax = con.createStatement();
            rs = sta.executeQuery("select billtime from billmsg");
            while(rs.next()){
                Timestamp ts = rs.getTimestamp(1);
                Date dt = new Date();
                boolean flag = false;
                if(ts.getYear() < dt.getYear()) flag = true;
                if(ts.getMonth() < dt.getMonth()) flag = true;
                if(ts.getDay() < dt.getDay()) flag = true;
                if(flag)
                    stax.executeUpdate("delete from billmsg where billtime=\'"+ ts.toString() + "\'");//删除该条数据
            }
            con.commit();
        } catch (Exception e) {
        } finally{
            dbMsg.close();
            try{
                if(sta != null) sta.close();
                if(stax != null) stax.close();
                if(rs != null) rs.close();
            } catch (SQLException e){
            }
        }
    }  
}  
  