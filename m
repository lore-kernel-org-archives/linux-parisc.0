Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from aeon.tvd.be (aeon.tvd.be [195.162.196.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8751D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Jun 2001 07:26:08 -0600 (MDT)
Date: Fri, 22 Jun 2001 15:22:58 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Sender: geert@linux-m68k.org
To: Keith Owens <kaos@ocs.com.au>
Cc: sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <2105.993214803@ocs3.ocs-net>
Message-ID: <Pine.LNX.4.05.10106221520250.2098-100000@callisto.of.borg>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: SCSI in arch/{m68k,parisc,sparc*}/config.in
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 22 Jun 2001, Keith Owens wrote:
> cc: kaos@ocs.com.au please, I am not on these lists.
> 
> arch/{m68k,parisc,sparc*}/config.in have their own SCSI list instead of
> using drivers/scsi/Config.in.  Cleaning up the SCSI config file is on
> my 2.5 TODO list, can you tell me why these architectures have their
> own list of SCSI devices?
> 
> If it is because only some SCSI drivers work on these architectures, do
> you really need to be this specific?  Other architectures source
> drivers/scsi/Config.in without checking for arch dependent drivers.  If
> the need is to support extra arch specific drivers, use the same
> technique as acorn :-

[ speaking for m68k ]

We do that to avoid being annoyed with questions about irrelevant SCSI
hardware. If nowadays all ISA/EISA/MCA/PCI SCSI hardware questions are properly
protected with their respective CONFIG_*, we're willing to include the generic
drivers/scsi/Config.in.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
