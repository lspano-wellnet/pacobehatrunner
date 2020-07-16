<?php
require 'vendor/autoload.php';

$brandCountry = getopt("b:");
$split = explode('-', $brandCountry["b"]);
$behatFile = new Base();
$behatFile->printBehatYml($split[0], $split[1]);
$brandPath = $behatFile->featureBrandPath($split[0]);
print_r($brandPath[0]);