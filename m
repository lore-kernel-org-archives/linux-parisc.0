Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id B18C64A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 01:04:43 -0700 (MST)
Sender: drepper@cygnus.com
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile system
References: <Pine.LNX.4.21.0102241814320.9315-100000@front.linuxcare.com.au>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 24 Feb 2001 00:04:10 -0800
In-Reply-To: Alan Modra's message of "Sat, 24 Feb 2001 18:53:25 +1100 (EST)"
Message-ID: <m3elwoik1x.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

>   The "strange" build instructions come from people trying to use glibc
> built for a cross-compiling environment, in a native environment too.

I've done this more often myself than all the people here together and
never did something like this.

> Oh, and for the benefit of the list, Ulrich is talking about native
> builds.  This ought to be obvious, but _DO NOT_ build glibc for a
> cross-compiling environment with --prefix=/usr.

Of course you do.  If the library is later used in /usr you have to do
this.  Don't put words in my mouth I didn't say.

> If you install it, you'll blow away your system libs.  hppa-linux
> libraries tend to not run very well on x86.

No, you're not.  This is what the install_root variable is for.  If
you want to be sure you are not doing something stupid don't run `make
install' as root, simply make the directories below that pointed to by
install_root writable for yourself.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
