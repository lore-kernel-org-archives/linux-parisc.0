Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 128364A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 01:44:13 -0700 (MST)
Sender: drepper@cygnus.com
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile system
References: <Pine.LNX.4.21.0102241906140.9315-100000@front.linuxcare.com.au>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 24 Feb 2001 00:43:49 -0800
In-Reply-To: Alan Modra's message of "Sat, 24 Feb 2001 19:21:01 +1100 (EST)"
Message-ID: <m38zmwii7u.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> If binutils and gcc are built with --build=i686-linux --host=i686-linux
> --target=hppa-linux --prefix=/usr, then it's correct to build glibc with
> --build=i686-linux --host=hppa-linux --prefix=/usr/hppa-linux because then
> "make install" will put glibc in the correct place for the cross tools.

Then how comes people install these binaries?  And even if not
installing, you possibly link against libc.a and get completely wrong
code.  This is not how you do it.

> Building glibc with --prefix=/usr then "make install_root=/usr/hppa-linux"
> doesn't put glibc in directories searched by the cross tools.

Then add the appropriate -L and -I.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
