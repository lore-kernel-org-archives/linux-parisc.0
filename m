Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB64C4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Feb 2003 21:06:19 -0700 (MST)
Message-Id: <200302090406.h1946HYm013426@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sat, 8 Feb 2003 23:06:16 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: willy@debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030209032705.GE19683@dsl2.external.hp.com> from "Grant Grundler" at Feb 8, 2003 08:27:05 pm
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

> > If you change the above to
> > 
> >   __asm__ __volatile__ ("stw,ma  %%sp,0(%0)" : : "r" (x) : "memory")
> > 
> > it should work on both PA11 and PA20.  The ordered completer is only
> > PA 2.
> 
> Excellent idea.

The reason I am so up on this is that in testing gcc 3.4 on hppa1.1 this
weekend I found a problem with the locking code in atomicity.h.  This
was the 16-byte alignment issue.  In reviewing the assembly code being
generated, I revisited how the lock reset was done and came up with the
above.

This is also relevant to locking in glibc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
