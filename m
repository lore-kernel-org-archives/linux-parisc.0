Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15C584829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Feb 2003 09:30:49 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id IAA32246
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Feb 2003 08:30:38 -0800
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 jejb
From: James Bottomley <James.Bottomley@steeleye.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030217155753.GD3061@systemhalted>
References: <20030216181021.6A8514829@dsl2.external.hp.com>
	<20030217155753.GD3061@systemhalted>
Content-Type: text/plain
Date: 17 Feb 2003 11:30:33 -0500
Message-Id: <1045499434.1749.27.camel@mulgrave>
Mime-Version: 1.0
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

On Mon, 2003-02-17 at 10:57, Carlos O'Donell wrote:
> > CVSROOT:	/var/cvs
> > Module name:	linux-2.5
> > Changes by:	jejb	03/02/16 11:10:21
> > 
> > Modified files:
> > 	arch/parisc/kernel: signal.c sys32.h 
> > 	include/asm-parisc: signal.h 
> > 
> > Log message:
> > More signal change fixes
> 
> Thanks for all the great work James!

You're welcome, but these were really just compile fixes.

> Just to comment on this, we have incorrect sigcontext's from 64-bit kernels.
> If you look at the usage of "HACK" you'll see that the 32-bit userspace 
> gets some rather unusable 64-bit values in the sigcontext. I'm not sure how 
> other arches fix this? Cut off the top 32 bits?
> 
> This item is on my personal todo list, but I haven't talked to anyone who has 
> suggested a solution. I'm just a lowly GNU/Libc hacker, but if you suggest 
> something I _will_ write it. 

In general, we should probably be relying more on the generic 32/64
compatibility layer recently introduced.  I suspect the best role model
for all of this is sparc64, since that's habitually run as a 64 bit
kernel with (mostly) 32 bit user space.

The HACK thing should continue to work OK as long as PA-RISC has no 64
bit user binary support, though.

James
