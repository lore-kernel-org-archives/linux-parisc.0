Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA05682
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Oct 1999 12:59:36 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by cosrel2.hp.com (8.9.3 (PHNE_18979)/8.8.5tis) with ESMTP id MAA09752
	for <parisc-linux@thepuffingroup.com>; Wed, 20 Oct 1999 12:58:08 -0600 (MDT)
Message-Id: <199910201857.LAA28284@milano.cup.hp.com>
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] different PA2.0 CPUs in the same box? 
In-reply-to: Your message of "Tue, 19 Oct 1999 09:55:50 PDT."
             <199910191655.JAA08169@chrome.rose.hp.com>
Date: Wed, 20 Oct 1999 11:57:08 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Kirk Bresniker wrote:
> Grant Grundler wrote:
> | The processors can run from a "system clock" and they all run synchronous.
> | No chance of "clock drift" since they run at exactly the same pace.
> | But on systems like 870, T-class and N-class, the processors are fed clock
> | signals from (similar but) different sources.  Each frequency domain will
> | slowly drift from the "average" and thus the processor clocks need to be
> | resyncronized regularly.
> | 
> 
> Eh? I can't speak to the T-Class, but N-Class processors (as well as
> A,B,C,D,E,F,G,H,I,J,K, and L) all run from a single clock source.

Kirk is right. T and V also run from a single clock source.
So no problem. I was confusing the discussions with what actually
got implemented.

my apologies,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
