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

brand=$(php Start_runner.php -b "${selection}")
echo running on ${brand}
cd ../data || echo "Error, folder data not found"
echo "Starting tests..."
export RUNNER_GOOGLE_TOKEN="/data/maxmara_dd_test/tests/token.json"
export RUNNER_GOOGLE_CREDENTIALS="/data/maxmara_dd_test/tests/credentials.json"
sudo -E nohup ./batch-all-stores.sh &
echo "Tests ended."