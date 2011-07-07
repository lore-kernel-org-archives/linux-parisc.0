From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Sort output dynamic relocations.
Date: Thu, 7 Jul 2011 11:29:04 -0400
Message-ID: <CADZpyiyS2m9cc=RuUg+DOc3xfEMFOAfdYWwFLbjDTUmgqtnDsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

FYI.

PA should be sorting relocations in .rlea.dyn such that realtive
relocations (DIR32) are listed first before opd relocs (PLABEL32).

This is required for the dynamic linker in glibc to operate correctly.

As a workaround I'm going to fixup the problem in glibc until I get a
chance to fix binutils.

See:
http://sourceware.org/ml/libc-alpha/2011-07/msg00055.html

Cheers,
Carlos.
