Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA00440
	for <parisc-linux@puffin.external.hp.com>; Thu, 27 Apr 2000 02:36:07 -0600
Message-ID: <004101bfb018$a7c480c0$9049bc0f@hungary.hp.com>
From: "Gyula Matics" <gyula_matics@hp.com>
To: <andrew@neep.com.au>, <parisc-linux@thepuffingroup.com>
References: <20000427012427.F11538@neep.com.au>
Subject: Re: [parisc-linux] How to attach a console to a HP9000 E45 server?
Date: Thu, 27 Apr 2000 09:17:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> But perhaps you could supply a translation, as your responses

OK, here is your chance to learn Hungarian.

> Szia,

Hi,

> >    a HP 9000 E45 server
> oreg joszag. 7100LC 80Mhz, ha jol latom LASI van benne,
> jo esely van arra, hogy mar a mostani kernel is tud
> vele valamit kezdeni.

an old beast. 7100LC 80Mhz, and if i'm correct it has
LASI so there is a pretty good chance that the current
kernel can do something with it.

> >    MDP MUX - what the hell it is exactly???
> valoszinuleg egy olyan szerkezet, aminek az egyik vegen
> soros portok, a masikon meg halozat van.

it's a thing with serial lines on one end and probably
lan on the other.

> >    a HP 700/96 terminal with serial and paralell port
> a leggyakrabban hasznalt sima soros terminal. A Data
> feliratu portjat kell hasznalni (szeles soros port)

it's the most commonly used simple serial terminal. You
need to use the prot labelled 'Data' to connect to the
server.

> >    and a SCSI storage box...
> ha az osszes szerkezethez tudsz mondani termekszamot, akkor
> megmondom, hogy pontosan mik. A1234A formatumuak szoktak
> lenni a szamok.

if you can tell me the product numbers for all of your thing
then i can probably tell you what they are. The product numbers
are usually in the A1234A format.

> > We think there is an operating system on the server, because it
> > seems to boot, but we cannot connect the terminal properly, so we
> > don't see anything. (Only a menu of the terminal in German language
> > :(((( )
> a terminal nyelve ha jol emlekszem atallithato. nyomd meg a user/menu
> gombot, aztan F8 es valahol arrafele.

IIRC the language of the terminal can be changed. press the user/menu
button the F8, then whatever seems appropriate.

> A terminalt resetelni ugy tudod, hogy bekapcsolas kozben lenyomva
> tartod D betut. Marmint a terminal bekapcsolasa kozben.

you can reset the terminal by holding down D while turning on it.
I mean while turning on the terminal.

> >    How can we connect the terminal to the server or can we replace
> >    this terminal with a terminal emulator on PC?
> 96008N1, mukodnie kell tetszoleges terminal emulatorral.

it should work with any terminal emulator, the format is 9600N1

> >    What does the bootp mean? We think it means that we can boot Linux
over
> >    network with bootp/tftp?
> az egyfajta boot protokoll es igen, a linux kernelt most legkonyebben
> boot-vel tudod elinditani a szerveren.

that is a kind of boot protocoll and yes this is the easiest
way to boot the linux kernel currently.

Gyula
