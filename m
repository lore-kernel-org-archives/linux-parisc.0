Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12186
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 10:49:02 -0700
Message-Id: <200012271752.JAA23167@milano.cup.hp.com>
To: Alex deVries <adevries@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] performance 
In-reply-to: Your message of "Wed, 27 Dec 2000 12:05:19 PST."
             <3A4A214F.3DD53BAD@linuxcare.com>
Date: Wed, 27 Dec 2000 09:52:52 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> I stumbled on this:
> http://www.spec.org/osg/web99/results/res2000q4/
> 
> This shows some PA-RISC machines running HPUX performing reasonably well.

HPUX11+Zeus on A500 posted the highest rated Specweb99 for single CPU machine.
Though the HP specweb folks didn't expect that to last very long...

Note that IBM Netfinity server nearly doubled in performance using
native OS+Zeus vs linux+Tux. I don't expect such a dramatic difference
for parisc-linux+Tux vs HPUX+Zeus.

> What would it take to get parisc-linux to perform similiarly to HPUX for
> these kinds of numbers?  Showing that these kinds of numbers are
> possible for parisc-linux would certainly help in our quest to have real
> users.

Offhand, I can think of several things (roughly in order):
o Tux (and/or zero copy - aka "Block I/O")
o support more than 512MB memory - preferably 8 or 16GB (64-bit kernel)
o Profile Based Optimization (compiler/linker)
o Write a module to dump CPU performance counters to /proc
  (and use output to tune critical code paths)
o handle 10 packets per interrupt under acenic
o Jumbo Frames?

I'm sure others (eg jsm) could add alot more here.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
