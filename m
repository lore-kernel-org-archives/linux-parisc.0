Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37023482A
	for <parisc-linux@parisc-linux.org>; Sun,  6 May 2001 00:15:08 -0600 (MDT)
Sender: drepper@cygnus.com
To: Matthew Wilcox <matthew@wil.cx>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
References: <20010504220214.I32445@parcelfarce.linux.theplanet.co.uk>
	<200105042131.RAA15852@hiauly1.hia.nrc.ca>
	<20010504223825.J32445@parcelfarce.linux.theplanet.co.uk>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 05 May 2001 23:14:55 -0700
In-Reply-To: Matthew Wilcox's message of "Fri, 4 May 2001 22:38:25 +0100"
Message-ID: <m3d79ngg0w.fsf@otr.mynet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox <matthew@wil.cx> writes:

> On Fri, May 04, 2001 at 05:31:30PM -0400, John David Anglin wrote:
> > Doesn't look like _setjmp comes back at all.  Put a break on ea18
> > and start stepping.  It might help to do a static link.
> 
> this code is in the dynamic linker :-))

And the problem is?  I debug ld.so as a normal program.  The necessary
patches I came up with are in the official gdb for quite some time
now.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
