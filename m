Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA08843
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 10:33:37 -0700
To: "Carlos Acevedo" <carlos_a_acevedo@hotmail.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: HP PA-Risc with Linux 
In-Reply-To: Your message of "Mon, 29 Jan 2001 14:22:54 MST."
             <OE562shoxt8ypSqdrrn0000148a@hotmail.com>
References: <OE562shoxt8ypSqdrrn0000148a@hotmail.com> 
Date: Tue, 30 Jan 2001 10:37:33 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14Neij-0002Hj-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Carlos, I've forwarded your e-mail to our mailing list since I'm not
the expert on 715 hardware.  You might also want to read through the
FAQ and other things on our web site, www.parisc-linux.org.

The CD is pretty old and I suspect you'll have better luck with a
newer kernel.  We are planning to produce a "0.6" ISO image Real
Soon Now (tm).  Alternatively you can get a newer kernel
from puffin.external.hp.com and boot from that kernel using either
a bootp server to serve it to the 715, or DAT tape if you happen
to have that.  Use the Linux kernel command line to indicate the
0.5 CD is its root (root=/dev/scd0).

= I Have some problems installing Linux, hope you have a couple of minutes =
= to give a hand.
= 
= I have a Apollo 715/75 and I would like to install Linux in it. What I =
= have done so far is:
= downloaded "palinux-0.5.iso.gz"
= create a CD using Adaptec CD Creator (on a PC)
= 
= I tried to boot from the CD rom and evrething seems to start ok, bu =
= right after detecting the Scorpio Sr. hardware I get a Stack dump and =
= the workstation doesn't do anything else.
= 
= thanks in advance
= 
= Regards
= 
= Carlos Acevedo
= Computer Modelling Group
