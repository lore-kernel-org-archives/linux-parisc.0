Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mr14.vic-remote.bigpond.net.au (mr14.vic-remote.bigpond.net.au [24.192.1.29])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AAF54A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 00:57:25 -0700 (MST)
From: penfold@customware.com.au
Message-Id: <200102050757.SAA05996@customware.com.au>
Subject: Re: [parisc-linux] HP9000/730 problems
To: xam@deathsdoor.com (M. Grabert)
Date: Mon, 5 Feb 2001 18:56:00 +1100 (EST)
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0102050015450.385-100000@sgate.charlysworld.de> from "M. Grabert" at Feb 05, 2001 12:29:27 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> 
> Hello there,
> 
> i'm still trying running linux on hppa :-/
> 
> VFS: Mounted root (nfs filesystem) readonly
> 
> handle_interruption() pid=1 command='init'
>
you need to edit /usr/src/linux/arch/parisc/kernel/traps.c
around line 574 you will see case 15 and case 26 - add case 18.

        case 15:
        case 18:
        case 26:
 
> 
> BTW, ASP Parallel Port driver is still broken (can't boot with it,
> but can boot without it).
> 
yup!

Damian
penfold@customware.com.au
