echo '                                 '
echo '      ___         ___           ___           ___           ___     '
echo '     /  /\       /  /\         /  /\         /  /\         /  /\    '
echo '    /  /::\     /  /::\       /  /::\       /  /:/        /  /::\   '
echo '   /  /:/\:\   /  /:/\:\     /  /:/\:\     /  /:/        /  /:/\:\  '
echo '  /  /:/~/:/  /  /:/~/::\   /  /:/~/::\   /  /:/  ___   /  /:/  \:\ '
echo ' /__/:/ /:/  /__/:/ /:/\:\ /__/:/ /:/\:\ /__/:/  /  /\ /__/:/ \__\:\'
echo ' \  \:\/:/   \  \:\/:/__\/ \  \:\/:/__\/ \  \:\ /  /:/ \  \:\ /  /:/'
echo '  \  \::/     \  \::/       \  \::/       \  \:\  /:/   \  \:\  /:/ '
echo '   \  \:\      \  \:\        \  \:\        \  \:\/:/     \  \:\/:/  '
echo '    \  \:\      \  \:\        \  \:\        \  \::/       \  \::/   '
echo '     \__\/       \__\/         \__\/         \__\/         \__\/    '
echo '                                 '
echo "please enter key [Country-BrandCode] to start test"
echo "Examples:"
echo '                                 '
echo '+--------------------------------------+'
echo "| it-dt   =>   Intrend Italy           |"
echo "| gb-mm   =>   MaxMara United Kingdom  |"
echo '+--------------------------------------+'
echo '                                 '
echo "WARNING!  the current /test/data/config.yml configuration will be overwritten"
read selection

brand=$(php Start.php -b "${selection}")
echo running on ${brand}, the current behat.yml configuration will be overwritten

echo proceed?  [y/n]

read selection
if test ${selection} = "y"
then
	echo "running..."
	cd ..
	## use this command to run on AWS
	docker run --rm -v "$PWD/behat.yml:/tests/behat.yml" -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts" -v "$PWD/vendor:/tests/vendor" -v "$PWD/credentials.json:/tests/credentials.json" -v "$PWD/token.json:/tests/token.json" wellnetimages/behat:2.0.1 /tests/bin/behat --format pretty features/features_${brand}/TSF050-utils/TSF050_FT002-order_placer.feature:4
	## use this command to run locally
	## rm -rf artifacts/screenshots/*.png & docker run --rm --network tests_default -v "$PWD/behat.yml:/tests/behat.yml" -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts" -v "$PWD/vendor:/tests/vendor" -v "$PWD/credentials.json:/tests/credentials.json" -v "$PWD/token.json:/tests/token.json" wellnetimages/behat:2.0.0 /tests/bin/behat --format pretty features/features_${brand}/TSF050-utils/TSF050_FT002-order_placer.feature:4
else
  echo "bye bye.."
fi