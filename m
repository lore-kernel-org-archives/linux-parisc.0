Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA00808
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 10:04:23 -0600
Message-Id: <200008231606.JAA11784@milano.cup.hp.com>
To: Matthew Hudson <mhudson@home.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: U2/Uturn stuff. 
In-reply-to: Your message of "Wed, 23 Aug 2000 10:39:07 PDT."
             <39A3F01B.E042265D@home.com>
Date: Wed, 23 Aug 2000 09:06:51 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Hudson wrote:
> Grant Grundler wrote:
> > Non-functional since U2/Uturn code is not ready yet (I'm working on it)
> > and not documented (let's not go there again right now). And even
> > if it were ready, I need to hack in some sort of an "I/O tree"
> > in order to support more than one U2/Uturn. K-class can have
> > multiple U2/Uturns.
> 
> I've looked over the ccio-dma.c code and nothing jumps out at me
> codewise. Can you point me to any information about the IOA
> chips?

Unfortunately not. If it's not clear from the code, point me
at the specific chunk of code you don't understand and I'll
add comments to make it clearer.

> Also, do you have an inkling of an idea where the problem
> might be? I'll take a crack at it and see if I can do anything,
> no promises. :-)

Bob Pflederer has it working and I committed his one line fix
to ccio-dma.c yesterday.  I haven't tested it as my C200 is being
shipped to someone else now.

Changes to lasi LAN (82596?) and cache flushing code are also
needed to make the system usable.

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
