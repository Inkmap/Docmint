<!DOCTYPE html>
<html {if isset($page.meta.language)} lang="{$page.meta.language}"{/if}>
    <meta charset="UTF-8">
    <title>{$page.meta.titleTag}</title>
<!--
{*$page|print_r*}
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
{assign var=counter value=0}
{foreach item=e from=$page.elements}
{assign var=counter value=$counter+1}
{if isset($e.meta.youTubeId)}
    <div id="ID-YT-{$counter}-{$e.meta.youTubeId|replace:"-":"_"}" class="modalCenterCenter16To9 toggleHide">
        <i class="material-icons modalClose" style="margin: 2px; border: 0px solid #aaa; background: #000; position: relative; right: 0; cursor: pointer;">close</i>
        <div class="bg01">
            <div class="video-container">
                <div id="videoYT-{$counter}-{$e.meta.youTubeId|replace:"-":"_"}"></div>
            </div>
        </div>
    </div>
{elseif isset($e.meta.bgImgUrl)}
    <div id="ID-bgImg-{$counter}" 
        {if isset($e.meta.urlNewTime)}
            onclick="player_main_{$page.meta.youTubeId|replace:"-":"_"}.seekTo({$e.meta.urlNewTime});player_main_{$page.meta.youTubeId|replace:"-":"_"}.playVideo();"
        {elseif isset($e.meta.url)}
            onclick="window.open('{$e.meta.url}', '_blank');"
        {/if}
        class="{if isset($e.meta.modalType)}{$e.meta.modalType}{else}modalFullTopCenter{/if} toggleHide" style="cursor: pointer; {include 'tpl/snippet_styleSection.tpl' youTubeId=$page.meta.youTubeId|replace:"-":"_"}">
            {if isset($e.content)}{$e.content}{/if}
    </div>
{elseif isset($e.meta.imgUrl)}
    <div id="ID-img-{$counter}" 
        {if isset($e.meta.urlNewTime)}
            onclick="player_main_{$page.meta.youTubeId|replace:"-":"_"}.seekTo({$e.meta.urlNewTime});player_main_{$page.meta.youTubeId|replace:"-":"_"}.playVideo();"
        {elseif isset($e.meta.url)}
            onclick="window.open('{$e.meta.url}', '_blank');"
        {/if}
        class="{if isset($e.meta.modalType)}{$e.meta.modalType}{else}modalFullTopCenter{/if} toggleHide" style="cursor: pointer; {include 'tpl/snippet_styleSection.tpl' youTubeId=$page.meta.youTubeId|replace:"-":"_"}">
            <img src="{$e.meta.imgUrl}" style="max-width: 100%; max-height: 100%;"/>
            {if isset($e.content)}{$e.content}{/if}
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

{assign var=counter value=0}
{foreach item=e from=$page.elements}
{assign var=counter value=$counter+1}
{if $e@first}
// read JSON for things to do
var eventsTimeline{$page.meta.youTubeId|replace:"-":"_"} = [
{/if}
{foreach key=key item=value from=$e.variables}
{if $value@first}{literal}
{
{/literal}
{/if}
    "{$key}": "{$value}",
{/foreach}
{if isset($e.meta.youTubeId)}
    "toggleId": "ID-YT-{$counter}-{$e.meta.youTubeId|replace:"-":"_"}"
{/if}
{if isset($e.meta.bgImgUrl)}
    "toggleId": "ID-bgImg-{$counter}"
{/if}
{if isset($e.meta.imgUrl)}
    "toggleId": "ID-img-{$counter}"
{/if}
{if $e@last}
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
    player{/literal}_main_{$page.meta.youTubeId|replace:"-":"_"}{literal} = new YT.Player('videoYT-main-{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}', {
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
{assign var=counter value=0}
{foreach item=e from=$page.elements}
{assign var=counter value=$counter+1}
{if isset($e.meta.youTubeId)}
{literal}
    player{/literal}_{$counter}_{$e.meta.youTubeId|replace:"-":"_"}{literal} = new YT.Player('videoYT-{/literal}{$counter}-{$e.meta.youTubeId|replace:"-":"_"}{literal}', {
        videoId: '{/literal}{$e.meta.youTubeId}{literal}',
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
        player{/literal}_main_{$page.meta.youTubeId|replace:"-":"_"}{literal}.pauseVideo();
        console.log('pause:' + '{/literal}main-{$page.meta.youTubeId|replace:"-":"_"}{literal}');
        $('#play-toggle').text('play_arrow');
    } else {
    // if the change comes from the main video: pause ALL other videos
{/literal}
{assign var=counter value=0}
{foreach item=e from=$page.elements}
{assign var=counter value=$counter+1}
{if isset($e.meta.youTubeId)}
{literal}        player{/literal}_{$counter}_{$e.meta.youTubeId|replace:"-":"_"}{literal}.pauseVideo();
        console.log('pause:' + '{/literal}{$counter}-{$e.meta.youTubeId|replace:"-":"_"}{literal}');{/literal}    
{/if}    
{/foreach}
{literal}
    }
}
function stopVideo(player_id) {
    console.log('stop triggered by:' + player_id);
    // if the change does not come from the main video: stop main video
    if (player_id != "videoYT-main-{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}") {
        player{/literal}_main_{$page.meta.youTubeId|replace:"-":"_"}{literal}.stopVideo();
        console.log('stop:' + '{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}');
        $('#play-toggle').text('play_arrow');
    } else {
    // if the change comes from the main video: stop ALL other videos
{/literal}
{assign var=counter value=0}
{foreach item=e from=$page.elements}
{assign var=counter value=$counter+1}
{if isset($e.meta.youTubeId)}
{literal}        player{/literal}_{$counter}_{$e.meta.youTubeId|replace:"-":"_"}{literal}.stopVideo();
        console.log('stop:' + '{/literal}{$e.meta.youTubeId|replace:"-":"_"}{literal}');{/literal}    
{/if}    
{/foreach}
{literal}
    }
}
{/literal}

{include 'DMVideoStage/tpl/DMVideoStagePlayerJs.tpl' youTubeId=$page.meta.youTubeId|replace:"-":"_"}

{assign var=counter value=0}
{foreach item=e from=$page.elements}
{assign var=counter value=$counter+1}
{if isset($e.meta.youTubeId)}
{literal}
$( "#ID-YT-{/literal}{$counter}-{$e.meta.youTubeId|replace:"-":"_"}{literal} .modalClose" ).click(function() {
    $( "#ID-YT-{/literal}{$counter}-{$e.meta.youTubeId|replace:"-":"_"}{literal}" ).fadeToggle( "fast");
    console.log('modal close stop attempt by:' + '{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}');
    stopVideo('videoYT-main-{/literal}{$page.meta.youTubeId|replace:"-":"_"}{literal}');
    player{/literal}_{$counter}_{$page.meta.youTubeId|replace:"-":"_"}{literal}.playVideo();
    $('#play-toggle').text('pause');
});
{/literal}
{/if}
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