Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA11792
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 18:54:29 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 21 Nov 2000 01:56:39 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA20824;
	Tue, 21 Nov 2000 12:55:42 +1100
Date: Tue, 21 Nov 2000 12:55:42 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "H . J . Lu" <hjl@valinux.com>
cc: Ulrich Drepper <drepper@redhat.com>,
        GNU C Library <libc-alpha@sourceware.cygnus.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: A DT_INIT/DT_FINI glibc patch.
In-Reply-To: <20001116104537.D24101@valinux.com>
Message-ID: <Pine.LNX.4.21.0011211243360.15623-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 16 Nov 2000, H . J . Lu wrote:

> While we are on this subject, I looked at the hppa code. It seems to
> have the same bug. I have an impression that HP never really used
> DT_INIT/DT_FINI. They use DT_INIT_ARRAY/DT_FINI_ARRAY. I don't know
> if we should fix hppa also.

Yes to all of these comments.  elf32-hppa stole some ideas from ia64,
which is why the bug is common.

Fortunately, I think hppa ld.so etc. can be fixed in a way such that
current (broken ABI) binaries will still work.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
