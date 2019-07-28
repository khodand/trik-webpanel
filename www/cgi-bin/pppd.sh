#Copyright 2019 Andrei Khodko
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License

#!/bin/sh

tty_path=/etc/trik/
init_tty=/etc/trik/init_tty.sh

read params

./notifyThenKill.sh $(basename -- "$0") $$ $params

if [[ $params = "ON" ]]; then
    ln -f "$tty_path"tty_ppp.sh $init_tty
else
    ln -f "$tty_path"tty_ppp.sh $init_tty
fi

echo "HTTP/1.1 201 Modified"
killall trikGui
