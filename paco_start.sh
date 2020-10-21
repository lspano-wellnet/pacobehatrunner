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
  echo 'running on: ' $1 $2 $3
