From: Helge Deller <deller@gmx.de>
Subject: Re: __kernel_suseconds_t is int on PA-RISC (and SPARC64)?
Date: Tue, 26 Aug 2008 22:24:18 +0200
Message-ID: <48B46672.1000902@gmx.de>
References: <Pine.LNX.4.64.0808262207450.7910@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org,
	Linux/m68k <linux-m68k@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0808262207450.7910@anakin>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Geert Uytterhoeven wrote:
> Apparently __kernel_suseconds_t is `int' on PA-RISC (and on SPARC64),
> while it's `long' on all other platforms.
> 
> Is there a specific reason for that?

I don't know for sure, but arch/parisc/kernel/syscall_table.S states:
/* even though manpage says struct timeval contains longs, ours has
  * time_t and suseconds_t -- both of which are safe wide/narrow */
    ENTRY_COMP(setitimer)

So it was probably chosen to be int so that it can be easily used in 32- 
and 64bit kernels (or compat code).

Helge


> This causes compiler warnings in the HP SDC Real Time Clock driver,
> which is shared between PA-RISC and m68k:
> 
> drivers/input/misc/hp_sdc_rtc.c:461: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:461: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:468: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:468: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:475: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:475: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:482: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:482: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:489: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> drivers/input/misc/hp_sdc_rtc.c:489: warning: format '%02d' expects type 'int', but argument 4 has type 'long int'
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
