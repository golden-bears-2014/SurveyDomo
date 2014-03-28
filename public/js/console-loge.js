window.console.loge = function(msg) {
    var gifs = [
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-wink-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-shake-space-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-peepers-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-prizza-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-hat-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-gradient-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-fat-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-rainbow-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-sunglasses-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-derp-212.gif',
        'http://d1e3ezyatlol8u.cloudfront.net/img/212/doge-shake-212.gif'
    ];
    var wow = ['', 'wow! ', 'amaze! ', 'dazzle! '];
    var adjs = 'so such many much very'.split(' ');
    var randomizr = function (a) {
        return a[Math.floor(Math.random() * a.length)];
    };
    var is_object = (typeof msg === 'object');
    var message = '%c ' + randomizr(wow) + randomizr(adjs) + ' ' + typeof msg + ': ';
    var css = "background-image: url(" + randomizr(gifs) + "); background-size: 80px 80px; background-repeat: no-repeat; font-family: 'Comic Sans MS', cursive, sans-serif; padding: 25px; line-height: 64px; color: white; font-weight: 800; width: 100%; display: block;";
    if (!is_object) {
        message += msg;
        console.log(message, css);
    } else {
        console.log(message, css);
        console.log(msg);
    }
};