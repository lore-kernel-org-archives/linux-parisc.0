Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA08059
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Sep 2000 08:26:00 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 26 Sep 2000 14:26:46 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Lazy linking issues
References: <Pine.LNX.4.21.0009270114210.10967-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 26 Sep 2000 10:26:37 -0400
In-Reply-To: Alan Modra's message of "Wed, 27 Sep 2000 01:21:24 +1100 (EST)"
Message-ID: <87em27kz4y.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> On Tue, 26 Sep 2000, Alan Modra wrote:
> 
> > Code at the start of the .plt looks like:
> > 	b,l	1f,%r26
> > 	depi	0,31,2,%r26
> > 1:	addil	LD'_GLOBAL_OFFSET_TABLE_ + 8 - ($PIC_pcrel$0 - 8),%r26
> > 	ldwm	RD'_GLOBAL_OFFSET_TABLE_ + 8 - ($PIC_pcrel$0 - 12)(%r1),%r26
> > 	copy	%r19,%r25
> > 	ldw	4(%r1),%r19
> > 	bv	%r0(%r26)
> > 	ldw	-4(%r1),%r26
> 
> That's all a bit silly.  How come no-one noticed and told me how foolish 
> I am?  We can't trash the arg registers willy-nilly.

Probably because I was asleep :)

> I'm going for a stub at the end of the .plt, with .plt and .got guaranteed
> to be glued together.  The fixup fptr will be immediately after the stub
> at the end of the .plt, ie. at got[-2] istead of got[2].

Okay.  I suppose I will take the same approach as the Alpha code does,
and look for a particular instruction at the end of the GOT in
elf_machine_runtime_setup() as an indication of whether lazy linking
can be done or not.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
