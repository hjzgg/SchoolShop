/**
 * jQuery gridmenu (Julying) Plug-in v1.0
 *
 * Home : http://julying.com/lab/gridmenu/
 * Mail : i@julying.com
 * created : 2012-00-10 18:30:26
 * last update : 2012-10-22 14:30:00
 * QQ �� 316970111 
 * Address : China shenzhen
 *
 * Copyright 2012 | julying.com
 * MIT��GPL2��GNU.
 * http://julying.com/code/license
 *
 */

;
var ROOT_URL = '';

$(function () {
	var planetTravelConfig = {
		flyStarImage: [[ROOT_URL + '../images/star-fly-1.png', 23, 23]],
		flashStarImage: [
				[ROOT_URL + '../images/star-flash-1.png', 30, 27],
				[ROOT_URL + '../images/star-flash-2.png', 40, 40],
				[ROOT_URL + '../images/star-flash-2.png', 40, 40] ],
		flashStarDensity: 0.3,
		flyMakeStarTime: 5000,
		flyMakestarNum: 2
	};
	
	if ('\v' == 'v') { /*����� IE6,7,8*/
		planetTravelConfig.flyMakeStarTime = 8000;
		planetTravelConfig.flyMakestarNum = 1
	}
	
	$('body').planetTravel(planetTravelConfig);
	
	/*
	 * if(is_home){
	 * $('body').css({'overflow':'hidden'});
	 * }
	 */
	
	julying.gridMenu.menu = new Array({
		name: 'about-me',
		pos: rand(5, 10)
	}, {
		name: 'contact-me',
		pos: rand(15, 20)
	}, {
		name: 'blog',
		pos: rand(20, 25)
	}, {
		name: 'link',
		pos: rand(25, 30)
	});
	
	julying.gridMenu.init('#julyingGridMenu');
	
	$('strong[name=replace]').each(function () {
		$(this).html($(this).attr('val'));
	});
});