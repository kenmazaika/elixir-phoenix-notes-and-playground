# [https://phoenix-heroku-demo-ken.herokuapp.com](https://phoenix-heroku-demo-ken.herokuapp.com)

To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.


##  Deploying to heroku
* https://github.com/sinetris/sinetris-blog

## Core Tutorial
* http://gogogarrett.sexy/programming-in-elixir-with-the-phoenix-framework-building-a-basic-CRUD-app/

## Other Tutorial I used
* http://www.elixirdose.com/post/lets-build-web-app-with-phoenix-and-ecto


## Digital Ocean.
* http://www.cyberciti.biz/faq/howto-add-new-linux-user-account/
* https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys--2


```
useradd deploy
passwd deploy
sudo adduser deploy sudo
mkdir /home/deploy
chown deploy:deploy /home/deploy
chmod 0700 /home/deploy

cat ~/.ssh/id_rsa.pub | ssh deploy@104.236.8.178 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"

```


```
sudo apt-get update && apt-get upgrade
sudo apt-get install build-essential libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev
#> curl -O http://www.erlang.org/download/otp_src_17.3.tar.gz
#> tar xzfv otp_src_17.3.tar.gz
#> cd otp_src_17.3
#> ./configure && make && sudo make install

```


```
#> sudo apt-get install git
#> cd
#> git clone https://github.com/elixir-lang/elixir.git
#> cd elixir
#> make clean test
export PATH="$PATH:/root/elixir/bin"

```


CREATE USER ken WITH PASSWORD 'yoloswaglol';
CREATE DATABASE phoenix_crud2;
GRANT ALL PRIVILEGES ON DATABASE phoenix_crud2 to ken;
