Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.sonytel.be (mail2.sonytel.be [195.0.45.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA451482A
	for <parisc-linux@parisc-linux.org>; Fri, 31 Jan 2003 10:44:53 -0700 (MST)
Date: Fri, 31 Jan 2003 18:43:16 +0100 (MET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Tom Rini <trini@kernel.crashing.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	parisc-linux@parisc-linux.org,
	Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>
In-Reply-To: <20030130180315.GA14768@ip68-0-152-218.tc.ph.cox.net>
Message-ID: <Pine.GSO.4.21.0301311838270.10634-100000@vervain.sonytel.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: Generic RTC driver in 2.4.x
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

On Thu, 30 Jan 2003, Tom Rini wrote:
> On Fri, Jan 10, 2003 at 09:05:55PM +0100, Geert Uytterhoeven wrote:
> > Unfortunately I didn't receive any feedback from the pa-risc and ppc people
> > after my previous posting last Sunday.
> [snip]
> > Pa-risc and ppc people (any other users?), please send me your enhancements (or
> > just ack if none are necessary), so I can send genrtc to Marcelo.
> 
> Sorry I haven't spoken up before this, A simple cp of
> include/asm-ppc/rtc.h (and then throwing the question
> someplace) compiles a kernel correctly, and from what I recall of
> getting it to work in 2.5, at that point it was all good anyhow.  So
> this is fine for PPC32 as is.

Note that in the mean time genrtc has changed, so I'd prefer you to at least
sent me your include/asm-ppc/rtc.h and a patch to add the question on PPC,
_after_ you have test-compiled the latest version. I'll send it to you in a
separate mail.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
