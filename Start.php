<?php
require 'vendor/autoload.php';

$brandCountry = getopt("b:");
$split = explode('-', $brandCountry["b"]);
$behatFile = new Base();
$behatFile->printBehatYml($split[0], $split[1]);