Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cygnus.com (runyon.cygnus.com [205.180.230.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FE2E4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 23:27:37 -0700 (MST)
Sender: drepper@cygnus.com
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: Christoph Plattner <christoph.plattner@alcatel.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile  system
References: <Pine.LNX.4.21.0102091056000.9776-100000@front.linuxcare.com.au>
	<3A8FA3D8.19E69EF6@dot.at> <3A94C3B5.EF59259C@neuronet.pitt.edu>
	<3A94CEF9.F171DE3F@alcatel.at> <3A974D1F.3BBB87C8@neuronet.pitt.edu>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 23 Feb 2001 22:26:58 -0800
In-Reply-To: "Rafael E. Herrera"'s message of "Sat, 24 Feb 2001 00:56:47 -0500"
Message-ID: <m3wvagiojx.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Rafael E. Herrera" <raffo@neuronet.pitt.edu> writes:

> I rebooted with the second nfsroot and got a login prompt. However, I
> can't run ldconfig again and I get this error msg.:
> 
> parisc:/etc# ldconfig -v       
> ldconfig: Can't open configuration file
> /usr1/users/raffo/parisk/palinux/hppa-linux/etc/ld.so.conf: No such file
> or directory

This is no error message, it's warning.

> /usr1/users/raffo/parisk/palinux/hppa-linux/lib:
> ldconfig: Can't open directory
> /usr1/users/raffo/parisk/palinux/hppa-linux/lib: No such file or
> directory

This happens if you build glibc with a prefix and then install it
somewhere else.  This cannot work.


I really don't understand who came up with these "strange" build
instructions.  For Linux builds of glibc where the result is actually
used in the normal place (means in /lib and /usr/lib) you *always*
have to configure with --prefix=/usr.  While installing it one than
can use the install_root make variable.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
