<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">

    <title>Connect the dots</title>

    <meta name="description" content="A slideout menu for reveal.sj, a framework for easily creating beautiful presentations using HTML">
    <meta name="author" content="Micz Flor" >

    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">

    <link rel="stylesheet" href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/revealjs/css/reveal.css">
    <link rel="stylesheet" href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/revealjs/css/theme/{$project.meta.revealtheme}.css" id="theme">

    <!-- Code syntax highlighting -->
    <link rel="stylesheet" href="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/revealjs/lib/css/zenburn.css">
{literal}
    <!-- Printing and PDF exports -->
    <script>
        var link = document.createElement('link');
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = window.location.search.match(/print-pdf/gi) ? '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/print/pdf.css' : '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/print/paper.css';
        document.getElementsByTagName('head')[0].appendChild(link);
    </script>
{/literal}
    <!--[if lt IE 9]>
		<script src="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/revealjs/lib/js/html5shiv.js"></script>
		<![endif]-->

    <style>
        .reveal .slide-number {
            font-size: 0.6em;
        }
    </style>
    <style type="text/css">
        /* styles for background youtube video */
        
        .reveal .background-youtube-video {
            background-color: red;
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            max-height: 100%;
            max-width: 100%;
            display: none;
        }
        
        .background-youtube-video-controls {
            position: absolute;
            z-index: 1000;
            top: 0;
            left: 0;
            right: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            display: none;
        }
        
        .background-youtube-video-controls div {
            background: #000;
            color: #fff;
            padding: 10px;
            display: inline-block;
            cursor: pointer;
            font-family: Arial, Helvetica, sans-serif;
            fill: #fff;
        }
    </style>
</head>

<body>

    <div class="reveal">

        <!-- Any section element inside of this container is displayed as a slide -->
        <div class="slides">
{foreach item=slide from=$project.content}
            <section {foreach key=key item=item from=$slide.attributes}{$key}="{$item}" {/foreach}>
                {if isset($slide.children)}{foreach item=child from=$slide.children}<!-- child --><section {foreach key=key item=item from=$child.attributes}{$key}="{$item}" {/foreach}>
                    {$child.content}
                </section><!-- / child -->
                {/foreach}
                {else}{$slide.content}{/if}
            </section>
{/foreach}
        </div>

    </div>
    <script src="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/revealjs/lib/js/head.min.js"></script>
    <script src="{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}vendor/revealjs/js/reveal.js"></script>
    <script>
    </script>

{literal}
    <script>
        // Full list of configuration options available at:
        // https://github.com/hakimel/reveal.js#configuration
        Reveal.initialize({
            controls: true,
            progress: true,
            history: true,
            center: true,
            slideNumber: false,

            transition: 'slide', // none/fade/slide/convex/concave/zoom
            /*backgroundTransition: 'slide',*/

            menu: {
                markers: true,
                openSlideNumber: false,
                transition: 'slide', // none/fade/slide/convex/concave/zoom
                themes: [{
                    name: 'Black',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/black.css'
                }, {
                    name: 'White',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/white.css'
                }, {
                    name: 'League',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/league.css'
                }, {
                    name: 'Sky',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/sky.css'
                }, {
                    name: 'Beige',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/beige.css'
                }, {
                    name: 'Simple',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/simple.css'
                }, {
                    name: 'Serif',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/serif.css'
                }, {
                    name: 'Blood',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/blood.css'
                }, {
                    name: 'Night',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/night.css'
                }, {
                    name: 'Moon',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/moon.css'
                }, {
                    name: 'Solarized',
                    theme: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/css/theme/solarized.css'
                }],
                custom: [{
                    title: 'Custom',
                    icon: '<i class="fa fa-bookmark">',
                    src: 'links.html'
                }, ]
            },

            // Optional reveal.js plugins
            dependencies: [{
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/lib/js/classList.js',
                condition: function() {
                    return !document.body.classList;
                }
            }, {
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/plugin/markdown/marked.js',
                condition: function() {
                    return !!document.querySelector('[data-markdown]');
                }
            }, {
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/plugin/markdown/markdown.js',
                condition: function() {
                    return !!document.querySelector('[data-markdown]');
                }
            }, {
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/plugin/highlight/highlight.js',
                async: true,
                callback: function() {
                    hljs.initHighlightingOnLoad();
                }
            }, {
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/plugin/background-youtube-video/background-youtube-video.js'
            }, {
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/plugin/zoom-js/zoom.js',
                async: true
            }, {
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/plugin/notes/notes.js',
                async: true
            }, {
                src: '{/literal}{if isset($page.relPathPrefix)}{$page.relPathPrefix}{/if}{literal}vendor/revealjs/plugin/menu/menu.js',
                async: true
            }]
        });
    </script>
{/literal}

</body>

</html>