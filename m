Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78692482A
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 12:07:52 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 5 Jun 2001 12:56:29 -0500
Content-Type: text/plain
Cc: Richard Hirst <rhirst@linuxcare.com>,
	debian-hppa@lists.debian.org, parisc-linux@thepuffingroup.com,
	parisc-linux@parisc-linux.org
References: <20010605185008.R7349@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01060513071704.00472@wolf01.my.home>
Subject: [parisc-linux] Re: pa-risc V0.9 on Model 720 (+ others)
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 05 Jun 2001, Matthew Wilcox wrote:
> On Tue, Jun 05, 2001 at 11:36:37AM -0500, Michael S. Zick wrote:
> > Without either BA's defined - in/out Byte, Word, Long does not have
> > a prototype in mem.c (amoung other places) - the compiler guesses
> > (incorrectly) at what inb() and outb() mean.
>=20
> That's a known-bad configuration.  You have to have some kind of PCI
> or EISA controller configured in.

Only if you intend to never support non-PCI, non-EISA older boxes.

Regardless of your intent - proper combinations of CONFIG_xxxxx
are supposed to be handled by the (x)config step of the build process.
After all - that is what "configure" means (in English).

To do a clean job of this - a selection of "Box Model" (similar to "Proce=
ssor Type")
may have to be added to the configuration scripts.  With corresponding #i=
fdef/#ifndef
statements in the relavent code.

At the moment - I have tunnel vision - I am focused on getting a personal=
 copy
of parisc-linux to boot on my model 720 box.

The comments and findings I post to the mailing lists may be freely disre=
garded
by anyone not interested them.  Still, they will exist in the mail list a=
rchives so that
any developer working on a public version of this kernel can use them for=
 hints, leads
and other ideas.

Mike
>=20
> --=20
> Revolutions do not require corporate support.
