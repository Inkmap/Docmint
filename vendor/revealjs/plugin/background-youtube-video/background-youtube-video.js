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
    backgroundYoutubeVideoControlsToggleAudio.innerText = 'Audio on';
    backgroundYoutubeVideoControlsToggleAudio.id = 'background-youtube-video-controls-audio' + id;

    var backgroundYoutubeVideoControlsToggleState = document.createElement('div');
    backgroundYoutubeVideoControlsToggleState.className = 'background-youtube-video-controls-state';
    backgroundYoutubeVideoControlsToggleState.innerText = 'Playing';
    backgroundYoutubeVideoControlsToggleState.id = 'background-youtube-video-controls-state' + id;

    var backgroundYoutubeVideoControlsReload = document.createElement('div');
    backgroundYoutubeVideoControlsReload.className = 'background-youtube-video-controls-reload';
    backgroundYoutubeVideoControlsReload.innerText = 'Reload';

    var backgroundYoutubeVideoControlsFullscreen = document.createElement('div');
    backgroundYoutubeVideoControlsFullscreen.className = 'background-youtube-video-controls-fullscreen';
    backgroundYoutubeVideoControlsFullscreen.innerText = 'Fullscreen';

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
                backgroundYoutubeVideoControlsAudio.innerText = 'Audio on';
            } else {
                currentPlayer.mute();
                backgroundYoutubeVideoControlsAudio.innerText = 'Audio off';
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
                backgroundYoutubeVideoControlsState.innerText = 'Paused';
            } else {
                currentPlayer.playVideo();
                backgroundYoutubeVideoControlsState.innerText = 'Playing';
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

        var backgroundYoutubeVideo = document.createElement('div');
        backgroundYoutubeVideo.className = 'background-youtube-video';
        backgroundYoutubeVideo.id = 'background-youtube-video-' + backgroundYoutubeVideoId;

        document.querySelector('.backgrounds').appendChild(backgroundYoutubeVideo);

        backgroundYoutubeVideoPlayers[backgroundYoutubeVideoId] = new YT.Player(backgroundYoutubeVideo, {
            videoId: backgroundYoutubeVideoId,
            playerVars: { 'controls': 0 },
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