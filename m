Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA14032
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Sep 1999 14:18:45 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id NAA14573
	for <parisc-linux@thepuffingroup.com>; Sat, 4 Sep 1999 13:20:36 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id NAA09900 for <parisc-linux@thepuffingroup.com>; Sat, 4 Sep 1999 13:18:10 -0700 (PDT)
Message-Id: <199909042018.NAA09900@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Card-mode Dino 
In-reply-to: Your message of "Fri, 03 Sep 1999 20:19:07 PDT."
             <19990904021908.3A1F918708@security.hp.com>
Date: Sat, 04 Sep 1999 13:18:10 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

LaMont Jones wrote:
> > > And does the dino-on-a-card have it's own IODC on the card?
> > No. Dino implements the PA I/O architected registers but no IODC.
> > I suspect the problem is it's really a bus converter and that
> > needs PDC support - IODC entry points don't apply to this.
> > Can anyone confirm this?
> 
> Can't confirm or deny, but it is possible (we've done it at least once)
> to build a bus converter that does not require PDC help, just architecture
> knowledge.

Let me add some depth to my suspicion.
Platform IO space (which Dino "translates" 1:1 to PCI MMIO space) is
assigned exclusively by PDC on platforms with GSC busses.  The OS can't
assign I/O space addresses to devices unless (a) knows where I/O space
is (could make assumptions about this), (b) exactly which parts
have been used by other bus converters or devices, and (c) which
parts are reserved for "special" devices (eg graphics)?

I suspect IODC can't provide this sort of functionality. Let me
rephrase my question: does anyone know if architected PDC interfaces
provide enough information to satisfy a/b/c above?

thanks,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
