Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D6704845
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Oct 2003 11:07:28 -0600 (MDT)
Message-ID: <3F804FC9.9040401@tiscali.be>
Date: Sun, 05 Oct 2003 17:07:21 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	"M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] traps.c 2.4 alignement [was: 2.6.0-test6-pa6 on
 b2k finaly crash]
References: <3F5CB6FB0000CBFC@ocpmta1.freegates.net> <3F803388.5090304@tiscali.be>
In-Reply-To: <3F803388.5090304@tiscali.be>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Joel Soete wrote:

> I test it successfully on my c110 but if you have some opportunity to 
> double check and may be also ci, that would be nice.

hmm don't think if it's related but just in case:
I was just copying my kernel tree with 'tar cslpf - 
linux-2.6.0-test6-pa6 | ( cd Work ; tar xslpf -)' when

Kernel panic: drivers/parisc/ccio-dma.c: ccio_alloc_range() I/O M.
In interrupt handler - not syncing

?

I just retry same operation on the same system with same kernel but 
doesn't occurs a second time?

Thanks in advance,
    Joel
