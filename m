Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (unknown [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with SMTP id 2A999482A
	for <parisc-linux@parisc-linux.org>; Thu, 17 Jan 2002 17:43:00 -0700 (MST)
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] long double
References: <20020118003542.F9221@parcelfarce.linux.theplanet.co.uk>
Reply-To: drepper@redhat.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 17 Jan 2002 16:42:46 -0800
In-Reply-To: <20020118003542.F9221@parcelfarce.linux.theplanet.co.uk>
Message-ID: <m36660a3qx.fsf@myware.mynet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Matthew Wilcox <willy@debian.org> writes:

> (3) Change both gcc and glibc to think that long double is actually
> 128-bits wide.

This is definitely what you should do.  glibc includes now a full set
of 128-bit math functions.  They should be used everywhere the ABI are
not demanding the braindamaged 96-bit format.  Even Alpha, PPC, etc
will change to this when time comes.

> This is almost certainly going to break some packages, and the
> kernel FP support may have to be enhanced to emulate some of the
> opcodes.

Not necessarily.  Look at soft-fp support in glibc.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
