# TP 3 : Test de connaissances réseau et IP

Réponses aux questions du TP, en lien avec l'infrastructure V1 (les VM `web` et `db` sous Vagrant/VirtualBox).

---

## i. IP privée et IP publique

Une IP privée ne sert qu'à l'intérieur d'un réseau local (LAN). Elle n'est pas routée sur Internet, donc plusieurs réseaux différents peuvent très bien utiliser la même, comme `192.168.56.10`.

Une IP publique, elle, est fournie par le FAI et elle est unique au niveau mondial. C'est elle qui permet d'être joignable directement depuis Internet.

---

## ii. Le réseau 192.168.56.0/24 dans le projet

C'est la plage que VirtualBox utilise par défaut pour son réseau privé hôte (host-only). On s'en sert ici pour deux raisons :

1. Mon PC (Windows) peut communiquer avec les VM `web` et `db`.
2. Les VM sont sur un réseau isolé : elles se parlent entre elles sans être exposées sur Internet.

---

## iii. Le masque de sous-réseau (exemple : /24)

Le masque indique quelle partie de l'adresse IP correspond au réseau et quelle partie correspond à la machine.

Avec `/24` (soit `255.255.255.0`), les 24 premiers bits, donc les 3 premiers octets, désignent le réseau. Pour `192.168.56.0/24`, le réseau est `192.168.56.x` et le dernier octet va de 1 à 254 pour les machines (0 est l'adresse du réseau et 255 celle du broadcast).

---

## iv. TCP et UDP

| | TCP | UDP |
| :--- | :--- | :--- |
| Connexion | Établit une connexion avant d'échanger (handshake en 3 temps) | Pas de connexion, les paquets sont simplement envoyés |
| Fiabilité | Vérifie que tout arrive, dans le bon ordre, et renvoie ce qui est perdu | Aucune garantie de livraison ni d'ordre |
| Vitesse | Plus lent à cause de ces contrôles | Plus rapide et plus léger |
| Exemples | HTTP (80), SSH (22), PostgreSQL (5432) | Streaming, jeux en ligne, DNS, VoIP |

En résumé : TCP quand on ne peut pas se permettre de perdre des données, UDP quand la rapidité compte plus qu'un paquet perdu de temps en temps.

---

## v. Le rôle du DHCP

Le DHCP distribue automatiquement la configuration réseau (adresse IP, masque, passerelle, DNS) aux machines qui se connectent. Sans lui, il faudrait régler ces paramètres à la main sur chaque machine.

---

## vi. La passerelle et le DNS

La passerelle (gateway) est le routeur par lequel passent les paquets qui sortent du réseau local, que ce soit vers un autre réseau ou vers Internet.

Le DNS fait le lien entre les noms de domaine et les adresses IP. Quand on tape `google.com`, c'est lui qui retrouve l'IP correspondante (par exemple `142.250.180.206`), puisque les machines communiquent avec des adresses et pas avec des noms.

---

## vii. Le NAT

Le NAT est fait par un routeur ou un pare-feu. Quand une machine du réseau local sort vers Internet, il remplace son IP privée par l'IP publique du routeur, puis fait l'opération inverse au retour des réponses.

Grâce à ça, tous les appareils d'un réseau local peuvent partager une seule IP publique pour accéder à Internet, et l'organisation interne du réseau reste cachée vu de l'extérieur.