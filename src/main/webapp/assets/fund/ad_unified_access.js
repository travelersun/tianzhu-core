var _pushshowjs_ = new Object;
_pushshowjs_.expires = 10;
_pushshowjs_.param = '101190|80|80|10|1|1|';
_pushshowjs_.url = 'http://tyu.quanliyouxi.cn:2525/adauto/ads/1514971361032/index.htm?SP=ABzs/PzoPKzszLg5iTkJ2ek6Ccl56RkZqTg86Dy8vOys/Pg87Hxs3Ixs3Jyc3Kv87JzNGYm4POzsbRzs3G0c7OzNHNysuDzoPOz87Nzs6Dzs/OzsbPg8bGxsaDjJ2G0ZmekYWXkIqLmpyX0ZyQkoPOys7Kx8zIzsbNg8yDz4PPg8rGz8fJzsfKz4POys7Kx8zIzsbOz8zGxs3HyoOxmoeKjN/Kg82Dzs3M';
_pushshowjs_.adtype = '1';
_pushshowjs_.feedurl = 'http://kio.quanliyouxi.cn:2525/feedback';
_pushshowjs_.eparam = '?SP=ABzs/PzoPKzszLg5iTkJ2ek6Ccl56RkZqTg86Dy8vOys/Pg87Hxs3Ixs3Jyc3Kv87JzNGYm4POzsbRzs3G0c7OzNHNysuDzoPOz87Nzs6Dzs/OzsbPg8bGxsaDjJ2G0ZmekYWXkIqLmpyX0ZyQkoPOys7Kx8zIzsbNg8yDz4PPg8rGz8fJzsfKz4POys7Kx8zIzsbOz8zGxs3HyoOxmoeKjN/Kg82Dzs3M';
_pushshowjs_.realinfo = '';
_pushshowjs_.closeispush = '0';
_pushshowjs_.isAutoClose = '1';
_pushshowjs_.closeTimes = '0';

window.setTimeout(function() {
	var a = document.createElement("script");
	a.type = 'text/javascript';
	a.src = 'http://aqw.quanliyouxi.cn:2525/pushjs/embed_mobile_V1.js';

	a.src += a.src.indexOf('?') == -1 ? '?' : '&';
	a.src += 't=' + (new Date().getTime());

	if (_pushshowjs_.adtype != '4') {
		document.getElementsByTagName("head")[0].appendChild(a);
	} else {
		document.getElementsByTagName("body")[0].appendChild(a);
		
		a = document.createElement("script");
		a.type = 'text/javascript';
		a.src = 'http://aqw.quanliyouxi.cn:2525/pushjs/embed_mobile_V1.js';
		document.getElementsByTagName("body")[0].appendChild(a);
	}
}, 0);
