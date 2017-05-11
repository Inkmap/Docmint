// background youtube video
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var backgroundYoutubeVideoPlayers = [];
var backgroundYoutubeVideos = document.querySelectorAll('[data-background-youtube-video]');
var isPlaying = false;

function createYoutubeIframeControls(id) {
    var backgroundYoutubeVideoControls = document.createElement('div');
    backgroundYoutubeVideoControls.className = 'background-youtube-video-controls';
    backgroundYoutubeVideoControls.id = 'background-youtube-video-controls-' + id;

    var backgroundYoutubeVideoControlsToggleAudio = document.createElement('div');
    backgroundYoutubeVideoControlsToggleAudio.className = 'background-youtube-video-controls-audio';
    backgroundYoutubeVideoControlsToggleAudio.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path d="M14,3.23V5.29C16.89,6.15 19,8.83 19,12C19,15.17 16.89,17.84 14,18.7V20.77C18,19.86 21,16.28 21,12C21,7.72 18,4.14 14,3.23M16.5,12C16.5,10.23 15.5,8.71 14,7.97V16C15.5,15.29 16.5,13.76 16.5,12M3,9V15H7L12,20V4L7,9H3Z"/></svg>';
    backgroundYoutubeVideoControlsToggleAudio.id = 'background-youtube-video-controls-audio' + id;

    var backgroundYoutubeVideoControlsToggleState = document.createElement('div');
    backgroundYoutubeVideoControlsToggleState.className = 'background-youtube-video-controls-state';
    backgroundYoutubeVideoControlsToggleState.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path d="M8,5.14V19.14L19,12.14L8,5.14Z" /></svg>';
    backgroundYoutubeVideoControlsToggleState.id = 'background-youtube-video-controls-state' + id;

    var backgroundYoutubeVideoControlsReload = document.createElement('div');
    backgroundYoutubeVideoControlsReload.className = 'background-youtube-video-controls-reload';
    backgroundYoutubeVideoControlsReload.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path d="M19,12H22.32L17.37,16.95L12.42,12H16.97C17,10.46 16.42,8.93 15.24,7.75C12.9,5.41 9.1,5.41 6.76,7.75C4.42,10.09 4.42,13.9 6.76,16.24C8.6,18.08 11.36,18.47 13.58,17.41L15.05,18.88C12,20.69 8,20.29 5.34,17.65C2.22,14.53 2.23,9.47 5.35,6.35C8.5,3.22 13.53,3.21 16.66,6.34C18.22,7.9 19,9.95 19,12Z" /></svg>';

    var backgroundYoutubeVideoControlsFullscreen = document.createElement('div');
    backgroundYoutubeVideoControlsFullscreen.className = 'background-youtube-video-controls-fullscreen';
    backgroundYoutubeVideoControlsFullscreen.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path d="M5,5H10V7H7V10H5V5M14,5H19V10H17V7H14V5M17,14H19V19H14V17H17V14M10,17V19H5V14H7V17H10Z" /></svg>';

    backgroundYoutubeVideoControls.appendChild(backgroundYoutubeVideoControlsToggleAudio);
    backgroundYoutubeVideoControls.appendChild(backgroundYoutubeVideoControlsToggleState);
    backgroundYoutubeVideoControls.appendChild(backgroundYoutubeVideoControlsReload);
    backgroundYoutubeVideoControls.appendChild(backgroundYoutubeVideoControlsFullscreen);

    document.querySelector('body').appendChild(backgroundYoutubeVideoControls);
}

function handleYoutubeIframeAudio(id) {
    var currentPlayer = backgroundYoutubeVideoPlayers[id];
    var backgroundYoutubeVideoControls = document.querySelectorAll('.background-youtube-video-controls-audio');
    var backgroundYoutubeVideoControlsAudio = document.querySelector('#background-youtube-video-controls-audio' + id);

    [].forEach.call(backgroundYoutubeVideoControls, function(control, index) {
        control.addEventListener('click', function() {
            if (currentPlayer.isMuted()) {
                currentPlayer.unMute();
                backgroundYoutubeVideoControlsAudio.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path d="M14,3.23V5.29C16.89,6.15 19,8.83 19,12C19,15.17 16.89,17.84 14,18.7V20.77C18,19.86 21,16.28 21,12C21,7.72 18,4.14 14,3.23M16.5,12C16.5,10.23 15.5,8.71 14,7.97V16C15.5,15.29 16.5,13.76 16.5,12M3,9V15H7L12,20V4L7,9H3Z"/></svg>';
            } else {
                currentPlayer.mute();
                backgroundYoutubeVideoControlsAudio.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"> <path d="M12,4L9.91,6.09L12,8.18M4.27,3L3,4.27L7.73,9H3V15H7L12,20V13.27L16.25,17.53C15.58,18.04 14.83,18.46 14,18.7V20.77C15.38,20.45 16.63,19.82 17.68,18.96L19.73,21L21,19.73L12,10.73M19,12C19,12.94 18.8,13.82 18.46,14.64L19.97,16.15C20.62,14.91 21,13.5 21,12C21,7.72 18,4.14 14,3.23V5.29C16.89,6.15 19,8.83 19,12M16.5,12C16.5,10.23 15.5,8.71 14,7.97V10.18L16.45,12.63C16.5,12.43 16.5,12.21 16.5,12Z"/></svg>';
            }
        });
    });
}

