Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02005
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 16:42:18 -0600
Sender: drepper@cygnus.com
To: David Huggins-Daines <dhd@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] glibc 2.1.94 CVS merge, packages on the way, ABI breakage :(
References: <87aecl60mf.fsf@linuxcare.com>
	<m3ya05d0nh.fsf@otr.mynet.cygnus.com> <87u2at4l1k.fsf@linuxcare.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 03 Oct 2000 15:42:35 -0700
In-Reply-To: David Huggins-Daines's message of "03 Oct 2000 18:28:07 -0400"
Message-ID: <m3pulhczs4.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> I take it that libc.so, libm.so, and ld.so should all be versioned
> with GLIBC_2.2 as the base, then?

Every single DSO.  There is no compatibility to be preserved.

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
