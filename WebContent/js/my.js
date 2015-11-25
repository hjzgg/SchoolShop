/**
 * @author MyPC
 */

$(function () {
    var user = sessionStorage["login_user"];
    if (!user) {
        alertMsg("请先登录！");
        location.href = BaseUrl + "index.html";
    }

	//实现点击表头排序
	var isUp = true;
	$(".tablelist th a").bind("sort", function(e, int_cols,float_cols, res, tableId) {
		/*
		 * 函数参数：
		 * e: js事件对象，在这里没什么用，只是占用第一个参数的位置。
		 * int_cols: 一个数组。存放类型是int的列名 。
		 * float_cols: 一个数组。存放类型是float的列名 。
		 * res: 需要排序的数据，该数据排序后会放回表格。
		 * tableId: 要将数组写回表格的id名。
		 */
		$(".tablelist th img").attr("class", "");
		var imgs = $(this).siblings();
		var html = $(this).html();
		var data_key = $(this).parents().attr("data-key");
		var flag = isUp ? 1 : -1
		var len = int_cols.length;
		var curr_int = false;
		var curr_float = false;
		
		for (var i = 0; i < len; ++i) {
			if (html == int_cols[i]) {
				curr_int = true;
			}
		}
		
		if (curr_int == false) {
			for (var i = 0; i < len; ++i) {
				if (html == float_cols[i]) {
					curr_float = true;
				}
			}
		}
		
		if (curr_int) {
			res.sort(function (a, b) {
				return flag * (parseInt(a[data_key]) - parseInt(b[data_key]));
			});
		} else if (curr_float) {
			res.sort(function (a, b) {
				return flag * (parseFloat(a[data_key]) - parseFloat(b[data_key]));
			});
		} else {
			res.sort(function (a, b) {
				return (a[data_key] > b[data_key] ? 1 : a[data_key] < b[data_key] ? -1 : 0) * flag;
			});
		}
		
		if (isUp) {
			imgs[0].className = "up";
			padBackTable(res, tableId);
			isUp = false;
		} else {
			padBackTable(res, tableId);
			imgs[1].className = "down";
			isUp = true;
		}
	});
	
	$(".tablelist .chk_all").click(function () {
		var checked = $(".tablelist .chk_all").attr("checked");
		var chk_boxs = $(".tablelist td .checkbox");
		
		if (checked == "checked") {
			chk_boxs.attr("checked", true);
		} else {
			chk_boxs.attr("checked", false);
		}
	});
	
	$(".tablelist .chk_all").attr("checked", false);
	
	$(".tablelist td .checkbox").live("click", function () {
		var checked = $(this).attr("checked");
		var chk_boxs = $(".tablelist td .checkbox");
		
		if (checked != "checked") {
			$(".tablelist .chk_all").attr("checked", false);
		} else {
			var flag = true;
			
			
			for (var i = 0; i < chk_boxs.length; ++i) {
				if (!chk_boxs[i].checked) {
					flag = false;
					break;
				}
			}
			
			$(".tablelist .chk_all").attr("checked", flag);
		}
	});
	
	$(".content .decheck").click(function () {
		var flag = true;
		var chk_boxs = $(".tablelist td .checkbox");
		
		for (var i = 0; i < chk_boxs.length; ++i) {
			if (chk_boxs[i].checked) {
				chk_boxs[i].checked = false;
				flag = false;
			} else {
				chk_boxs[i].checked = true;
			}
		}
		
		$(".tablelist .chk_all").attr("checked", flag);
	});
	
	$(".content .chg_chk").bind("chg_chk", function (e, l, r, res) {
		var tableId = $(this).parents(".content").children(".tablelist").attr("id");
		//var tableData = getTableData("#" + tableId);
		var table = document.getElementById(tableId);
		var chk_boxs = $(".tablelist td .checkbox");
		var chk_idxs = [];
		var cnt = 0;
		
		for (var i = 0; i < chk_boxs.length; ++i) {
			if (chk_boxs[i].checked) {
				chk_idxs[cnt++] = i;
			}
		}
		
		for (var i = 0; i < chk_idxs.length; ++i) {
			//var len = table.rows[chk_idxs[i]].cells.length;
			
			for (var j = l; j < r; ++j) {
				var th = $("#" + tableId).children("thead").children("tr").children("th:eq(" + j + ")").attr("data-key");
				var w = $("#" + tableId).children("thead").children("tr").children("th:eq(" + j + ")").width();
				var h = $("#" + tableId).children("thead").children("tr").children("th:eq(" + j + ")").height();
				table.rows[chk_idxs[i] + 1].cells[j].innerHTML = "<input type='text' id='" + chk_idxs[i] + "" + j + "' />";
				$("#" + chk_idxs[i] + "" + j).focus().val(res[chk_idxs[i]][th]);
				$("#" + chk_idxs[i] + "" + j).select();
				$("#" + chk_idxs[i] + "" + j).attr("class", "chg_input");
				$("#" + chk_idxs[i] + "" + j).css("width", w + "px");
				$("#" + chk_idxs[i] + "" + j).css("height", h + "px");
				$("#" + chk_idxs[i] + "" + j).css("padding", "0px 0px 0px 0px");
				$("#" + chk_idxs[i] + "" + j).css("margin", "0px");
			}
		}
		
		$("#" + chk_idxs[0] + "" + l).select();
	});

	$(".content .del_chk").bind("del_chk", function (e, l, r, res) {
		var tableId = $(this).parents(".content").children(".tablelist").attr("id");
		var chk_boxs = $(".tablelist td .checkbox");
		var chk_idxs = [];
		var cnt = 0;
		var tableId = $(".tablelist").attr("id");
		var tname = tableId.substr(0, tableId.length - 1);
		var th = $("#" + tableId).children("thead").children("tr").children("th:eq(2)").attr("data-key");
		var len = res.length;
		var flag = 0;

		for (var i = 0; i < chk_boxs.length; ++i) {
			if (chk_boxs[i].checked) {
				flag = 1;
				break;
			}
		}
		
		if (flag == 0) {
			return ;
		}
		
		if (!confirm("您确定要删除吗？")) {
			return ;
		}
		
		for (var i = 0; i < chk_boxs.length; ++i) {
			if (!chk_boxs[i].checked) {
				res[cnt++] = res[i];
			} else {
				var sql = "delete from " + tname + " where " + th + "='" + res[i][th] + "';";
				update(sql);
			}
		}
		
		res.length = cnt;
		
		for (var i = 0; i < res.length; ++i) {
			res[i]["no"] = i + 1;
		}
		
		padBackTable(res, "#" + tableId);
	});
	
	$(".tablelist tbody tr td").live("dbclicktd" ,function (e, l, r, res) {
		var cols = $(this).index();
		var rows = $(this).parent().index(); 
		var tableId = $(this).parent().parent().parent().attr("id")
		var th = $("#" + tableId).children("thead").children("tr").children("th:eq(" + cols + ")").attr("data-key");

		if (cols >= l && cols < r) {
			var w = $(this).width();
			var h = $(this).height();
			//alert(w + ":" + h);
			$(this).html("<input id='" + rows + "" + cols + "' type='text' />");
			$("#" + rows + "" + cols).focus().val(res[rows][th]);
			$("#" + rows + "" + cols).select();
			$("#" + rows + "" + cols).css("width", w + "px");
			$("#" + rows + "" + cols).css("height", h + "px");
			$("#" + rows + "" + cols).attr("class", "chg_input");
			$("#" + rows + "" + cols).css("padding", "0px 0px 0px 0px");
			$("#" + rows + "" + cols).css("margin", "0px");
			var w1 = $("#" + rows + "" + cols).width();
			var h2 = $("#" + rows + "" + cols).height();
			//alert(w1 + ":" + h2);
		}
	});
	
	$(".tablelist tbody tr td .chg_input").live("change_chg_input", function (e, res) {
		var c = $(this).parent().index();
		var r = $(this).parent().parent().index();
		var th = $(".tablelist").children("thead").children("tr").children(":eq(" + c + ")").attr("data-key");
		
		res[r][th] = $("#" + r + "" + c).val();
	});
	
	$(".tablelist tbody tr td .chg_input").live("blur", function () {
		var c = $(this).parent().index();
		var val = $.trim($(this).val());
		var date_reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
		var num_reg = /^\d+\.\d+$/;
		
		$(this).val(val);
		if (c == 3 || c == 4) {
			if (val == "") {
				$(this).css("color", "red");
				$(this).val("不能为空！")
			}
		} else if (c == 6) {
			if (val == "") {
				$(this).css("color", "red");
				$(this).val("不能为空！")
			} else if (!date_reg.test(val)) {
				$(this).css("color", "red");
				$(this).val(val + "不合法！");
			}
		} else if (c == 7 || c == 8) {
				if (val != "" && !num_reg.test(val)) {
					$(this).css("color", "red");
					$(this).val(val + "不合法！")
				}
		}
	});
	
	$(".tablelist tbody tr td .chg_input").live("focus", function () {
		var val = $.trim($(this).val());
		
		if (val.indexOf("不合法！") != -1 || val.indexOf("不能为空！") != -1) {
			$(this).css("color", "black");
			$(this).val("");
		}
	});
	
	$(".tablelist tbody tr td a.chg_a").live("click_chg_a", function (e, l, r, res) {
		var rows = $(this).parent().parent().index();

		$(this).parent().parent().children(":eq(0)").children().attr("checked", "true");
		$(".content .chg_chk").trigger("chg_chk", [l, r, res]);
		$("#" + rows + "" + l).select();
	});
	
	$(".tablelist tbody tr td a.del_a").live("click_del_a", function (e, l, r, res) {
		var tableId = $(this).parents(".tablelist").attr("id");
		var tname = tableId.substr(0, tableId.length - 1);
		var th = $("#" + tableId).children("thead").children("tr").children("th:eq(2)").attr("data-key");
		var rows = $(this).parent().parent().index();
		var len = res.length;
		var sql = "delete from " + tname + " where " + th + "='" + res[rows][th] + "';";
		
		if (!confirm("您确定要删除吗？")) {
			return ;
		}
		
		update(sql);
		for (var i = rows + 1; i < len; ++i) {
			res[i - 1] = res[i];
			res[i - 1]["no"] = i;
		}
		
		res.length = len - 1;
		padBackTable(res, "#" + tableId);
		
		if (tableId == "emps") {
			selectInfo("disabled", 5, 9);
		}
	});
	
	$(".tablelist td input.chg_input").live("click", function () {
		$(this).select();
	});
	
	$(".content .save").live("click_save", function (e, l, r, newRes, oldRes, dbtname) {
		var tableId = $(".content").children(".tablelist").attr("id");
		var sqls = [];
		
		for (var i = 0; i < newRes.length; ++i) {
			sqls[i] = "update " + dbtname + " set ";
			
			for (j = l + 1; j < r; ++j) {	
				var th = $(".tablelist").children("thead").children("tr").children(":eq(" + j + ")").attr("data-key");
				if (j == l + 1) {
					sqls[i] += th + "='" + newRes[i][th] + "'";
				} else {
					sqls[i] += "," + th + "='" + newRes[i][th] + "'";
				}
			}
			
			var th = $(".tablelist").children("thead").children("tr").children(":eq(" + l + ")").attr("data-key");
			sqls[i] += "where " + th + "='" + newRes[i][th] + "'";
		}
		
		batchUpdateAsync(sqls, function () {
			padBackTable(newRes, "#" + tableId);
		}, function () {
			alert("更新失败！");
			//padBackTable(oldRes, "#" + tableId);
		});
		
		$(".content .chk_all").attr("checked", false);
	});
	
	$(".not_null").blur(function () {
		var id = $(this).attr("id");
		var chk_id = "chk_" + id;
		var field = $(this).parent().parent().children().html();

		checkRes = notNull(field.substr(0, field.length - 1), "#" + id);
		
        if (checkRes != 1) {
			$("#" + chk_id).css("color", "red");
            $("#" + chk_id).html(checkRes);
		} else {
			$("#" + chk_id).css("color", "black");
			$("#" + chk_id).html("正确！");
		}
	});
	
	$(".num").blur(function () {
		var id = $(this).attr("id");
		var chk_id = "chk_" + id;
		var field = $(this).parent().parent().children().html();

		checkRes = isNum(field.substr(0, field.length - 1), "#" + id);
		
        if (checkRes != 1) {
			$("#" + chk_id).css("color", "red");
            $("#" + chk_id).html(checkRes);
		} else {
			$("#" + chk_id).css("color", "black");
			$("#" + chk_id).html("正确！");
		}
	});
});

