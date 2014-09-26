Title: Der Installationsbeschleuniger 
Author: fraslo
Category: Alles über die Werkstatt
Date: 2014-07-04 13:37


Die Installation von Linux erfordert zumeist auch den Download von mehreren hundert Megabyte an Daten. Auch wenn von einer DVD oder USB-Stick installiert werden, müssen große Mengen an Updates und gewünschten zusätzlichen Paketen aus dem Internet herunter geladen werden.

Um bereits einmal herunter geladene Pakete zwischen zu speichern, gibt es die Proxy Lösung 'apt-cacher'. Für die [Linux Werkstatt Oldenburg](http://www.linux-werkstatt-oldenburg.de/ "Homepage Linux-Werkstatt Oldenburg") wurde ein solcher Proxy im [Hackspace Oldenburg 'Mainframe'](http://www.kreativitaet-trifft-technik.de/ "Homepage Mainframe") installiert. Alle Linux-Distributionen, die das Paketformat APT einsetzen, werden durch diese Lösung beschleunigt. Dies umfasst Debian als auch alle Ubuntu-Varianten wie Mint. 

Große Teile der Zeit für eine Installation können damit entfallen. Durch den Proxy können 30-45 Minuten Installationszeit bei langsamen Internetverbindungen eingespart werdens.

##### Einen eigenen Proxy installieren
Auch zuhause kann man solch einen Proxy installieren, ein Einzeiler genügt:
``` bash 
sudo apt-get install apt-cacher-ng
```



##### Den Proxy aktivieren

Der Proxy sollte zu einem möglichst frühen Zeitpunkt in der Distribution eingetragen werden.

Dafür  wird die Datei ``` /etc/apt/apt.conf.d/01proxy ``` mit dem folgenden Inhalt angelegt:
``` bash 
Acquire::http { Proxy "http://spacegate:3142"; };
```

Der folgende Einzeiler wird dafür in ein Terminal kopiert und ausgeführt:

``` bash 
echo "echo 'Acquire::http { Proxy \"http://spacegate:3142\"; };' >/etc/apt/apt.conf.d/01proxy" | sudo sh
```

##### Den Proxy entfernen 
Um diesen Proxy wieder auszutragen, muss die Datei wieder entfernt werden:

``` bash 
sudo rm /etc/apt/apt.conf.d/01proxy
```
                                                                                                                                     
Das ist notwendig, da sonst außerhalb der Linux Werkstatt keine Pakete (auch: Sicherheitsupdates) mehr nachinstalliert werden können.                          
                                                                                                                                     
#### Tipps:                                                                                                                          
1. Um den Proxy verwenden zu können, muss ein Netzwerkanschluss oder das WLAN des [Hackspace Oldenburg 'Mainframe'](http://www.kreativitaet-trifft-technik.de/ "Homepage Mainframe")  verwendet werden, nicht das Freifunk Netz.

2. Wer erst einmal eine Linux-Installation ausprobiert und nur die DVD startet, kann über ein Symbol auf dem Desktop die Installation starten. Vor dem Klick sollte der Proxy wie oben beschrieben eingetragen werden, wenn schon während der Insttallation Pakete aus dem Internet geholt werden sollen. Nach der Installation wird das System neu gestartet. Hiernach muss der Proxy erneut wie oben beschrieben eingetragen werden, da auch im Nachgang noch große Mengen an Paketen herunter geladen werden.                                      
3. Vor dem Verlassen der [Linux Werkstatt Oldenburg](http://www.linux-werkstatt-oldenburg.de/ "Homepage Linux-Werkstatt Oldenburg") muss der Proxy wieder ausgetragen werden!                                                     

