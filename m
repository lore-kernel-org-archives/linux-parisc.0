Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA27297
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 10:53:21 -0600
Received: from chrome.rose.hp.com (kirkb@chrome.rose.hp.com [15.8.150.209])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id KAA22722
	for <parisc-linux@thepuffingroup.com>; Tue, 19 Oct 1999 10:54:10 -0600 (MDT)
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199910191655.JAA08169@chrome.rose.hp.com>
Subject: Re: [parisc-linux] different PA2.0 CPUs in the same box? 
To: grundler@cup.hp.com
Date: Tue, 19 Oct 1999 9:55:50 PDT
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199910191604.JAA27382@milano.cup.hp.com>; from "Grant Grundler" at Oct 19, 99 9:04 am
List-ID: <linux-parisc.vger.kernel.org>

| 
| The processors can run from a "system clock" and they all run synchronous.
| No chance of "clock drift" since they run at exactly the same pace.
| But on systems like 870, T-class and N-class, the processors are fed clock
| signals from (similar but) different sources.  Each frequency domain will
| slowly drift from the "average" and thus the processor clocks need to be
| resyncronized regularly.
| 

Eh? I can't speak to the T-Class, but N-Class processors (as well as
A,B,C,D,E,F,G,H,I,J,K, and L) all run from a single clock source.  All
of the fundamental problems of clock drift happen between systems, not
interior to a system.  The crystals used are usally 25~50ppm, which
would amount to a second or two per day between systems, which is
significant, but is easily sovled using NTP.

There is no time clock in the processor itself, but rather a register
which is incremented every clock tick. That is why you need to know the
frequency of the processor to convert clock ticks to wall time.  
I believe that there are some wrinkles that can happen in sensing the 
rollover of the interval timer register under all interrupt conditions,
and it may be that this is the 'synchronization' problem that you
are thinking about. But, I don't think that it is due to drift on the
hardware clock circuits.

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
