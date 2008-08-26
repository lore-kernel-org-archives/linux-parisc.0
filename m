From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: __kernel_suseconds_t is int on PA-RISC (and SPARC64)?
Date: Tue, 26 Aug 2008 22:11:25 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808262207450.7910@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linux/m68k <linux-m68k@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759230AbYHZULj@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Apparently __kernel_suseconds_t is `int' on PA-RISC (and on SPARC64),
while it's `long' on all other platforms.

Is there a specific reason for that?

This causes compiler warnings in the HP SDC Real Time Clock driver,
which is shared between PA-RISC and m68k:

drivers/input/misc/hp_sdc_rtc.c:461: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:461: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:468: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:468: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:475: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:475: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:482: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:482: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:489: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
drivers/input/misc/hp_sdc_rtc.c:489: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
