Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA05051
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Sep 2000 18:25:53 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 14 Sep 2000 00:26:15 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA31950;
	Thu, 14 Sep 2000 11:22:10 +1100
Date: Thu, 14 Sep 2000 11:22:10 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Cary Coutant <cary@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: Function descriptors, etc. (was Re: [parisc-linux] userspace
 function pointers in the kernel)
In-Reply-To: <878zswj6d1.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0009141031480.30310-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 13 Sep 2000, David Huggins-Daines wrote:

> Reasons why the IA-64 scheme is better:
>[snip]

Hrmm, you've clearly had more time than I thinking about dynamic linker
issues.  :-)  My scheme of having the linker allocate space for the ld.so
structures necessary to generate unique function pointers can still
work;  It's just that plabels need a full struct hppa_fptr in addition
to our normal plt slot, rather than the measely single word I gave you.
This could have been accomplished simply by changing PLABEL_PLT_ENTRY_SIZE
to 20, and then ld.so wouldn't need those extra mmaps.

However, I guess we should go with what you have David - the time saved by
having the linker allocate space isn't huge, and in fact we might not even
need to mmap since ld.so has 256 fptr slots pre-allocated.

I just ran the following, and found libc.so only needs 63 global fptrs.

readelf -r libc.so | grep PLABEL \
| sed -e 's/.*R_PARISC/R_PARISC/' -e '/PLABEL      /d' -e 's/ *+.*//' \
| sort | uniq

Alan
-- 
Linuxcare.  Support for the Revolution.
