Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA12245
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 01:36:40 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 12 Aug 2000 01:36:54 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA10001;
	Sat, 12 Aug 2000 11:35:45 +1000
Date: Sat, 12 Aug 2000 11:35:44 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r
In-Reply-To: <Pine.LNX.4.21.0008121017001.7133-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0008121042020.7133-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 12 Aug 2000, Alan Modra wrote:

> On 11 Aug 2000, David Huggins-Daines wrote:
> 
> > Here's an (ugly) patch that works.  Please verify that the last chunk
> 
> Looks OK to me.

I'll install a slightly modified version of your patch.  The other PLABEL
relocs should be handled as for PLABEL32, not that it matters for gcc
output as I've never caught gcc generating code that used PLABEL14R and
PLABEL21L.  A pity, because current gcc PIC code for handling function
pointers is rather inefficient.  Typically, you get something like:

.LC1:
        .word P'bar
.
.
        addil LT'.LC1,%r19
        ldw RT'.LC1(%r1),%r22
        ldw 0(%r22),%r22

which could all be replaced with

	ldil LP'bar,%r22
	ldo RP'bar(%r22),%r22

saving on code size, memory accesses, and relocs.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
