Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64E7C4845
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Oct 2003 13:22:40 -0600 (MDT)
Date: Sun, 5 Oct 2003 20:22:20 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <soete.joel@tiscali.be>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] traps.c 2.4 alignement [was: 2.6.0-test6-pa6 on
 b2k finaly crash]
In-Reply-To: <3F804FC9.9040401@tiscali.be>
Message-ID: <Pine.LNX.4.58.0310052018520.24439@sal.ucc.ie>
References: <3F5CB6FB0000CBFC@ocpmta1.freegates.net> <3F803388.5090304@tiscali.be>
 <3F804FC9.9040401@tiscali.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 5 Oct 2003, Joel Soete wrote:

> Joel Soete wrote:
>
> > I test it successfully on my c110 but if you have some opportunity to
> > double check and may be also ci, that would be nice.

I've compiled 2.6.0-test6-pa6 with your patches, but I can't reboot
the machine into 2.6 right now since it's being used by my housemates ;)

> hmm don't think if it's related but just in case:
> I was just copying my kernel tree with 'tar cslpf -
> linux-2.6.0-test6-pa6 | ( cd Work ; tar xslpf -)' when
>
> Kernel panic: drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O M.
> In interrupt handler - not syncing
>
> ?
>
> I just retry same operation on the same system with same kernel but
> doesn't occurs a second time?

When I have the opportunity I'll fire up 2.6 (with you patches) and test
it with high I/O load (if it even boots up).

I'll let you know whether I can boot with serial console enabled and
whether I also have the same kernel panic when doing heavy I/O.


greetings,
  Max
