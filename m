Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA18982
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 09:26:39 -0600
Date: Wed, 22 Sep 1999 18:18:49 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/80 problems 
In-Reply-To: <199909221342.GAA27508@milano.cup.hp.com>
Message-ID: <Pine.HPX.4.05.9909221816030.1697-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 22 Sep 1999, Grant Grundler wrote:

> Hannu Martikka wrote:
> > Hei!
> > With 715/80 I get following:
> > 
> > Boot
> > :disk(....)/stand/vmlinux
> > 
> 
> Hannu/Goodi,
> You didn't get any messages about a bad address here?
Nope. First thing that showed up was "GRs".

> Dumping the GRs/CRs/SRs suggests a SW fault which can't be
> handled...but the linux kernel needs to learn how to dump
> more useful information.
> 
> BTW, those "<bunch of HEX-values>" mean something to various
> people on the list. If you can collect (and post) all output
> via serial console starting with the "Boot" message, others
> on this list might be able to help.
I was using the IPL/HPUX loader to start kernel. Are you still interested?
It now works with tftp/bootp.

> Grant Grundler
> Communications Infrastructure Computer Operations
> +1.408.447.7253
- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
