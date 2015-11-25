/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.server;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HJZ
 */

public class AddData extends HttpServlet {

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
        Connection con = null;
        PreparedStatement foodSta = null, picSta = null;
        PrintWriter out = response.getWriter();
        int dataRow = 0;
        try{
                URL url = AddData.class.getClassLoader().getResource("../../"); 
                String rootPath = url.getFile();
                rootPath=new java.io.File(rootPath).getParent();
                rootPath=new java.io.File(rootPath).getParent();
                rootPath = rootPath.replaceAll("%20", " ");
                request.setCharacterEncoding("utf-8");
                String path = request.getParameter("theFilePath");
                BufferedReader br = new BufferedReader(new FileReader(new File(path)));
                //链接sqlite3数据库时，发现对图片的存入操作支持的不是很好，于是选择利用mysql
                //Class.forName("org.sqlite.JDBC");
                // con = DriverManager.getConnection("jdbc:sqlite:" + rootPath + "schoolshop.db3");
                Class.forName("org.gjt.mm.mysql.Driver");
                //可以将localhost改为某一台机器的ip！
                con = DriverManager.getConnection("jdbc:mysql://localhost/schoolshop", "hjz", "5211314");
                String msg = null;
                boolean errorName = false;
                boolean errorPic = false;
                while((msg=br.readLine()) != null){
                    ++dataRow;
                    String[] tmp = msg.split("(\\s+)");
                    if(tmp.length != 8){
                        errorName = true;
                        continue;
                    }
                    String picPath = tmp[7];
                    picPath = rootPath + "FoodPicture/" + tmp[7];
                    FileInputStream fi = new FileInputStream(new File(picPath));
                    if(fi == null){
                        errorPic = true;
                        break;
                    }
                    foodSta = con.prepareStatement("insert into food(place, floor, window, food, describing, picName, money, cnt, picpath) values(?,?,?,?,?,?,?,?,?)");
                    picSta = con.prepareStatement("insert into foodpicture(picName,picture) values(?,?)") ;
                    for(int i=0; i<5; ++i)
                        foodSta.setString(i+1, tmp[i]);
                    foodSta.setString(6, tmp[0]+tmp[1]+tmp[2]+tmp[3]);
                    foodSta.setInt(7, Integer.valueOf(tmp[5]));
                    foodSta.setInt(8, Integer.valueOf(tmp[6]));
                    foodSta.setString(9, picPath);
                    foodSta.executeUpdate();
                    picSta.setString(1, tmp[0]+tmp[1]+tmp[2]+tmp[3]);
                    picSta.setBlob(2, fi);
                    picSta.executeUpdate();
                }
                if(errorName == true) throw new Exception("数据格式错误！");
                if(errorPic == true) throw new Exception("图片位置错误！");
                response.sendRedirect("error.jsp?error=" + "Success!yeah...." + "&type=success");
        } catch (SQLException e) {
              response.sendRedirect("error.jsp?error=" + "Execute data at "+ dataRow + "th row:" + e.getMessage() + "&type=add");
        } catch (ClassNotFoundException e) {
              response.sendRedirect("error.jsp?error=" + "Execute data at "+ dataRow + "th row:" + e.getMessage() + "&type=add");
        } catch (Exception e) {
              response.sendRedirect("error.jsp?error=" + "Execute data at "+ dataRow + "th row:" + e.getMessage() + "&type=add");
        } finally {
            try{
                if(foodSta != null) foodSta.close();
                if(picSta != null)  picSta.close();
                if(con != null) con.close();
            } catch (SQLException e){
                response.sendRedirect("error.jsp?error=" + e.getMessage() + "&type=add");
            }
        }
    }
    
    // <editor-fold defaultfoodState="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
