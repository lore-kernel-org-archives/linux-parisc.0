Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA19002
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Aug 2000 15:23:33 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Aug 2000 15:23:49 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r
References: <Pine.LNX.4.21.0008121042020.7133-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Aug 2000 11:23:35 -0400
In-Reply-To: Alan Modra's message of "Sat, 12 Aug 2000 11:35:44 +1000 (EST)"
Message-ID: <87punemrk8.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> I'll install a slightly modified version of your patch.  The other PLABEL
> relocs should be handled as for PLABEL32, not that it matters for gcc
> output as I've never caught gcc generating code that used PLABEL14R and
> PLABEL21L.  A pity, because current gcc PIC code for handling function
> pointers is rather inefficient.  Typically, you get something like:
> 
> .LC1:
>         .word P'bar
> .
> .
>         addil LT'.LC1,%r19
>         ldw RT'.LC1(%r1),%r22
>         ldw 0(%r22),%r22
> 
> which could all be replaced with
> 
> 	ldil LP'bar,%r22
> 	ldo RP'bar(%r22),%r22
> 
> saving on code size, memory accesses, and relocs.

Interesting.  It would be trivial to hack that into GCC, I just wonder
if there's some good reason it hasn't been done before.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
