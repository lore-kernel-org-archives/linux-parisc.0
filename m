Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA25871
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Mar 2000 19:34:40 -0700
Message-Id: <200003100137.RAA09015@milano.cup.hp.com>
To: Nick Cabatoff <ncc@cs.mcgill.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation 
In-reply-to: Your message of "Thu, 09 Mar 2000 19:35:35 PST."
             <20000309193535.C3423@cs.mcgill.ca>
Date: Thu, 09 Mar 2000 17:37:32 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Nick Cabatoff wrote:
> (I sent this to Alex deVries and didn't get a response, so I figured I'd
> give this list a try instead.)

Poor Alex is pretty busy right now...

> I'm interested in the possibility of doing a linux module to mount HFS
> filesystems (read-only would satisfy me I think, and is a reasonable
> target.)  
> 
> I realize that the port is still in its very early stages, so
> I intend to develop the module on the i386 platform and then worry
> about getting it working on pa-risc.

Should work.

> 
> I'm hoping you can tell me
> 
> - if anyone else is already working on this

I didn't see it listed on:
	http://www.thepuffingroup.com/parisc/status.html
> 
> - if you think the man pages and the white paper might be insufficient
>   for the implementation; they look adequate to me, but I've never
>   written a file-system driver before

no clue. But someone has taken a look at this before and
concluded it was do-able. And you might check if other open
source parisc ports have already done it (eg OpenBSD or mklinux).

As a side note, don't confused HP's HFS with Apple's.
I'm not sure of what to call HP's since Apple HFS support was first.
Perhaps the other ports have set precedence for this.

> - if you think it's worth the effort, given that I expect HP-UX systems
>   are using LVM now and I don't feel up to the task of trying to handle
>   that

Yes. Most older workstations use HFS on wholedisk. HFS can be used
on disks > 4GB without LVM. I avoid LVM whenever I can. It's easier
to physically move disks from one host to another without LVM.
I only use LVM when the boot file system is on a disk > 2GB.


thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
