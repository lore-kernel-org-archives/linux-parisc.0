Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id XAA15696
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 23:10:43 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id AAB681EF
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 23:13:23 -0700 (MST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id WAA24909
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 22:12:11 -0800 (PST)
Message-Id: <200011270612.WAA24909@milano.cup.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] case LEDs 
In-reply-to: Your message of "Tue, 21 Nov 2000 21:27:51 PST."
             <3A1B2F27.D08EC2AF@linuxcare.com>
Date: Sun, 26 Nov 2000 22:12:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> Grant Grundler wrote:
> > I was already asked this weekend to dig up technical info on LED
> > and soft power control. I guess this is my reminder to do that. :^)

I dug up the info but it's not in a form I'm willing to publishing.
However, someone did volunteer to look at this and I've provided them
with this info. So it will make into our CVS source tree and get
published that way.


> Isn't there a PDC call (pdc_chassis?) to do this? 

Not AFAICT. PDC_CHASSIS is documented in the pdc32.pdf found on
	http://www.parisc-linux.org/documentation.html 

But my gut feeling is parisc specific code could make some PDC_CHASSIS
calls to set up "sysstat" field (eg initialize, shutdown, run states).

Does anyone know if the chassis codes used by HPUX are published?
It would be cool if parisc-linux used the same codes where possible...


> Or is the heartbeat LED done by hardware?

Code I've looked at before seems to all do it in software.


grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
