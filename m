Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C0BA4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jun 2003 14:07:45 -0600 (MDT)
Message-Id: <200306162007.h5GK7dmQ006315@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.5.71-pa1 do_sigaction problem
To: willy@debian.org (Matthew Wilcox)
Date: Mon, 16 Jun 2003 16:07:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bzeeb-lists@lists.zabbadoz.net,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030616192747.GD30843@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jun 16, 2003 08:27:47 pm
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

> another is that most people are still on gcc-3.0.  indeed, gcc-3.2 and
> later are not suitable for generating a kernel since it does not respect
> the __aligned__ attribute on stack allocations.

Actually, I don't believe gcc has ever respected the __aligned__ attribute
on stack allocations.  It silently ignores it, which causes a lot of
confusion.  The difference is that debian gcc-3.0 has BIGGEST_ALIGNMENT
set to 128 while it is 64 in 3.2 and later.  BIGGEST_ALIGNMENT is used for
the alignment of structures allocated on the stack.  It is the maximum
alignment needed for any type.  So, in practice, it is set by the alignment
needed for long doubles.  This is specified to be 64 bits in the 32-bit
hpux runtime as there are no quad-precision load and store instructions.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
