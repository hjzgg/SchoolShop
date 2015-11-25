/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server;

import com.bean.SQLBean;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HJZ
 */

public class GetPicture extends HttpServlet {

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
        //response.setContentType("image/gif");
        ResultSet rt =null;
        FileInputStream fi = null;
        String picName = request.getParameter("picName");
        String file = request.getParameter("file");
        SQLBean dbMsg = new SQLBean();
        try (ServletOutputStream so = response.getOutputStream();) {
            if(file==null){
                dbMsg.getConncetion();
                dbMsg.getStatement();
                rt = dbMsg.getResultSet("select * from  foodpicture where picName =\'" + picName + "\'");
                if(rt.next()){
                    Blob blob = rt.getBlob("picture");
                    byte[] bt = blob.getBytes(1, (int)blob.length());
                    so.write(bt);
                    so.flush();
                    so.close();
                } else throw new Exception(picName+" ∏√Õº∆¨≤ª¥Ê‘⁄!");
            } else if("true".equals(file)){
                byte[] bt = new byte[1024];
                fi = new FileInputStream(new File(picName));
                int len = -1;
                while((len=fi.read(bt)) != -1)
                    so.write(bt, 0, len);
                so.flush();
                so.close();
            }
        } catch (SQLException e) {
            response.sendRedirect("error.jsp?error=" + e.getMessage() + "&type=load");
        } catch (ClassNotFoundException e) {
            response.sendRedirect("error.jsp?error=" + e.getMessage() + "&type=load");
        } catch (Exception e) {
            response.sendRedirect("error.jsp?error=" + e.getMessage() + "&type=load");
        } finally {
                dbMsg.close();
                if(fi != null) fi.close();
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
