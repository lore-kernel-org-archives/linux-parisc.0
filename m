Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id E09B9482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 00:25:35 -0600 (MDT)
Date: Wed, 29 May 2002 07:02:42 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PATCH: flush_icache_page() and flush_icache_range()
Message-ID: <20020529060242.GG3471@sleepie.demon.co.uk>
References: <20020528234023.GF3471@sleepie.demon.co.uk> <200205290048.g4T0mUrP026311@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200205290048.g4T0mUrP026311@hiauly1.hia.nrc.ca>
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

On Tue, May 28, 2002 at 08:48:30PM -0400, John David Anglin wrote:
> > Hi,
> >   gdb has a problem in that it often doesn't stop the target program
> > when you do a 'step' or 'next'.  This is because it plants breakpoints,
> > but those breakpoints sit in the data cache and don't get flushed
> > through to be visible as code in time.  We need a flush_icache_page()
> > implementation to fix this; the following adds that and
> > flush_icache_range() also.  It does fix gdb for me on my a500.
> 
> Good find! I'll give it a try.  Can you now print function results?

You mean like

Breakpoint 1, main (argc=1, argv=0xbff00148) at ../simple.c:16
16              a = thing(1);
(gdb) print thing(7)

Program terminated with signal SIGSEGV, Segmentation fault.
The program no longer exists.
The program being debugged stopped while in a function called from GDB.
When the function (thing) is done executing, GDB will silently
stop (instead of continuing to evaluate the expression containing
the function call).
(gdb) 


thing(x) just returns x*2 in this case.  As you see it didn't work, 
and gave a protection id trap for the target program.  I'll investigate
further.


Richard
