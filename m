Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA14102
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 01:13:28 -0700
Date: Mon, 15 Nov 1999 08:33:10 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hp700.c and hp800.c ?
Message-Id: <19991115083310.C30917@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911141751050.6663-100000@vodka.thepuffingroup.com> <199911150401.UAA24070@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911150401.UAA24070@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > Do we really need hp700.c and hp800.c in arch/parisc/kernel ?
> I sure hope not.

We don't, and there are more files in arch/parisc we don't need.  IMO,
these are:

most of /boot as we really should include nothing more than a minimal boot
  loader in the kernel sources

kernel/hp700.c
kernel/hp800.c
kernel/unaligned.c (unaligned data references are unpredictable behaviour
	iirc, so we shouldn't pretend to handle them correctly but have a
	nice clean debuggable Oops)
mm/pa11.c
mm/pa20.c (the differences between PA1.1 and PA2.0(narrow) are minimal,
	and the current files are as overgeneralized as it was necessary
	to overgeneralize to support all MIPS architectures)


	Philipp Rumpf
