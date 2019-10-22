torprivoxy
==========
This container have TOR and Privoxy bundled together.

modified from 
Github Repo [https://github.com/arulrajnet/torprivoxy][torprivoxy_repo]


this modification reads a file called /country/country and sets the ExitNodes for tor so that you can specify a specific country at runtime. map -v /locationofcountryfile:/country when starting 

### How to Use

```
docker run -d \
-p 8118:8118 -p 9050:9050 -p 9051:9051 \
--name tor -v /countryfilelocation:/country -i arulrajnet/torprivoxy:latest
```

Binding port 9050 and 9051 are optional. 9051 is the controlport of TOR Network. Using that you can forcefully regenerate the TOR ip. Read more about [tor_ip_renew.py][tor_ip_renew] 


**To restart TOR and Provoxy**

```
supervisionctl
supervisor> status
supervisor> restart tor
supervisor> restart privoxy
```

Global Proxy
------------

You can set privoxy as a global proxy so that all your traffic goes via TOR

###In Ubuntu

Open `/etc/environment`

```
http_proxy="http://127.0.0.1:8118"
https_proxy="http://127.0.0.1:8118"
ftp_proxy="http://127.0.0.1:8118"
HTTP_PROXY="http://127.0.0.1:8118"
HTTPS_PROXY="http://127.0.0.1:8118"
FTP_PROXY="http://127.0.0.1:8118"
_JAVA_OPTIONS="-Dhttp.proxyHost=localhost -Dhttp.proxyPort=8118"
```

Add this at the EOF.

Then `source /etc/environment`

###In CentOS

Create file `/etc/profile.d/proxy.sh` Then put the below content and save.

```
http_proxy="http://127.0.0.1:8118"
https_proxy="http://127.0.0.1:8118"
ftp_proxy="http://127.0.0.1:8118"
HTTP_PROXY="http://127.0.0.1:8118"
HTTPS_PROXY="http://127.0.0.1:8118"
FTP_PROXY="http://127.0.0.1:8118"
_JAVA_OPTIONS=$_JAVA_OPTIONS" -Dhttp.proxyHost=localhost -Dhttp.proxyPort=8118"

export http_proxy https_proxy ftp_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY _JAVA_OPTIONS
```

Then `source /etc/profile.d/proxy.sh` OR you can set the same in `.bashrc` or `.bash_profile`

[tor_ip_renew]: https://gist.github.com/arulrajnet/9df385cdb70d8a945686
