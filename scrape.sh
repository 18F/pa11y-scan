while read p; do
  pa11y $p -r json > results/$p.json
  echo $p
done <domains.csv