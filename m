Return-Path: <hppa-linux@puffingroup.com>
From: Wim Coekaerts <wcoekaer@aldebaran.wimmekes.net>
Message-Id: <199902180223.SAA02882@aldebaran.wimmekes.net>
To: hppa-linux@puffingroup.com
Date: Wed, 17 Feb 1999 18:23:30 -0800 (PST)
Content-Type: text
Subject: [hppa-linux] NIC
Resent-Message-ID: <"F0aqv1.0.Qu6.Setos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Ok, I know this is not totally relevant to linux itself but I need to get my 735/99 up and running before I can be of help :)

Since a crash last saturday, I cannot get my network up anymore, when I do 
lanscan it gives me 

path 2.0.2  address  0x080009629AC0 lu 0 State DOWN 
NameUnit lan0 State DOWN ID4 method ETHER number 52

ioscan recognizes it, at boot it detects the hardware device but whenever I do ifconfig 10.0.0.5 netmask 255.255.255.0 up it comes back with no such device

I have no clue what to do anymore, I tried different transceivers..nada... the lights on the transceiver are on so that seems to be ok.

any hints ? Without that I will have to move a scsi disk out and put the mklinux image on it and stuff  whihc I don'mt mind doing but I rather have my network up and go from there

thanks

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
