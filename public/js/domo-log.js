window.console.domo_log = function(msg) {
    var gifs = [
        'http://img4.wikia.nocookie.net/__cb20110730112743/uncyclopedia/images/9/95/Domo-kun_run.gif'
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