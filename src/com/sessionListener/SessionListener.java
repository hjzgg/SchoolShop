/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sessionListener;

import com.bean.SQLBean;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {

	public void sessionCreated(HttpSessionEvent arg0) {
		 HttpSession session = arg0.getSession();
                 session.setAttribute("customer_order", new TreeMap<String, Integer>());//订单分数
                 session.setAttribute("food_money", new TreeMap<String, Integer>());//每一份订单的价格
                 session.setMaxInactiveInterval(300);//通过设置session的过期的时间来制定订单的过期时间！
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
                Connection con = null;
                Statement sta = null;
                SQLBean dbMsg = new SQLBean();
                HttpSession session = arg0.getSession();
                Map<String, Integer> mp  = (Map<String, Integer>)session.getAttribute("customer_order");
                try{
                    con = dbMsg.getConncetion();
                    con.setAutoCommit(false);
                    sta = dbMsg.getStatement();
                    for(String key : mp.keySet()){
                        String picName = null;
                        int count = 0;
                        picName = key;
                        count = mp.get(key);
                        if(picName != null){
                            String sql = "update food set cnt=cnt+" + count + " where picName=\'" + picName + "\'";
                            sta.executeUpdate(sql);
                        }
                    }
                    con.commit();
                    dbMsg.close();
                } catch (SQLException e) {
                    try{
                        con.rollback();
                    } catch (SQLException ex){
                    
                    }
                }  
	}
}
