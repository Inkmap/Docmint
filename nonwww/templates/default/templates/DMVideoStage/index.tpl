<!DOCTYPE html>
<html>
<html lang="{$page.meta.language}">
    <meta charset="UTF-8">
    <title>{$page.meta.titleTag}</title>
<!--
{$page|print_r}
-->
{include 'tpl/html_head_meta_social.tpl'}

    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/DMVideoStage/css/DMVideoStageModal.css">
    <link rel="stylesheet" href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/DMVideoStage/css/DMVideoStageGeneric.css">

    <script>{literal}
        // Find the right method, call on correct element
        function launchFullscreen(element) {
          if(element.requestFullscreen) {
            element.requestFullscreen();
          } else if(element.mozRequestFullScreen) {
            element.mozRequestFullScreen();
          } else if(element.webkitRequestFullscreen) {
            element.webkitRequestFullscreen();
          } else if(element.msRequestFullscreen) {
            element.msRequestFullscreen();
          }
        }
        
        function exitFullscreen() {
          if(document.exitFullscreen) {
            document.exitFullscreen();
          } else if(document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
          } else if(document.webkitExitFullscreen) {
            document.webkitExitFullscreen();
          }
        }
    {/literal}</script>
</head>
<body>
{foreach item=element from=$page.elements}
{if isset($element.attributes.youTubeId)}
    <div id="ID{$element.attributes.youTubeId|replace:"-":"_"}" class="modalCenterCenter16To9 toggleHide">
        <i class="material-icons modalClose" style="margin: 2px; border: 0px solid #aaa; background: #000; position: relative; right: 0; cursor: pointer;">close</i>
        <div class="bg01">
            <div class="video-container">
                <div id="videoYT-{$element.attributes.youTubeId|replace:"-":"_"}"></div>
                <!--iframe src="//www.youtube.com/embed/{$element.attributes.youTubeId|replace:"-":"_"}" frameborder="0" allowfullscreen></iframe-->
            </div>
        </div>
    </div>
{/if}    
{/foreach}

    <div class="video-background">
        <div class="video-foreground">
            <div id="videoYT-main-{$page.meta.youTubeId|replace:"-":"_"}"></div>
        </div>
    </div>


<table id="controls">
    <tr>
        <td style="width: 60px; text-align: right;" >
            <!-- Play / Pause -->
            <i id="play-toggle" class="material-icons">pause</i>

            <!--Mute / Unmute-->
            <i id="mute-toggle" class="material-icons">volume_up</i>
        </td>
        <td>
            <!-- Progress Bar -->
            <input type="range" id="progress-bar" value="0" style="padding: 0 20px; width: 98%">
        </td>
        <td style="width: 100px">
            <!-- Duration -->
            <span id="current-time">0:00</span> / <span id="duration">0:00</span>   
        </td>
        <td style="width: 40px">
            <!-- Toggle Fullscreen -->
            <i id="fullscreen-toggle" class="material-icons">fullscreen</i>
        </td>
    </tr>
</table>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://www.youtube.com/iframe_api"></script>
<!--script src="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/DMVideoStage/js/youTubeControls.js"></script-->
<script type="text/javascript" >
{*/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal*}

{foreach item=element from=$page.elements}
{if $element@first}
// read JSON for things to do
var eventsTimeline{$page.meta.youTubeId|replace:"-":"_"} = [
{/if}
{foreach key=key item=value from=$element.variables}
{if $value@first}{literal}
{
{/literal}
{/if}
    "{$key}": "{$value}",
{/foreach}
    "toggleId": "ID{$element.attributes.youTubeId|replace:"-":"_"}"
{if $element@last}
{literal}}
];{/literal}
{else}
{literal}},{/literal}
{/if}
{/foreach}

{literal}

var player{/literal}{$youTubeId|replace:"-":"_"}{literal},
    time_update_interval = 0;

function onYouTubeIframeAPIReady() {
    player{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal} = new YT.Player('videoYT-main-{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}', {
        videoId: '{/literal}{$page.meta.youTubeId}{literal}',
        playerVars: {
            'color': 'white',
            'autoplay': 1,
            'start': 0,
            'controls': 0,
            'rel': 0,
            'showinfo': 0
        },
        events: {
            onReady: initialize,
            onStateChange: onPlayerStateChange
        }
    });
{/literal}
{foreach item=element from=$page.elements}
{if isset($element.attributes.youTubeId)}
{literal}
    player{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal} = new YT.Player('videoYT-{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal}', {
        videoId: '{/literal}{$element.attributes.youTubeId}{literal}',
        playerVars: {
            'autoplay': 0,
            'start': 0,
            'rel': 0,
            'showinfo': 0,
            'modestbranding': 1
        },
        events: {
            onStateChange: onPlayerStateChange
        }
    });
{/literal}    
{/if}    
{/foreach}
{literal}
}

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING) {
        console.log('pause attempt by:' + event.target.a.id);
        pauseVideo(event.target.a.id);
    }
}
function pauseVideo(player_id) {
    console.log('pause triggered by:' + player_id);
    // if the change does not come from the main video: pause main video
    if (player_id != "videoYT-main-{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}") {
        player{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}.pauseVideo();
        console.log('pause:' + '{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}');
        $('#play-toggle').text('play_arrow');
    } else {
    // if the change comes from the main video: pause ALL other videos
{/literal}
{foreach item=element from=$page.elements}
{if isset($element.attributes.youTubeId)}
{literal}        player{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal}.pauseVideo();
        console.log('pause:' + '{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal}');{/literal}    
{/if}    
{/foreach}
{literal}
    }
}
function stopVideo(player_id) {
    console.log('stop triggered by:' + player_id);
    // if the change does not come from the main video: stop main video
    if (player_id != "videoYT-main-{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}") {
        player{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}.stopVideo();
        console.log('stop:' + '{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}');
        $('#play-toggle').text('play_arrow');
    } else {
    // if the change comes from the main video: stop ALL other videos
{/literal}
{foreach item=element from=$page.elements}
{if isset($element.attributes.youTubeId)}
{literal}        player{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal}.stopVideo();
        console.log('stop:' + '{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal}');{/literal}    
{/if}    
{/foreach}
{literal}
    }
}
{/literal}

{include 'DMVideoStage/tpl/DMVideoStagePlayerJs.tpl' youTubeId=$page.meta.youTubeId|replace:"-":"_"}

{foreach item=element from=$page.elements}
{literal}
$( "#ID{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal} .modalClose" ).click(function() {
    $( "#ID{/literal}{$element.attributes.youTubeId|replace:"-":"_"}{literal}" ).fadeToggle( "fast");
    console.log('modal close stop attempt by:' + '{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}');
    stopVideo('videoYT-main-{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}');
    player{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}.playVideo();
    $('#play-toggle').text('pause');
});
{/literal}
{/foreach}
{literal}
// Helper Functions
function formatTime(time) {
    time = Math.round(time);

    var minutes = Math.floor(time / 60),
        seconds = time - minutes * 60;

    seconds = seconds < 10 ? '0' + seconds : seconds;

    return minutes + ":" + seconds;
}
{/literal}
</script>
</body>
</html>