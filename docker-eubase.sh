docker rm eubase --force
docker image rm eubase
rm -r /tmp/eubase
mkdir /tmp/eubase && cd /tmp/eubase
git clone https://github.com/ArminKardan/eubase.git /tmp/eubase
docker build -t eubase /tmp/eubase