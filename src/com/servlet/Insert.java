/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.servlet;

import java.io.*;
import java.net.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Administrator
 */
public class Insert extends HttpServlet {

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
        String userID=request.getParameter("userID");
        if(userID==null)userID="";
        String password=request.getParameter("password");
        if(password==null)password="";
        Connection conn=null;
        Statement sqlStmt=null;
        ResultSet sqlRst=null;
        int mark=0;
        try {
            URL url = Insert.class.getClassLoader().getResource("../../"); 
            String path = url.getFile();//访问当前web工程所在的物理路径
            path=new java.io.File(path).getParent();
            path=new java.io.File(path).getParent();
            path = path.replaceAll("%20", " ");
            Class.forName("org.sqlite.JDBC").newInstance();
            conn=DriverManager.getConnection("jdbc:sqlite:" + path + "\\usermessages.db3");
            sqlStmt=conn.createStatement();
            String sqlQuery="select * from customer";
            sqlRst=sqlStmt.executeQuery(sqlQuery);
            while(sqlRst.next()){
                if((userID.equals(sqlRst.getString(1)))){
                    mark=1;
                    response.sendRedirect("./loginUser/register.jsp");
                    break;
                }
            }
            if(mark==0){
                 sqlStmt.executeUpdate("insert into customer values(\'" + userID + "\', \'" + password + "\')");
                 response.sendRedirect("./loginUser/insertSuccess.html");
            }
            if(sqlRst!=null) sqlRst.close();
            if(sqlStmt!=null) sqlStmt.close();
            if(conn!=null)    conn.close();
           } catch(java.sql.SQLException e){
               out.println(e.getMessage());
           }catch(java.lang.Exception e){
               out.println(e.getMessage());
           }finally{
               out.close();
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
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
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
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
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
