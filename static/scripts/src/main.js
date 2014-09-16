var getQuerystring, initCarousel, initEditorialLabel;

getQuerystring = function(key) {
  var regex, result, temp;
  regex = new RegExp('(?:\\?|&)' + key + '=(.*?)(?=&|$)', 'gi');
  result = [];
  while ((temp = regex.exec(document.location.search)) !== null) {
    result.push(temp[1]);
  }
  return result;
};

initCarousel = function() {
  $('.tabs-carousel').owlCarousel({
    navigation: false,
    singleItem: true,
    pagination: false
  });
  return $('.banner-carousel').owlCarousel({
    navigation: false,
    singleItem: true
  });
};

initEditorialLabel = function() {
  if (getQuerystring('editorial')) {
    return $('.posts-header .posts-header-title').show();
  }
};

$(document).foundation();

$(document).ready(function() {
  initCarousel();
  $('.search input[type=text]').val(getQuerystring('keywords'));
  if (getQuerystring('editorial').length > 0 && getQuerystring('editorial')[0] !== "") {
    initEditorialLabel();
    return $('.search select').val(getQuerystring('editorial'));
  }
});

$('.dropdown .dropdown').hover(function() {
  return $(this).closest('.has-dropdown').find('a').eq(0).toggleClass("active");
});


$('.carousel__video').owlCarousel({
    items:1,
    merge:true,
    loop:true,
    margin:10,
    video:true,
    lazyLoad:true,
    center:true,
    videoWidth: 700,
    videoHeight: 394,
    autoplay: true,
    responsive:{
        480:{
            items:2
        },
        600:{
            items:4
        }
    }
})