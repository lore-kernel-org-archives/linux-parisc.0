Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA11193
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 19:00:03 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 13 Sep 2000 01:00:26 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA26566;
	Wed, 13 Sep 2000 11:59:28 +1100
Date: Wed, 13 Sep 2000 11:59:28 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userspace function pointers in the kernel
In-Reply-To: <873dj5mfmb.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0009131156110.23150-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 12 Sep 2000, David Huggins-Daines wrote:

> Obviously that's wrong :-)
> 
> DYNAMIC RELOCATION RECORDS
> OFFSET   TYPE              VALUE 
> 00002bf8 R_PARISC_IPLT     *ABS*+0x00001270
> 00002bd8 R_PARISC_IPLT     __libc_start_main
> 00002be0 R_PARISC_IPLT     printf
> 00002c00 R_PARISC_IPLT     *ABS*+0x000019b4
> 00000000 R_PARISC_NONE     *ABS*
> 00000000 R_PARISC_NONE     *ABS*

Yeah, _any_ occurrence of a R_PARISC_NONE reloc indicates a linker bug.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
