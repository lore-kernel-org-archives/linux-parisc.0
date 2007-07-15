From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of crashing userspace apps.
Date: Sun, 15 Jul 2007 14:56:14 +0000
Message-ID: <20070715145613.GA9938__19981.1472943567$1416624413$gmane$org@tausq.org>
References: <200707151500.59050.deller@gmx.de>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <randolph@tausq.org>
In-Reply-To: <200707151500.59050.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

In reference to a message from Helge Deller, dated Jul 15:
> Clean up syslog output of crashing userspace apps.
> With this patch the syslog will print:
>   portmap(1480): invalid access to 0x8232b578 at ip=0x41192af3 (segfault code 15)
> which is consistent with outher output like:
>   hald-probe-stor(1672): unaligned access to 0xfafcbd26 at ip=0x00014013

The verbose dump we have now is actually quite useful for debugging.
Whereas unaligned accesses are usually very straightforward to debug
once you know where they are coming from (thus only need ip), segfaults
are not always that way. The full register dump comes in handy...

Can we make this controllable by prctl, so that we can have both verbose
and terse output options, with the verbose one being the default? My
rationale is that you don't usually know if an app is going to crash, so
it's better to have the debug info you need if it does crash, and you
can turn it off if your app runs in a way that the verbose output is
somehow adversely affecting it (slowing it down too much, etc).

Also, you might want to remove "segfault" from the output string, since
the crash can be from SIGSEGV, SIGILL, SIGBUS, etc...

thanks,
randolph
