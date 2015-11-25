/**
 * jQuery gridmenu (Julying) Plug-in v1.0
 *
 * Home : http://julying.com/lab/gridmenu/
 * Mail : i@julying.com
 * created : 2012-00-10 18:30:26
 * last update : 2012-10-22 14:30:00
 * QQ £º 316970111 
 * Address : China shenzhen
 *
 * Copyright 2012 | julying.com
 * MIT¡¢GPL2¡¢GNU.
 * http://julying.com/code/license
 *
 */

var ROOT_URL;
var is_home;

$(function() {
	ROOT_URL = $('#ROOT_URL').val() || '';
	is_home = $('#is_home').val() || false;

	var planetTravelConfig = {
		flyStarImage: [ [ ROOT_URL + '_theme/images/star-fly-1.png', 23, 23 ] ],
		flashStarImage: [
				[ ROOT_URL + '_theme/images/star-flash-1.png', 30, 27 ],
				[ ROOT_URL + '_theme/images/star-flash-2.png', 40, 40 ],
				[ ROOT_URL + '_theme/images/star-flash-2.png', 40, 40 ] ],
		flashStarDensity: 0.3,
		flyMakeStarTime: 5000,
		flyMakestarNum: 2
	};
	if ($.browser.msie && $.browser.version < 9) {
		planetTravelConfig.flyMakeStarTime = 8000;
		planetTravelConfig.flyMakestarNum = 1
	}

	$('body').planetTravel(planetTravelConfig);
	$('strong[name=replace]').each(function() {
		$(this).html($(this).attr('val'));
	});
	$('input:text').addClass('beautyText text');
});
