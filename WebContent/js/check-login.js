/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {
    var user = sessionStorage["login_user"];
    if (!user) {
        alertMsg("ÇëÏÈµÇÂ¼£¡");
        location.href = BaseUrl + "index.html";
    }
});