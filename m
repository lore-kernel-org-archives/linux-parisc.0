Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA17729
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 10:33:22 -0700
Message-Id: <200101101738.JAA05001@milano.cup.hp.com>
To: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
Cc: "'Karsten Merker'" <karsten@excalibur.cologne.de>,
        "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: Re: C110 - palinux-0.5.iso boot but... 
In-reply-to: Your message of "Wed, 10 Jan 2001 11:43:23 PST."
             <A4A5E4C468B5D11190220001FA6835DD04DD87A8@EPIXCH003>
Date: Wed, 10 Jan 2001 09:38:26 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


> What I do find strange anyway: if I try CTRL+ALT+DEL on the keyboard
> connected to mother board (i.e. PDC keyboard?) the awaiting reboot is well
> launch (except if I apply the patch
> http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/12-Dec/0254.ht
> ml which also display more on the PDC console but "warning can not initial
> console" and go back to serial port console?)

I've seen this warning with the console patch applied and an *old* palo.
When Mathew Wilcox committed changes for the console support, he
also committed palo changes. palinux-0.5.iso has the old palo and thus
current kernels are slightly incompatible WRT console support.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
