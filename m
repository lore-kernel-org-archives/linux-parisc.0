Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly3.hia.nrc.ca (hiauly3.hia.nrc.ca [132.246.100.195])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AE4F4877
	for <parisc-linux@lists.parisc-linux.org>; Fri, 29 Aug 2003 16:44:10 -0600 (MDT)
From: John David Anglin <dave@hiauly3.hia.nrc.ca>
Message-Id: <200308292244.SAA29829@hiauly3.hia.nrc.ca>
To: dave@hiauly3.hia.nrc.ca
Date: Fri, 29 Aug 2003 18:44:03 -0400 (EDT)
Cc: carlos@baldric.uwo.ca, randolph@tausq.org,
	dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200308292203.SAA03224@hiauly3.hia.nrc.ca> from John David Anglin at Aug "29," 2003 "06:03:00" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: [glibc] tststatic failues, reduced to simple testcase.
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

> > __asm(
> > 0x4000883c:     be,l 100(sr2,r0),%sr0,%r31
> > 0x40008840:     ldi 2,r20                    !! FORK !!
> > );
> > 0x40008844:     ldi -1000,r20 <--Corrupted--- r19 = 0x10106368

Looking at the kernel syscall code, it seems at first glance that
r19 is saved and restored.  Thus, the problem may be specific to fork.

Dave
