Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30415482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Oct 2002 20:24:28 -0600 (MDT)
Message-Id: <200210160224.g9G2OO0I004733@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] possible gcc-3.2 bug?
To: tausq@debian.org
Date: Tue, 15 Oct 2002 22:24:23 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021016013231.GS5602@tausq.org> from "Randolph Chung" at Oct 15, 2002 06:32:31 pm
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

> well, it's doesn't seem to be very consistent about it then...
> 
> static rwlock_t x = (rwlock_t) { { 1 }, 0 };
> is ok
> 
> static rwlock_t x = { (spinlock_t) { 1 }, 0 };
> is also ok
> 
> only when you have both casts does it fail...

Ok, I think I see what is going on.  "(rwlock_t) { { 1 }, 0 }" is
a compound literal (constructor expression).  GCC allows initialization
of static objects by compound literals.  This is not possible in ISO C99.

The initializer list of the compound literal must be constant.  Thus,
nesting of compound literals isn't possible.  So, when you have two
casts in the initializer you get the error.  For more info, look at
extend.texi.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
