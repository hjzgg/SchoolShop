/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {
    var user = sessionStorage["login_user"];
    if (!user) {
        alertMsg("���ȵ�¼��");
        location.href = BaseUrl + "index.html";
    }
});