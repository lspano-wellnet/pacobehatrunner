if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo 'ERROR: one or more variables are undefined'
  echo 'expected input like "it dt uat"'
  echo "input Examples:"
  echo '                                 '
  echo '+----------------------------------------------+'
  echo "| it dt uat   =>   Intrend Italy UAT           |"
  echo "| gb mm test  =>   MaxMara United Kingdom TEST |"
  echo '+----------------------------------------------+'
  exit 1
fi

brand=$(php Start.php -b "${1}-${2}-${3}")
echo running on ${brand}
cd ..
	## use this command to run on AWS
	## output:
	## --format pretty for debug)
	## --format progress no debug)
docker run --rm -v "$PWD/behat.yml:/tests/behat.yml" -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts" -v "$PWD/vendor:/tests/vendor" -v "$PWD/credentials.json:/tests/credentials.json" -v "$PWD/token.json:/tests/token.json" wellnetimages/behat:2.0.1 /tests/bin/behat --format pretty features/features_${brand}/TSF050-utils/TSF050_FT002-order_placer.feature:4
	## use this command to run locally
## rm -rf artifacts/screenshots/*.png & docker run --rm --network tests_default -v "$PWD/behat.yml:/tests/behat.yml" -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts" -v "$PWD/vendor:/tests/vendor" -v "$PWD/credentials.json:/tests/credentials.json" -v "$PWD/token.json:/tests/token.json" wellnetimages/behat:2.0.0 /tests/bin/behat --format pretty features/features_${brand}/TSF050-utils/TSF050_FT002-order_placer.feature:4
