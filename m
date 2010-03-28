From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: gdbserver not built for gdb?
Date: Sun, 28 Mar 2010 11:59:09 -0400
Message-ID: <119aab441003280859p28e0284fud4a943d2df6e81c2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave, Helge,

Is there any reason why gdbserver is not built for gdb on hppa-linux-gnu?

I see clearly that gdb/gdb/configure.tgt does not set build_gdbserver
for hppa*-*-linux*.

I've enabled gdbserver for gdb 7.x, and I'll test it.

If it works I'll submit this upstream.

Cheers,
Carlos.
