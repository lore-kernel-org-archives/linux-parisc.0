Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA00964
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 16:27:21 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 3 Oct 2000 22:28:17 -0000
To: drepper@cygnus.com (Ulrich Drepper)
Cc: parisc-linux@thepuffingroup.com, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] glibc 2.1.94 CVS merge, packages on the way, ABI breakage :(
References: <87aecl60mf.fsf@linuxcare.com>
	<m3ya05d0nh.fsf@otr.mynet.cygnus.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 03 Oct 2000 18:28:07 -0400
Message-ID: <87u2at4l1k.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ulrich Drepper <drepper@redhat.com> writes:

> You never should have GLIBC_2.0 symbols.  The shlib-versions file
> should have GLIBC_2.2 as the earliest version (third column).

Ah, I see what the problem is.  It seems that it is my fault :(

I take it that libc.so, libm.so, and ld.so should all be versioned
with GLIBC_2.2 as the base, then?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
