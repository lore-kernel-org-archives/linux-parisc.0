Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA26706
	for <parisc-linux@puffin.external.hp.com>; Wed, 26 Apr 2000 11:01:20 -0600
Message-ID: <00bb01bfafa0$f01c2df0$3b4dbc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <zegab@freemail.hu>, <parisc-linux@thepuffingroup.com>
Cc: <nandogp@visto.com>, <pedro@flynn.zork.net>
References: <7758.000426@freemail.hu>
Subject: Re: [parisc-linux] How to attach a console to a HP9000 E45 server?
Date: Wed, 26 Apr 2000 19:00:33 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Szia,

>    a HP 9000 E45 server

oreg joszag. 7100LC 80Mhz, ha jol latom LASI van benne,
jo esely van arra, hogy mar a mostani kernel is tud
vele valamit kezdeni.

>    MDP MUX - what the hell it is exactly???

valoszinuleg egy olyan szerkezet, aminek az egyik vegen
soros portok, a masikon meg halozat van.

>    a HP 700/96 terminal with serial and paralell port

a leggyakrabban hasznalt sima soros terminal. A Data
feliratu portjat kell hasznalni (szeles soros port)

>    and a SCSI storage box...

ha az osszes szerkezethez tudsz mondani termekszamot, akkor
megmondom, hogy pontosan mik. A1234A formatumuak szoktak
lenni a szamok.

> We think there is an operating system on the server, because it
> seems to boot, but we cannot connect the terminal properly, so we
> don't see anything. (Only a menu of the terminal in German language
> :(((( )

a terminal nyelve ha jol emlekszem atallithato. nyomd meg a user/menu
gombot, aztan F8 es valahol arrafele.

A terminalt resetelni ugy tudod, hogy bekapcsolas kozben lenyomva
tartod D betut. Marmint a terminal bekapcsolasa kozben.

>    How can we connect the terminal to the server or can we replace
>    this terminal with a terminal emulator on PC?

96008N1, mukodnie kell tetszoleges terminal emulatorral.

>    What does the bootp mean? We think it means that we can boot Linux over
>    network with bootp/tftp?

az egyfajta boot protokoll es igen, a linux kernelt most legkonyebben
boot-vel tudod elinditani a szerveren.

udv,
Gyula
