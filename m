Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA15923
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 19:41:27 -0700
Message-Id: <200012200245.SAA16490@milano.cup.hp.com>
To: Rod Smart <snaketails@optushome.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Pa-RISC Graphics card question 
In-reply-to: Your message of "Tue, 19 Dec 2000 23:11:10 PST."
             <3A3F505D.1FDA4CDC@optushome.com.au>
Date: Tue, 19 Dec 2000 18:44:59 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Rod Smart wrote:
>     Hello.
> 
>     I have a C-180 RISC box, and it has a GRAPHICS(3) card installed.
> 
>     Running from the command menu during boot-up, then running the
> following command, I get this resul for graphics cards.
> 
>     running    IO
> 
>     GRAPHICS(0)    8/24    INTERNAL_EG_1280    built-in
>     GRAPHICS(3)    10/8    HPA 4071B_L2            GSC Slot 3

HCRX24 graphics card - 24-bit color.

> 
>     Ok now, I understand the GRAPHICS(0) one, thats the wierd looking
> connector on the back,

That's an "Enhanced Video Connector" which was supposed to become
an industry standard. Adapters for EVC to 15-pin are available:
Product Number   Part Number    Description
 A4167A1
                  8120-6862
                                EVC (F) to 15-pin (M)
 A4168A2
                  8120-6861
                                EVC (M) to 15-pin (F)
 A4169A3
                  8120-6863
                                15-pin (F) to 15-pin (F)


> but the GRAPHICS(3) has a DB-15 High Density (Std
> PC video) connector on the back, I'm wondering what this card is?

A4071B     Hyperdrive "B" 24 plane,supports           A4070-69508
           Video Out   (HCRX-24)

> 
>     I have looked on some web sites to find information on the
> accompanying A4331D monitor I have, but they said that the terminals for
> that monitor are BNC connectors, but nothing saying that its also comes
> as a DB-15HD connector.

You need a DB-15 to BNC cable - I think the card outputs SOG (Sync-on-Green)
by default. BNC is just the type of connector used to carry Red, Green, and
Blue signals.

>     Would anyone know if this is a spuuprted video card on the PALINUX
> system?

It's listed as a supported device for the C180 - so I would expect the
STI CON/FB drivers to support it (or eventually support it).

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
