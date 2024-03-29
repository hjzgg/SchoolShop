/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server;

import com.bean.SQLBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HJZ
 */
public class DeleteData extends HttpServlet {

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
        Connection con = null;
        SQLBean dbMsg = new SQLBean();
        Statement st = null;
        try (PrintWriter out = response.getWriter()) {
              String strSql = request.getParameter("sql");
            strSql = strSql.trim();
            if("".equals(strSql)){
                response.sendRedirect("error.jsp?type=deleteOK&error=success delete!");
                return ;
            }
            String[] sql = strSql.split("\\$");
            con = dbMsg.getConncetion();
            con.setAutoCommit(false);
            st = dbMsg.getStatement();
            for(int i=0; i<sql.length; ++i)
                       st.executeUpdate(sql[i]);
            con.commit();
            response.sendRedirect("error.jsp?type=deleteOK&error=success delete!");
        } catch (SQLException e) {
            try {
                con.rollback();
                response.sendRedirect("error.jsp?type=deleteNo&error=" + e.getMessage());
            } catch (SQLException ex) {
                response.sendRedirect("error.jsp?type=deleteNo&error=" + ex.getMessage());
            }
        } finally {
            dbMsg.close();
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
