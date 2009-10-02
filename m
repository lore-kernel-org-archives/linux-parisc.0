From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Build failure?
Date: Thu, 1 Oct 2009 21:36:30 -0400
Message-ID: <119aab440910011836o4b61e52j3294c3e16b80c00c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge, Kyle,

Building 2.6.32-rc2
(git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git)

Results in:

drivers/char/agp/parisc-agp.c:220: error:
'parisc_agp_page_mask_memory' undeclared here (not in a function)
make[3]: *** [drivers/char/agp/parisc-agp.o] Error 1
make[2]: *** [drivers/char/agp] Error 2
make[1]: *** [drivers/char] Error 2
make: *** [drivers] Error 2

I haven't looked into this yet.

Cheers,
Carlos.
