<?php
require 'vendor/autoload.php';



$brandCountry = getopt("b:");
$split = explode(';', $brandCountry["b"]);
$behatFile = new Base();
$behatFile->printBehatYml($split[1], $split[0], $split[3]);
$brandPath = $behatFile->featureBrandPath($split[1]);
print_r($brandPath[0]);