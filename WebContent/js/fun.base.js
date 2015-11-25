/**
 * jQuery gridmenu (Julying) Plug-in v1.0
 *
 * Home : http://julying.com/lab/gridmenu/
 * Mail : i@julying.com
 * created : 2012-00-10 18:30:26
 * last update : 2012-10-22 14:30:00
 * QQ ： 316970111 
 * Address : China shenzhen
 *
 * Copyright 2012 | julying.com
 * MIT、GPL2、GNU.
 * http://julying.com/code/license
 *
 */

/*
 * function rand ， 产生随机整数 。
 */
function rand(minDit, maxDit)
{
	return Math.floor(Math.random() * (maxDit - minDit + 1)) + minDit;
};

/*
 * function getViewSize ，获取屏幕可视范围的尺寸。
 */
function getViewSize()
{
	var de = document.documentElement;
	var db = document.body;
	var viewW = de.clientWidth == 0 ? db.clientWidth : de.clientWidth;
	var viewH = de.clientHeight == 0 ? db.clientHeight : de.clientHeight;
	return Array(viewW, viewH);
};
