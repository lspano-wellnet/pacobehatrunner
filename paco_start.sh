echo "please enter key [BrandCode-Country] to start test"
echo "examples:"
echo "dt-it   =>   Intrend Italy"
echo "mm-gb   =>   MaxMara United Kingdom"

read selection

brand=$(php Start.php -b "${selection}")
echo running on ${brand}, the current behat.yml configuration will be overwritten

echo proceed?  [y/n]

read selection
if test ${selection} = "y"
then
	echo "running..."
	cd ..
	rm -rf artifacts/screenshots/*.png & docker run --rm --network tests_default -v "$PWD/behat.yml:/tests/behat.yml" -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts" -v "$PWD/vendor:/tests/vendor" -v "$PWD/credentials.json:/tests/credentials.json" -v "$PWD/token.json:/tests/token.json" wellnetimages/behat:2.0.0 /tests/bin/behat --format pretty features/features_${brand}/TSF050-utils/TSF050_FT002-order_placer.feature:4
else
  echo "bye bye.."
fi