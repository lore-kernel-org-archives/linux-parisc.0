Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6CF3F482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 14:18:23 -0700 (MST)
Message-Id: <200211172114.gAHLEUlf018244@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [2.5] next issues ...
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Sun, 17 Nov 2002 16:14:30 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.44.0211171256290.39295-100000@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at Nov 17, 2002 01:16:51 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> had 2.5.47-pa3 compiled with 3.0.4 up ad running
> Linux version 2.5.47-pa3 (bz@apollo) (gcc version 3.0.4) #8 Fri Nov 15 23:38:21 UTC 2002
> 
> but had trouble with unaligned page access:
> --- 8< 8< 8< ---
> bz@apollo:~> sshd(315): unaligned access to 0x0006fe7b at ip=0x00020eaf
> sshd(315): unaligned access to 0x0006feaf at ip=0x00020eb3

It should be relatively simple to determine what is causing these.
Use objdump or gdb to disassemble the code at the above locations.
The two least-significant bits in the ip addresses should be zeroed
when you do this.

I doubt this is actually a gcc problem but it might be.  I have been
running sshd built with gcc under hpux for years and have built the
latest version with 3.3.  HPUX doesn't have an unaligned trap handler
so the code would just seg fault if the same problem occurred there.

> bz@apollo:~>
> bz@apollo:~> dmesg
> ommand='sshd' type=6 address=0xed0e6013
> vm_start = 0x402b9000, vm_end = 0x402bc000

This is an insn TLB miss fault, so either sshd has branched to
never-never-land or there is a system problem in the management
of the page tables.  In either case, this will be very hard to
debug.  You might get somewhere running sshd under gdb if the
problem is in userland.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
