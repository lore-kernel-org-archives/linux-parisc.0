Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.sonytel.be (mail2.sonytel.be [195.0.45.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id DEB4E4837
	for <parisc-linux@parisc-linux.org>; Sat, 28 Dec 2002 15:37:44 -0700 (MST)
Date: Sat, 28 Dec 2002 23:37:03 +0100 (MET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Tom Rini <trini@kernel.crashing.org>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC Development <linuxppc-dev@lists.linuxppc.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
Subject: Re: [parisc-linux] Generic RTC driver in 2.4.x?
In-Reply-To: <20021226175529.GB6867@opus.bloom.county>
Message-ID: <Pine.GSO.4.21.0212282336010.17067-100000@vervain.sonytel.be>
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

On Thu, 26 Dec 2002, Tom Rini wrote:
> On Tue, Dec 24, 2002 at 03:51:47PM -0800, Randolph Chung wrote:
> > > AFAIK the generic RTC driver is used on PA-RISC, PPC, and m68k.
> > > 
> > > Are you interested in a backport to 2.4.x?
> > 
> > On parisc we already have a version of the generic RTC driver in our
> > 2.4 tree. If there's something more "official" or common we can adopt
> > that version. 
> 
> Similarly, PPC has had it's own 'generic' RTC driver in the kernel for
> ages, so there's no pressing need, but if the 2.5 version makes its way
> back into 2.4 (as the 2.5 version has some minor changes needed for
> everyone which weren't in the 2.4 m68k version), we can easily switch to
> that version.

I already merged some of your 2.5.x changes with the driver in the m68k 2.4.x
tree.

I'll do some more merges, and get back to you...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
