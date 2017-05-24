# YouTube iframes as background videos in reveal.js

This plugin for reveal.js allows you to add YouTube videos as backgrounds to slides. 
Playback and behaviour can be controlled via the 
[YouTube iframe API](https://developers.google.com/youtube/iframe_api_reference).

The player exposes video controls containing play/pause, audio on/off, reload and fullscreen, which
talk to the video via the API.

You need to add parameters in the section tag, like this:

~~~
<section data-background-youtube-video="videoID">
</section>
~~~

# Parameters

## data-background-youtube-video

data-background-youtube-video="videoID"

## data-background-youtube-video-showinfo
 
data-background-youtube-video-showinfo="1" 

values:
0 // (default) no info is shown
1 // title is shown of the video

## data-background-youtube-video-finished

data-background-youtube-video-finished="nextSlide"

values:
0 // (default) do nothing
"related" // related videos are shown when the video has finished
"nextSlide" // next slide will be shown  when the video has finished

# Changing colours for the player control

The default colours scheme is white on black. You can change the colours
via CSS.

~~~
.background-youtube-video-controls div { 
    background: #fff; 
    fill: red;
}
~~~

# Custom event 

When the video is finished a custom event ```videoFinished``` will be triggered.

For example to show the next slide once the video has finished you can use:
~~~
document.querySelector('html').addEventListener('videoFinished', function(e) {
    Reveal.next();
}, false);
~~~

# Use as an overlay

Add ```data-background-youtube-video-overlay="true"``` to the section where the overlay should appear along with the other data attributes for the iframe video.

## Parameters

data-background-youtube-video-overlay-delay="2000"

values:
0 // (default) show without delay
value in ms // show after x ms

# Adding as dependencies to the HTML document

The plugin, like any other reveal.js plugin, needs to be loaded as a dependency
when initialising reveal.js:
~~~
<script>
    Reveal.initialize({
        // Optional reveal.js plugins
        dependencies: [{
            src: 'vendor/revealjs/plugin/background-youtube-video/background-youtube-video.js'
        }]
    });
</script>
~~~
Note: there might be more plugins and other options set under `Reveal.initialize`. You need to add the 
youtube background iframe plugin to the existing dependencies, not replace the code entirely or add
this beneath.
