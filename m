Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B191B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 07:27:49 -0700 (MST)
Message-Id: <200303251427.h2PERXxE029413@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Glibc 2.3.2 failures and possible fixes?
To: willy@debian.org (Matthew Wilcox)
Date: Tue, 25 Mar 2003 09:27:33 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, dave.anglin@nrc-cnrc.gc.ca,
	tausq@debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030324220130.GP31008@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Mar 24, 2003 10:01:30 pm
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

> I think this is the mismatch in sizeof(long double) problem again.

I noticed that a couple of libstdc++ tests that used to fail because
of the long double mismatch are fixed with 2.3.1-14 :)

> > elf/vismain.out
> > elf/neededtest.out
> > elf/neededtest2.out
> > elf/neededtest3.out
> > elf/neededtest4.out
> > elf/circleload1.out
> > 
> > - These have been around for a while, any idea about how to fix them?
> 
> They've certainly been around since I was hacking on glibc ...

Are you testing with 3.3?  Some elf tests in the binutils suite
were failing because of the need to canonicalize function pointers.
There were also some tests that failed because we absolutely need
'-fPIC' for tests with shared libraries.  I'd be interested to know
what's causing these.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
