
{literal}

function initialize() {

    // Update the controls on load
    updateTimerDisplay();
    updateProgressBar();
    checkForEvents();
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.unMute();

    // Clear any old interval.
    clearInterval(time_update_interval);

    // Start interval to update elapsed time display and
    // the elapsed part of the progress bar every second.
    time_update_interval = setInterval(function() {
        updateTimerDisplay();
        updateProgressBar();
        checkForEvents();
    }, 1000);

    $('#volume-input').val(Math.round(player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getVolume()));
}

// This function is called by initialize()
function checkForEvents() {
    for (var i = 0; i < eventsTimeline{/literal}{$youTubeId|replace:"-":"_"}{literal}.length; i++) {
        var obj = eventsTimeline{/literal}{$youTubeId|replace:"-":"_"}{literal}[i];
        // if stop is not defined, set it to five seconds after start
        if (typeof obj.stop === "undefined") {
            obj.stop = parseInt(obj.start) + 5;
        }
        if (player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getCurrentTime() > obj.start && player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getCurrentTime() < obj.stop) {
            if ($('#' + obj.toggleId).hasClass(obj.toggleTrigger)) {
                //console.log(obj.toggleId);
                $('#' + obj.toggleId).toggleClass(obj.toggleStart + ' ' + obj.toggleStop);
            }
        }
        if (player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getCurrentTime() > obj.stop) {
            if ($('#' + obj.toggleId).hasClass(obj.toggleStart)) {
                //console.log(obj.toggleId);
                $('#' + obj.toggleId).toggleClass(obj.toggleStart + ' ' + obj.toggleStop);
            }
        }
    }
}

// This function is called by initialize()
function updateTimerDisplay() {
    // Update current time text display.
    $('#current-time').text(formatTime(player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getCurrentTime()));
    $('#duration').text(formatTime(player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getDuration()));
}


// This function is called by initialize()
function updateProgressBar() {
    // Update the value of our progress bar accordingly.
    $('#progress-bar').val((player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getCurrentTime() / player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getDuration()) * 100);
}


// Progress bar

$('#progress-bar').on('mouseup touchend', function(e) {

    // Calculate the new time for the video.
    // new time in seconds = total duration in seconds * ( value of range input / 100 )
    var newTime = player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getDuration() * (e.target.value / 100);

    // Skip video to new time.
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.seekTo(newTime);

});


// Playback

$('#play').on('click', function() {
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.playVideo();
});


$('#pause').on('click', function() {
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.pauseVideo();
});


$('#play-toggle').on('click', function() {
    var play_toggle = $(this);

    if (player{/literal}{$youTubeId|replace:"-":"_"}{literal}.getPlayerState() == 1) {
        player{/literal}{$youTubeId|replace:"-":"_"}{literal}.pauseVideo();
        play_toggle.text('play_arrow');
    } else {
        player{/literal}{$youTubeId|replace:"-":"_"}{literal}.playVideo();
        play_toggle.text('pause');
    }
});

// Fullscreen toggle

$('#fullscreen-toggle').on('click', function() {
    var fullscreen_toggle = $(this);
    // check if browser is in fullscreen mode
    if (window.innerHeight == screen.height) {
        exitFullscreen();
        fullscreen_toggle.text('fullscreen');
    } else {
        launchFullscreen(document.documentElement);
        fullscreen_toggle.text('fullscreen_exit');
    }
});

// Sound volume


$('#mute-toggle').on('click', function() {
    var mute_toggle = $(this);

    if (player{/literal}{$youTubeId|replace:"-":"_"}{literal}.isMuted()) {
        player{/literal}{$youTubeId|replace:"-":"_"}{literal}.unMute();
        mute_toggle.text('volume_up');
    } else {
        player{/literal}{$youTubeId|replace:"-":"_"}{literal}.mute();
        mute_toggle.text('volume_off');
    }
});

$('#volume-input').on('change', function() {
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.setVolume($(this).val());
});


// Other options


$('#speed').on('change', function() {
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.setPlaybackRate($(this).val());
});

$('#quality').on('change', function() {
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.setPlaybackQuality($(this).val());
});


// Playlist

$('#next').on('click', function() {
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.nextVideo()
});

$('#prev').on('click', function() {
    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.previousVideo()
});


// Load video

$('.thumbnail').on('click', function() {

    var url = $(this).attr('data-video-id');

    player{/literal}{$youTubeId|replace:"-":"_"}{literal}.cueVideoById(url);

});
{/literal}