function handleYoutubeIframeState(id) {
    var currentPlayer = backgroundYoutubeVideoPlayers[id];
    var backgroundYoutubeVideoControls = document.querySelectorAll('.background-youtube-video-controls-state');
    var backgroundYoutubeVideoControlsState = document.querySelector('#background-youtube-video-controls-state' + id);

    [].forEach.call(backgroundYoutubeVideoControls, function(control, index) {
        control.addEventListener('click', function() {
            if (isPlaying) {
                currentPlayer.pauseVideo();
                backgroundYoutubeVideoControlsState.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path d="M14,19H18V5H14M6,19H10V5H6V19Z" /></svg>';
            } else {
                currentPlayer.playVideo();
                backgroundYoutubeVideoControlsState.innerHTML = '<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path d="M8,5.14V19.14L19,12.14L8,5.14Z" /></svg>';
            }
        });
    });
}

function handleYoutubeIframeReload(id) {
    var currentPlayer = backgroundYoutubeVideoPlayers[id];
    var backgroundYoutubeVideoControls = document.querySelectorAll('.background-youtube-video-controls-reload');

    [].forEach.call(backgroundYoutubeVideoControls, function(control, index) {
        control.addEventListener('click', function() {
            currentPlayer.stopVideo();
            currentPlayer.seekTo(0)
            currentPlayer.playVideo();
        });
    });
}

function handleYoutubeIframeFullscreen(id) {

    var iframe = document.querySelector('#background-youtube-video-' + id);
    var requestFullScreen = iframe.requestFullScreen || iframe.mozRequestFullScreen || iframe.webkitRequestFullScreen;
    var backgroundYoutubeVideoControls = document.querySelectorAll('.background-youtube-video-controls-fullscreen');

    [].forEach.call(backgroundYoutubeVideoControls, function(control, index) {
        control.addEventListener('click', function() {
            if (requestFullScreen) {
                requestFullScreen.bind(iframe)();
            }
        });
    });


}

function onYouTubeIframeAPIReady() {
    [].forEach.call(backgroundYoutubeVideos, function(div, index) {

        var backgroundYoutubeVideoId = div.getAttribute('data-background-youtube-video');
        var backgroundYoutubeVideoShowinfo = div.getAttribute('data-background-youtube-video-showinfo') || 0;
        var backgroundYoutubeVideoRel = div.getAttribute('data-background-youtube-video-rel') || 0;

        var backgroundYoutubeVideo = document.createElement('div');
        backgroundYoutubeVideo.className = 'background-youtube-video';
        backgroundYoutubeVideo.id = 'background-youtube-video-' + backgroundYoutubeVideoId;

        document.querySelector('.backgrounds').appendChild(backgroundYoutubeVideo);

        backgroundYoutubeVideoPlayers[backgroundYoutubeVideoId] = new YT.Player(backgroundYoutubeVideo, {
            videoId: backgroundYoutubeVideoId,
            playerVars: {
                'controls': 0,
                'playsinline': 1,
                'showinfo': backgroundYoutubeVideoShowinfo,
                'rel': backgroundYoutubeVideoRel
            },
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });

        // create video controls
        createYoutubeIframeControls(backgroundYoutubeVideoId);
    });


}

function onPlayerReady() {
    startBackgroundYoutubeVideo(Reveal.getCurrentSlide());

    Reveal.addEventListener('slidechanged', function(event) {
        startBackgroundYoutubeVideo(event.currentSlide);
    });
}

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING) {
        isPlaying = true;
    } else {
        isPlaying = false;
    }
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

        document.querySelector('#background-youtube-video-controls-' + videoId).style.display = 'none';

        backgroundYoutubeVideoPlayers[videoId].stopVideo();
    });

    if (backgroundYoutubeVideoId) {
        document.querySelector('#background-youtube-video-' + backgroundYoutubeVideoId).style.display = 'block';
        document.querySelector('#background-youtube-video-controls-' + backgroundYoutubeVideoId).style.display = 'flex';

        backgroundYoutubeVideoPlayers[backgroundYoutubeVideoId].playVideo();

        handleYoutubeIframeAudio(backgroundYoutubeVideoId)
        handleYoutubeIframeState(backgroundYoutubeVideoId)
        handleYoutubeIframeReload(backgroundYoutubeVideoId);
        handleYoutubeIframeFullscreen(backgroundYoutubeVideoId);

    }
}