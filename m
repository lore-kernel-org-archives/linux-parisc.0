Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA00441
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 16:23:36 -0600
Sender: drepper@cygnus.com
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] glibc 2.1.94 CVS merge, packages on the way, ABI breakage :(
References: <87aecl60mf.fsf@linuxcare.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 03 Oct 2000 15:23:46 -0700
In-Reply-To: David Huggins-Daines's message of "03 Oct 2000 18:06:16 -0400"
Message-ID: <m3ya05d0nh.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> But!  Beware!  It *will* break your system.  Somehow, the versions of
> a bunch of symbols in libm.so.6 reverted to GLIBC_2.0 from GLIBC_2.2

You never should have GLIBC_2.0 symbols.  The shlib-versions file
should have GLIBC_2.2 as the earliest version (third column).

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
