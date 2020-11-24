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
echo "| it-ben   =>   Benetton Italy         |"
echo "| gb-sis   =>   Sisley United Kingdom  |"
echo '+--------------------------------------+'
echo '                                 '
echo "WARNING!  the current /automations/data/config.yml configuration will be overwritten"
read selection

brand=$(php Start.php -b "${selection}")
echo running on ${brand}
cd ..
	## use this command to run on AWS
	## output:
	## --format pretty for debug)
	## --format progress no debug)
#docker run --rm -v "$PWD/behat.yml:/automations/behat.yml" -v "$PWD/features:/automations/features" -v "$PWD/artifacts:/automations/artifacts" -v "$PWD/vendor:/automations/vendor" -v "$PWD/credentials.json:/automations/pacobehatrunner/credentials.json" -v "$PWD/token.json:/automations/pacobehatrunner/token.json" wellnetimages/behat:2.0.1 /tests/bin/behat --format progress features/features_${brand}/TSF050-utils/TSF050_FT001-order_placer.feature:5
docker run --rm --network host -v "$PWD/behat.yml:/tests/behat.yml" -p 4000:80 -p 4001:443  -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts"  -v "$PWD/vendor:/automations/vendor" -v "$PWD/credentials.json:/automations/credentials.json" -v "$PWD/token.json:/automations/token.json" wellnetimages/behat:2.0.1 /tests/bin/behat features/features_benetton/TSF050-utils/TSF050_FT001-order_placer.feature:5

	## use this command to run locally
## rm -rf artifacts/screenshots/*.png & docker run --rm --network tests_default -v "$PWD/behat.yml:/tests/behat.yml" -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts" -v "$PWD/vendor:/tests/vendor" -v "$PWD/credentials.json:/tests/credentials.json" -v "$PWD/token.json:/tests/token.json" wellnetimages/behat:2.0.0 /tests/bin/behat --format pretty features/features_${brand}/TSF050-utils/TSF050_FT002-order_placer.feature:4
