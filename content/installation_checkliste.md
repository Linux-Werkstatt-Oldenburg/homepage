Title: Checkliste für die Linux-Installation  
Author: fraslo
Category: Alles über die Werkstatt
Date: 2014-07-03 13:37

In der [Linux Werkstatt Oldenburg](http://www.linux-werkstatt-oldenburg.de/ "Homepage Linux-Werkstatt Oldenburg") soll Besuchern geholfen werden, das für sie optimale Linux zu erhalten. Die folgende Checkliste soll dabei helfen, keine wichtigen Schritte für die Installation zu vergessen.

### Bevor es losgeht

- Sind noch Daten zu sichern?
 - Betriebssysteme oder Dokumente?
 - Mit Clonezilla oder Live-CD Daten von Festplatte sichern
 - Soll die Windows-Installation erhalten bleiben?

### Hardwareanalyse
 - Ist eine Hybridplatte (SSHD) eingebaut? Eingeschaltetes SSD-Caching kann zu Datenverlust führen!
 - Ist ein RAID konfiguriert? Datenverlust ist möglich!
 - Welcher Prozessor ist eingebaut?
 - Wie viel Hauptspeicher ist eingebaut?
 - Wie groß ist die Festplatte?
 - Wie viele Festplatten sind vorhanden?
 - Booten über USB oder optisches Laufwerk notwendig?                                                                                


                                                                                                                                     
### Welches Linux soll installiert werden?

- Hardwarevoraussetzung: siehe oben
- Freie Software?
- Kenntnistand des Nutzers?                                                                                                         
- Ziele des Nutzers?                                                                                                                

### Allgemeine Tipps                                                                                                                                     
- Installation möglichst immer über LAN vornehmen, nicht WLAN                                                                        
- UEFI bedeutet immer 64 Bit                                                                                                         
- UEFI bedeutet GPT statt MBR
- Boot-Auswahl über F8, F10 oder F12 aufrufen
- Firmware (BIOS) über F1, F2 oder ENTF aufrufen
- Installation bricht ab/stockt? Im Bootmenu der Distribution ACPI und/oder APIC ausschalten

#### Welches Linux beherrscht UEFI und Secure Boot?
Diese Liste ist sicher nicht vollständig und kann nicht mehr aktuell sein, die frühesten Versionen werden aufgeführt: 

- [Fedora 18](https://fedoraproject.org/de/ "Fedora") 
- [OpenSuse 12.3](http://de.opensuse.org "OpenSuse")
- [Ubuntu 12.04.2](http://www.ubuntu.com/ "Ubuntu")

#### Welches Linux beherrscht UEFI ohne Secure Boot?
Diese Liste ist sicher nicht vollständig und kann nicht mehr aktuell sein, die frühesten Versionen werden aufgeführt: 

- [Debian 7](http://www.debian.org/index.de.html "Debian")
- [Linux Mint 15](http://www.linuxmint.com/ "Linux Mint")
- [(Mageia 3)](https://www.mageia.org/de/ "Mageia") 

## Windows ist bereits installiert

Windows starten:                                                                                                                     

- In Datenträgerverwaltung prüfen, ob es eine "EFI System Partion" gibt                                                              
- In Datenträgerverwaltung Platz für Linux schaffen                                                                                  
- Windows 8: Unter Energiefunktionen "Schnellstart aktivieren" deaktivieren
- Secure Boot NICHT abschalten, da auf manchen Geräten Windows dann nicht mehr startet
- Keine Installation von Linux bei Hybridfestplatten (SSHD)
                                                                                                                                 

### UEFI Booteinträge wählen
 - Windows neu starten
 - Beim Klick auf "Neu starten" die Umschalttaste gedrückt halten


## Es ist noch kein Betriebssystem installiert 
CSM (BIOS-Emulation) sollte nur noch in Ausnahnefällen  eingeschaltet werden
                                                                                         
                                                                                                                                     
#### Platte kleiner als 2 TB?                                                                                                             
Windows und Linux per CSM installieren, aber nur, wenn UEFI Probleme macht                                                                                               
                                                                                                                                     
#### Linux kann UEFI UND Secure Boot?                                                                                                     
Windows und Linux per UEFI mit Secure Boot installieren                                                                              
                                                                                                                                     
#### Linux kann UEFI?
Secure Boot in der Firmware abschalten, Windows und Linux installieren

#### Linux kann GPT?
Windows per UEFI und Linux per CSM starten

#### Es gibt eine zweite Festplatte?
Windows per UEFI und Linux per CSM über Bootloader im MBR der zweien Platte starten


#### Es ist nur eine Festplatte vorhanden:
- Firmware: Secure Boot abschalten, wenn Linux das nicht beherscht, sonst besser eingeschaltet lassen
- DVD oder USB-Stick mit UEFI-Fähigkeit erzeugen (geht nur bei 64 Bit), keine Multi-Boot-DVD verwenden
- Bios Bootmenu aufrufen und den UEFI-Eintrag(!) des Mediums wählen, nicht den normalen
- Installieren
- Linux erkennt Windows Installation hierbei nicht
- Bei Partitionierung die EFI Bootloader Partition (ESP) wählen (unter /boot/efi als Typ ESP einbinden)
- Freie Partion mit Swap und / belegen
- Im Bios Boot-Reihenfolge auf das Linux-Label legen

#### Es sind zwei Festplatten vorhanden
- In der Firmware CSM einschalten, wenn Platte kleiner 2TB
- Linux klassisch auf der zweiten Platte installieren

#### Es ist eine Hybrid-Festplatte vorhanden und Windows ist installiert
Das SSHD-Caching muss komplette ausgeschaltet werden. Wie das geht, hängt halt davon ab, wie das SSD-Caching funktioniert. Wenn es der Mainboard-Chipsatz macht, kann es sein, dass man es in der Firmware deaktivieren muss. Wenn es eine Windows-Lösung ist, dann sollte es reichen, das Ganze unter Windows zu deaktivieren.

## UEFI Booteinträge
### Welche Einträge existieren?
``` bash 
sudo efibootmgr
```

### Reihenfolge verändern
``` bash 
sudo efibootmgr --bootorder 2,0
```

### Einen neuen Eintrag anlegen
``` bash 
sudo efibootmgr --create --label 'Linux' --loader '\efi\linux\grubx64.efi' 
```

