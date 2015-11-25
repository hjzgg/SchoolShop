/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.servlet;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Administrator
 */
public class Modify extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        String userID=(String)session.getAttribute("user");
        String password=request.getParameter("password1");
        Connection conn=null;
        Statement sqlStmt=null;
        try {
            URL url = Modify.class.getClassLoader().getResource("../../"); 
            String path = url.getFile();//访问当前web工程所在的物理路径
            path=new java.io.File(path).getParent();
            path=new java.io.File(path).getParent();
            path = path.replaceAll("%20", " ");
            Class.forName("org.sqlite.JDBC").newInstance();
            conn=DriverManager.getConnection("jdbc:sqlite:" + path + "\\usermessages.db3");
            sqlStmt=conn.createStatement();
            sqlStmt.executeUpdate("update customer set psw=\'"+password+"\'where cname=\'"+userID+"\'");
            out.println("恭喜您修改成功");
            response.setHeader("Refresh","3;URL=showuser.jsp");
            if(sqlStmt!=null) sqlStmt.close();
            if(conn!=null)conn.close();
        }catch(java.sql.SQLException e){
            
        }catch(java.lang.Exception e){
            
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
