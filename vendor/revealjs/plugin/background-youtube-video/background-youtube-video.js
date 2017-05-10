// background youtube video
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var backgroundYoutubeVideoPlayers = [];
var backgroundYoutubeVideos = document.querySelectorAll('[data-background-youtube-video]');

function onYouTubeIframeAPIReady() {
    [].forEach.call(backgroundYoutubeVideos, function(div, index) {

        var backgroundYoutubeVideoId = div.getAttribute('data-background-youtube-video');

        var backgroundYoutubeVideo = document.createElement('div');
        backgroundYoutubeVideo.className = 'background-youtube-video';
        backgroundYoutubeVideo.id = 'background-youtube-video-' + backgroundYoutubeVideoId;

        document.querySelector('.backgrounds').appendChild(backgroundYoutubeVideo);

        backgroundYoutubeVideoPlayers[backgroundYoutubeVideoId] = new YT.Player(backgroundYoutubeVideo, {
            videoId: backgroundYoutubeVideoId,
            playerVars: { 'controls': 0 },
            events: {
                'onReady': onPlayerReady
            }
        });
    });

    // video controls
    var backgroundYoutubeVideoControls = document.createElement('div');
    backgroundYoutubeVideoControls.className = 'background-youtube-video-controls';

    var backgroundYoutubeVideoControlsToggleAudio = document.createElement('div');
    backgroundYoutubeVideoControlsToggleAudio.className = 'background-youtube-video-controls-audio';
    backgroundYoutubeVideoControlsToggleAudio.innerText = 'Audio on';

    var backgroundYoutubeVideoControlsToggleState = document.createElement('div');
    backgroundYoutubeVideoControlsToggleState.className = 'background-youtube-video-controls-state';
    backgroundYoutubeVideoControlsToggleState.innerText = 'Playing';

    var backgroundYoutubeVideoControlsReload = document.createElement('div');
    backgroundYoutubeVideoControlsReload.className = 'background-youtube-video-controls-reload';
    backgroundYoutubeVideoControlsReload.innerText = 'Reload';

    backgroundYoutubeVideoControls.appendChild(backgroundYoutubeVideoControlsToggleAudio);
    backgroundYoutubeVideoControls.appendChild(backgroundYoutubeVideoControlsToggleState);
    backgroundYoutubeVideoControls.appendChild(backgroundYoutubeVideoControlsReload);

    document.querySelector('body').appendChild(backgroundYoutubeVideoControls)
}

function onPlayerReady() {
    startBackgroundYoutubeVideo(Reveal.getCurrentSlide());

    Reveal.addEventListener('slidechanged', function(event) {
        startBackgroundYoutubeVideo(event.currentSlide);
    });
}



var startBackgroundYoutubeVideo = function(currentSlide) {
    var backgroundYoutubeVideoId = currentSlide.getAttribute('data-background-youtube-video') || false;
    var backgroundYoutubeVideos = document.querySelectorAll('[data-background-youtube-video]');
    var backgroundYoutubeVideoWrapper = document.querySelectorAll('.background-youtube-video');


    [].forEach.call(backgroundYoutubeVideoWrapper, function(wrapper) {

        wrapper.style.display = 'none';
    });

    [].forEach.call(backgroundYoutubeVideos, function(div, index) {

        var videoId = div.getAttribute('data-background-youtube-video');

        backgroundYoutubeVideoPlayers[videoId].stopVideo();
    });

    if (backgroundYoutubeVideoId) {
        document.querySelector('#background-youtube-video-' + backgroundYoutubeVideoId).style.display = 'block';

        backgroundYoutubeVideoPlayers[backgroundYoutubeVideoId].playVideo();

    }
}