Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA17562
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 04:32:08 -0600
Message-Id: <199906151031.MAA12339@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Tue, 15 Jun 1999 12:31:47 +0200
In-Reply-To: Ulrich.Strelow@schering.de
       "[parisc-linux] Compiling Linux Kernel on HP-UX" (Jun 15, 11:26)
To: Ulrich.Strelow@schering.de, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Compiling Linux Kernel on HP-UX
List-ID: <linux-parisc.vger.kernel.org>

On Jun 15, 11:26, Ulrich.Strelow@schering.de wrote:
>I am running HP-UX 10.20, so I cannot use the depots from
>ftp://puffin.external.hp.com/pub/parisc/binaries/depot/.
>So the question is: do I need gcc 2.8.1 and binutils 2.9.1 to build the
>kernel on HP-UX or is this some other error ?

I'm pretty sure you need the hacked egcs and binutils.  You can check them 
out of cvs from the same place as the kernel (I use them for cross-compiling 
though).

-Tor