function isLeap(year)
{
	if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
		return true;
	} else {
		return false;
	}
}

function selectInfo(disabled, a, b) {
	sql = "select empno, ename from emp;";
	var empnos = query(sql);
	sql = "select dname, deptno from dept;";
	var dnames = query(sql);
	
	var len = $(".tablelist").children("tbody").children("tr").length;
	for (var i = 0; i < len; ++i) {
		var empno = $(".tablelist").children("tbody").children(":eq(" + i + ")").children(":eq(" + a + ")").html();
		var dname = $(".tablelist").children("tbody").children(":eq(" + i + ")").children(":eq(" + b + ")").html();
		
		$(".tablelist").children("tbody").children(":eq(" + i + ")").children(":eq(" + a + ")").html("<select id='" + i + a + "'></select>");
		$(".tablelist").children("tbody").children(":eq(" + i + ")").children(":eq(" + b + ")").html("<select id='" + i + b + "'></select>");
		$("#" + i + "" + a).attr("class", "chg_input");
		$("#" + i + "" + b).attr("class", "chg_input");
		$("#" + i + "" + a).append("<option value=''>暂无</option>");
		$("#" + i + "" + b).append("<option value=''>暂无</option>");
		document.getElementById(i + "" + a).disabled = disabled;
		document.getElementById(i + "" + b).disabled = disabled;
		
		for (var j = 0; j < empnos.length; ++j) {
			$(".tablelist").children("tbody").children(":eq(" + i + ")").children(":eq(" + a + ")").children().append("<option value='" + empnos[j]["empno"] + "'>" + empnos[j]["ename"] + "</option>");
			if (empno == empnos[j]["empno"]) {
				$("#" + i + "" + a).children(":eq(" + (j + 1) + ")").attr("selected", true);
			}
		}
		for (var j = 0; j < dnames.length; ++j) {
			$(".tablelist").children("tbody").children(":eq(" + i + ")").children(":eq(" + b + ")").children().append("<option value='" + dnames[j]["deptno"] + "'>" + dnames[j]["dname"] + "</option>");
			if (dname == dnames[j]["dname"]) {
				$("#" + i + "" + b).children(":eq(" + (j + 1) + ")").attr("selected", true);
			}
		}
	}
}

function mergeTableTd(selector)
{
	var tableData = getTableData(selector);
	$(".tablelist tbody").children(":eq(0)").children(":eq(0)").attr("rowspan", cnt + "");
	var th = $(".tablelist thead").children(":eq(0)").children(":eq(0)").attr("data-key");
	
	var rows = tableData.length;
	for (var i = 1; i < rows; ) {
		var cnt = 0;
		for (j = i ; j < rows && tableData[j][th] == tableData[j - 1][th]; ++j) {
			++cnt;
			$(".tablelist tbody").children(":eq(" + j + ")").children(":eq(0)").remove();
		}
		
		if (cnt != 0) {
			$(".tablelist tbody").children(":eq(" + (i - 1) + ")").children(":eq(0)").attr("rowspan", (cnt + 1) + "");
		}
		
		i = j + 1;
	}
}
