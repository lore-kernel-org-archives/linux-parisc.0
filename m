Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07149482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Aug 2003 14:41:42 -0600 (MDT)
Message-Id: <200308112041.h7BKfemX020838@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 11 Aug 2003 16:41:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030811202103.GH20106@systemhalted> from "Carlos O'Donell" at Aug 11, 2003 04:21:03 pm
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

> On Mon, Aug 11, 2003 at 03:25:47PM -0400, John David Anglin wrote:
> > > What's interesting is the "ld" command has "-lgcc-eh" which is where
> > > the missing symbols are defined:
> > > grundler <512>nm libgcc_eh.a | grep _Unwind_SjLj_Resume
> > > 0000079c T _Unwind_SjLj_Resume
> > > 000008d0 T _Unwind_SjLj_Resume_or_Rethrow
> > > grundler <513>pwd
> > > /usr/lib/gcc-lib/hppa-linux/3.3.1
> > 
> > Yes, but libgcc_eh.a doesn't contain the versioned symbols that the shared
> > libraries need.
> 
> Are we not using libgcc_eh to resolve such symbols in libgcc and libc?

Not for versioned symbols.  For that, you need to link with libgcc_s.so
(i.e., the shared version of libgcc).  The g++ driver does this automatically.
You can also add `-shared-libcc' to your link command when using the gcc
driver.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
