Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA07728
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 08:20:48 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Sep 2000 14:21:32 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA30207;
	Wed, 27 Sep 2000 01:21:24 +1100
Date: Wed, 27 Sep 2000 01:21:24 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: Lazy linking issues
In-Reply-To: <Pine.LNX.4.21.0009261648260.10967-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0009270114210.10967-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 26 Sep 2000, Alan Modra wrote:

> Code at the start of the .plt looks like:
> 	b,l	1f,%r26
> 	depi	0,31,2,%r26
> 1:	addil	LD'_GLOBAL_OFFSET_TABLE_ + 8 - ($PIC_pcrel$0 - 8),%r26
> 	ldwm	RD'_GLOBAL_OFFSET_TABLE_ + 8 - ($PIC_pcrel$0 - 12)(%r1),%r26
> 	copy	%r19,%r25
> 	ldw	4(%r1),%r19
> 	bv	%r0(%r26)
> 	ldw	-4(%r1),%r26

That's all a bit silly.  How come no-one noticed and told me how foolish 
I am?  We can't trash the arg registers willy-nilly.

I'm going for a stub at the end of the .plt, with .plt and .got guaranteed
to be glued together.  The fixup fptr will be immediately after the stub
at the end of the .plt, ie. at got[-2] istead of got[2].

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
