Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03295
	for <parisc-linux@puffin.external.hp.com>; Sun, 17 Dec 2000 13:18:16 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Karsten Merker <karsten@excalibur.cologne.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] configuration problems with cvs from 20001216 15:40 CET
Date: Sun, 17 Dec 2000 21:20:51 +0100
References: <20001217115105.A17378@excalibur.cologne.de>
In-Reply-To: <20001217115105.A17378@excalibur.cologne.de>
MIME-Version: 1.0
Message-Id: <00121721201800.25726@P100>
List-ID: <linux-parisc.vger.kernel.org>

> $CONFIG_FB_STI is set to "y" as can be seen in .config, nonetheless
> CONFIG_FBCON_STI is not declared. 

Hi Karsten,

I can't reproduce your problems with a freshly checked-out tree. Maybe you 
have wrong permissions on .config or a similiar silly problem ?

If you check out, please remove your .config and make a new "make menuconfig".
Now remember to DISABLE (!!) "Support for console on serial port" under 
"Character Devices" and enable STI-console and STI-fb again.

Greetings,

	Helge
