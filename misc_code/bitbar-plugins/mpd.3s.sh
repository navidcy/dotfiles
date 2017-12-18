#!/bin/bash
color="#81a2be"
mpcpath=/usr/local/bin/mpc
debug=false

echo "$($mpcpath | head -n 1 | sed 's/volume.*$//') | color=${color}"

echo "---"

echo "$($mpcpath | tail -n 2 | sed 's/volume.*$//')"

echo "---"

echo "Play/Pause | bash=\"$mpcpath\" param1=toggle terminal=$debug"
echo "Previous | bash=\"$mpcpath\" param1=prev terminal=$debug"
echo "Next | bash=\"$mpcpath\" param1=next terminal=$debug"
echo "Stop | bash=\"$mpcpath\" param1=stop terminal=$debug"

echo "---"

echo "$($mpcpath | tail -n 1 )"

echo "Toggle Repeat | bash=\"$mpcpath\" param1=repeat terminal=$debug"
echo "Toggle Random | bash=\"$mpcpath\" param1=random terminal=$debug"
echo "Toggle Single | bash=\"$mpcpath\" param1=single terminal=$debug"
echo "Toggle Consume | bash=\"$mpcpath\" param1=consume terminal=$debug"

