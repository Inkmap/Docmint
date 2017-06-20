<?php

/**
 * @package    WebDocCanvas
 * @link       https://github.com/Inkmap/WebDocCanvas
 * @author     Micz Flor https://github.com/MiczFlor
 * @copyright  2017 the authors
 * @version    20170512
 * @license    http://www.opensource.org/licenses/mit-license.html  MIT License
 */
 
/*
* Information for the session.
* Here and now it is a one project config, so these are hard wired
*/

$tempsession = array(
    // The user hierarchy is: organisation (org) > department (dpt) > team > user
    "org"       => "org",
    "dpt"       => "dpt",
    "team"      => "team",
    "user"      => "user",
    // projects are parallel to the user hierarchy
    //"project"   => "project",
);