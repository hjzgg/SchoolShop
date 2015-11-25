/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server;

import com.bean.SQLBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HJZ
 */
public class CustomerOrder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        Cookie cookies[] = request.getCookies();
        boolean isLogin = false;
        for(int i=0; i<cookies.length; ++i)
                if(cookies[i].getName().equals("UserFlag") && cookies[i].getValue().equals("OK")){
                    isLogin = true;
                    break;
                }
        if(!isLogin){
            out.println("false");
            return ;
        }
        if("true".equals(request.getParameter("buyNow"))){
            out.println("true");
            return ;
        }
        Statement sta = null;
        HttpSession session = null;
        SQLBean dbMsg = new SQLBean(); 
        session = request.getSession();
        Map<String, Integer>mp = null, mp_money = null;
        mp = (TreeMap<String, Integer>) session.getAttribute("customer_order");
        mp_money = (TreeMap<String, Integer>)session.getAttribute("food_money");
        String picName = null, count = null, money=null;
        picName = request.getParameter("picName");
        count = request.getParameter("count");
        money = request.getParameter("money");
        if(count!=null && picName!=null && money!=null){
                if(!mp.containsKey(picName)) mp.put(picName, Integer.parseInt(count));
                else  mp.put(picName, mp.remove(picName)+Integer.parseInt(count));
                if(!mp_money.containsKey(picName)) mp_money.put(picName, Integer.parseInt(money));
        }
        try{
            dbMsg.getConncetion();
            sta =dbMsg.getStatement();
            if(picName != null && count!=null){
                String sql = "update food set cnt=cnt-" + count + " where picName=\'" + picName + "\'";
                sta.executeUpdate(sql);
            }
            dbMsg.close();
            out.println("true");
        } catch (SQLException e) {
            
        }  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
