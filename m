Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA16655
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 07:41:51 -0600
Message-Id: <199909221342.GAA27508@milano.cup.hp.com>
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problems 
In-reply-to: Your message of "Wed, 22 Sep 1999 14:48:17 PDT."
             <Pine.HPX.4.05.9909221438440.2148-100000@gamgee.ntc.nokia.com>
Date: Wed, 22 Sep 1999 06:42:43 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hannu Martikka wrote:
> Hei!
> 
> 
> With 715/80 I get following:
> 
> Boot
> :disk(....)/stand/vmlinux
> 

Hannu/Goodi,
You didn't get any messages about a bad address here?

Dumping the GRs/CRs/SRs suggests a SW fault which can't be
handled...but the linux kernel needs to learn how to dump
more useful information.

BTW, those "<bunch of HEX-values>" mean something to various
people on the list. If you can collect (and post) all output
via serial console starting with the "Boot" message, others
on this list might be able to help.

> GRs
> 
> 0x00000000
> ...
> 	<bunch of HEX-values>
> CRs
> 
> 	<bunch of HEX-values>
> SRs
> 
> 	<bunch of HEX-values>
> OTHER
> 
> 	<bunch of HEX-values>
> 
> and then nothing...
> It should be plain 715 but I have addon X.25 card on this machine (EISA?)

I think the EISA is ignored for now...

grant

> 
> - Goodi
> "The linuX Files -- The Source is Out There."
> ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
