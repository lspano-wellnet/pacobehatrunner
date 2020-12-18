echo 'opening Jira tickets, files will be saved in /artifacts/jira_tickets'
cd ..
rm -r artifacts/jira_tickets/*
docker run --rm -v "$PWD/behat.yml:/tests/behat.yml" -v "$PWD/features:/tests/features" -v "$PWD/artifacts:/tests/artifacts" -v "$PWD/vendor:/tests/vendor" -v "$PWD/credentials.json:/tests/credentials.json" -v "$PWD/token.json:/tests/token.json" wellnetimages/behat:2.0.1 /tests/bin/behat --format pretty features/features_maxmara/TSF050-utils/TSF050_FT002-order_placer.feature:17
#cd ../emailnotifierphp
#sh email_send_ticket.sh