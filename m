From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: vfork test case.
Date: Sun, 20 Jun 2010 00:28:14 -0400 (EDT)
Message-ID: <20100620042814.ECC205160@hiauly1.hia.nrc.ca>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com> from "Carlos O'Donell" at Dec 6, 2009 04:19:13 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos,

> I have constructed a vfork test case which shows some of the problems
> I have using vfork reliably. This fails every time on my PA8700 system
> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
> being corrupted.

It seems the vfork implementation has changed in 2.11.1 from
using clone to the vfork syscall.  I tried to build gdb head
today, but it dies at startup due to a problem with vfork.  This
is potentially also an issue with gcc as it uses the same
libiberty code.

I filed a sourceware bug, but closed it when I realized that
this is a glibc/kernel bug:
http://sourceware.org/bugzilla/show_bug.cgi?id=11730

After spending some time looking at this, I realized that __vfork
is broken.  It should not allocate a frame as the child may clobber
the parent's frame when it does a call, etc.  A frame should only
be allocated and popped around the call to the syscall error handler.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
