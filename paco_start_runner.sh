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
echo "please enter key [BrandCode-Country] to start test"
echo "examples:"
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
sudo ./batch-all-stores.sh
echo "Tests ended."