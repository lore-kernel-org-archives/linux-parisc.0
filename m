Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA19193
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 10:42:20 -0600
Message-Id: <199906151641.KAA02170@bumbles.sde.hp.com>
To: Ulrich.Strelow@schering.de
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Compiling Linux Kernel on HP-UX 
In-reply-to: Your message of "Tue, 15 Jun 1999 12:22:46 +0200."
             <C1256791.00392418.00@BE2314.schering.de>
Date: Tue, 15 Jun 1999 10:41:55 -0600
From: Andrew Patterson <andrew@bumbles.sde.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Ulrich,

You can get HP-UX 10.20 binaries at http://hpux.cae.wisc.edu They have
gcc 2.8.1.  They also have many other Open Source packages.

Andrew

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Andrew Patterson                          Voice:  (970) 898-3261
   Hewlett-Packard Company                   FAX:    (970) 898-2180
   Development Solutions Lab                 email: andrew@fc.hp.com
   3404 East Harmony Road / MS 7
   Fort Collins, Colorado  80525  



> 
> 
> Hi,
> 
> I'm trying to compile the latest CVS-snapshot (19990615) on my HP 715/33
> using gcc 2.7.2.2 and binutils 2.7. Compiling kernel/sched.c gives the
> following error:
> 
> sched.c:579: section attributes are not supported for this target
> 
> I am running HP-UX 10.20, so I cannot use the depots from
> ftp://puffin.external.hp.com/pub/parisc/binaries/depot/.
> So the question is: do I need gcc 2.8.1 and binutils 2.9.1 to build the
> kernel on HP-UX or is this some other error ?
> 
> Ulrich
> ---------------------------------------------
> Ulrich Strelow
> <ulrich.strelow@schering.de or
> ulrich_strelow@csi.com>
> Berlin, Germany
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
