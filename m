Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA08279
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 14:42:48 -0600
Message-Id: <200008292045.NAA17082@milano.cup.hp.com>
To: Claudiu Carter <ccarter@linuxcare.com>
Cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] HP R390 boots ok, log inside 
In-reply-to: Your message of "Tue, 29 Aug 2000 15:10:30 PDT."
             <39AC0AA6.D17DF96@linuxcare.com>
Date: Tue, 29 Aug 2000 13:45:42 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Claudiu Carter wrote:

> Tara and i have managed to boot both an R390 and D270, here's the log
> for the R390.

Tara, Claudia,

Just FYI. I wanted to point out the only things that work under the
R390/D270 (and similar boxes) are sim700 and serial port - bare minimum
to boot. What's missing from the CD is U2/Uturn support. Bob Pflederer
was able to get U2 support working some time after the CD image was burned.

sim700 DMA happens to work since Richard Hirst made sim700 work
on boxes which are not I/O coherent (eg 715/33) by adding explicit
cache flushing code where needed.

serial doesn't do DMA and thus isn't affected.
But LAN and other GSC/PCI add-on are affected.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
