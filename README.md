# pacobehatrunner

see documentation for Google Spreadsheet API at 
https://developers.google.com/sheets/api/quickstart/php

The purpose of this Project is to auto generate the behat.yml (and config.yml) file in order to execute the test scenario
in a easy and compact way

### Install
Copy this repo into your main project.

Then execute:

  - `composer install`  
  To install needed PHP packages
  
### Configure
you can edit settings for Browserstack access into the config.yml file.
default_env field can be ignored if the project is not for Multisite
countries.yml contains a mapping for the complete country name starting from it's code

This version of the project it's now stricly developed for maxmara_dd_test projet (Multisite)
https://bitbucket.org/wellnet-team/maxmara_dd_test/src/master/

Future developments may let this project become fully configurable

The Method featureBrandPath() inside Base.php outputs an array containing the current site folder in the project and 
the complete name of the brand to be used in config.yml or behat.yml file
Examples:

- run pacobehatrunner on "it-mm"
- it = Italy
- MM = outputs [maxmara, Maxmara]
    the firts field is used for the featuresFolder test/features/features_maxmara/
    the second field is used to compose the store "Italy_Intrend_UAT"
    the "UAT" part is composed starting from config.yml default_env
    
### Run
there are two separate scripts, to start test using behat.yml file or config.yml file (suggested, runner is used here
to handle execution)

- sh paco_start.sh
    run automation using behat.yml file and 'docker run' command
    Contains rich debug infos, but uses no runner to handle concurrency
    Suggestion: Use this script to run on Local envoirment
    credentials.json and token.json file might be set up to the current position in local envoirment
    see function getClient() in 'test/features/bootstrap/Utils.php'

- sh paco_start_runner 
    run automation using config.yml file and using batch-all-stores.sh execution
    credentials.json and token.json by default are set in the script using env variables
    no debug infos available but uses runner to handle concurrency and fail timeouts
    debug infos are written in pretty file under the run folder in
    /data/maxmara_dd_test/tests/artifacts/runs
    search the current run folder, ordered by date and time, browsers and feature executed
    for example, view this .pretty file log
    Suggestion: Use this script to run Test Plans on AWS server
    RUNNER_GOOGLE_TOKEN="/data/maxmara_dd_test/tests/token.json"
    RUNNER_GOOGLE_CREDENTIALS="/data/maxmara_dd_test/tests/credentials.json"
    
    see function getClient() in 'test/features/bootstrap/Utils.php'
    

