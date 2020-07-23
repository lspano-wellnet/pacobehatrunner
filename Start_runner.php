<?php
require 'vendor/autoload.php';

$brandCountry = getopt("b:");
$split = explode('-', $brandCountry["b"]);
$configFile = new Base();
$configFile->printConfigFile($split[1], $split[0]);
$brandPath = $configFile->featureBrandPath($split[1]);
print_r($brandPath[0]);