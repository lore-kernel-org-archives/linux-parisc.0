Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA26877
	for <parisc-linux@puffin.external.hp.com>; Sat, 29 Apr 2000 17:17:29 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id AF33930492
	for <parisc-linux@thepuffingroup.com>; Sat, 29 Apr 2000 16:17:04 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id QAA09826 for <parisc-linux@thepuffingroup.com>; Sat, 29 Apr 2000 16:17:25 -0700 (PDT)
Message-Id: <200004292317.QAA09826@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ELF toolchain broken on HP-UX 
In-reply-to: Your message of "Fri, 21 Apr 2000 15:26:16 PDT."
             <200004212226.PAA03137@milano.cup.hp.com>
Date: Sat, 29 Apr 2000 16:17:25 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Ran into the next "wall". This is a heads up the toolchain built
> on HP-UX doesn't build valid code for parisc-linux.  (It might be
> fine for HP-UX binaries).
> 
> After ic_route_ioctl() is called, I get a "halted" message
> and the following output:
...
> GR2 0xc0232b94 ic_route_ioctl+20
> IAOQ 0xc0283e54 all_requests+43c

So I spent most of last week setting up an x86 build machine
only to find the kernels built on the "i386-linux" host
die in the same way. Something is wrong with build env.
I just be me. But maybe not.  I'll try to find out ASAP.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
