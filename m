Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74FEE482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Feb 2003 08:57:49 -0700 (MST)
Date: Mon, 17 Feb 2003 10:57:53 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Cc: James Bottomley <jejb@dsl2.external.hp.com>
Message-ID: <20030217155753.GD3061@systemhalted>
References: <20030216181021.6A8514829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030216181021.6A8514829@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 jejb
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

> CVSROOT:	/var/cvs
> Module name:	linux-2.5
> Changes by:	jejb	03/02/16 11:10:21
> 
> Modified files:
> 	arch/parisc/kernel: signal.c sys32.h 
> 	include/asm-parisc: signal.h 
> 
> Log message:
> More signal change fixes

Thanks for all the great work James!

Just to comment on this, we have incorrect sigcontext's from 64-bit kernels.
If you look at the usage of "HACK" you'll see that the 32-bit userspace 
gets some rather unusable 64-bit values in the sigcontext. I'm not sure how 
other arches fix this? Cut off the top 32 bits?

This item is on my personal todo list, but I haven't talked to anyone who has 
suggested a solution. I'm just a lowly GNU/Libc hacker, but if you suggest 
something I _will_ write it. 

c.
