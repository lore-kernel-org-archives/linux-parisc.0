Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C63D7489C
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 12:18:08 -0600 (MDT)
Message-Id: <200207151818.g6FII1Lq025501@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
To: willy@debian.org (Matthew Wilcox)
Date: Mon, 15 Jul 2002 14:18:01 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, joel.soete@freebel.net,
	parisc-linux@parisc-linux.org
In-Reply-To: <20020715184320.R27706@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jul 15, 2002 06:43:20 pm
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

> the problem is that the PA ABI specifies that quantities shall be
> `naturally' aligned, even 64-bit quantities on 32-bit machines.  so the
> kernel is expecting to see:
> 
> 	fd (32 bits)
> 	buf (32 bits)
> 	count (32 bits)
> 	(empty)
> 	pos (64 bits)
> 
> what it _actually_ gets (because glibc is hideously broken, IMO):
> 
> 	fd
> 	buf
> 	count
> 	(pos >> 32)
> 	pos & 0xffffffff

It's probably a whole lot easier to fix glibc than change gcc.

> is there any chance of having a flag (or maybe an __attribute__ that
> we could #define asmlinkage to?) which would change the ABI to be more
> compressed like all the other architectures?

I think this is basically a bad idea as it will have a whole lot
of nasty side effects.  How will gdb know which ABI, varargs, etc?

You would need to use a compiler switch and modify
FUNCTION_ARG_PARTIAL_NREGS and FUNCTION_ARG appropriately.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
