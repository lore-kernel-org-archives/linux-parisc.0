Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA00883
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 15:36:53 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by atlrel1.hp.com (Postfix) with ESMTP id 6AD1C1BB6
	for <parisc-linux@thepuffingroup.com>; Thu,  2 Mar 2000 16:37:50 -0500 (EST)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ELF32 kernel 
In-reply-to: Your message of "Wed, 01 Mar 2000 16:35:14 MST."
             <E12QIeA-0002KV-00@endor.fc.hp.com>
Date: Thu, 02 Mar 2000 14:37:49 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12QdI5-0004IM-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= There's a problem when I enable CONFIG_PROC_FS where devinet_init()
= calls register_sysctl_table() with a ctl_table containing a char*
= pointer (for ->procname) containing the value 0x20, which eventually
= dies in strlen() at a lower level.

Actually CONFIG_PROC_FS works, but CONFIG_SYSCTL doesn't, for the
reason above, so I changed defconfig to reflect this.

I tracked the problem down to what appears to be a compiler
bug, in that the devinet_sysctl_table struct in net/ipv4/devinet.c
works well until you try to generate a pointer to the last 'ctl_table'
element inside that struct.  This pointer value is bogus, leading to
the misbehavior described above.  I can make the problem move around
by inserting fields in the struct, so it appears that gcc can't generate
valid pointers to members past a certain struct size.

This could also be a difficulty for SOM folks who use the compiler
from CVS on puffin.external.hp.com and who configure kernels including
networking.

I'm out of my depth hacking gcc.

	-Paul Bame
