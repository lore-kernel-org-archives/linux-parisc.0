From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
	crashing userspace apps.
Date: Sun, 15 Jul 2007 19:35:27 +0200
Message-ID: <200707151935.27525.deller__9825.50469129837$1416624414$gmane$org@gmx.de>
References: <200707151500.59050.deller@gmx.de>
	<20070715145613.GA9938@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070715145613.GA9938@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Randolph,

On Sunday 15 July 2007, Randolph Chung wrote:
> In reference to a message from Helge Deller, dated Jul 15:
> > Clean up syslog output of crashing userspace apps.
> > With this patch the syslog will print:
> >   portmap(1480): invalid access to 0x8232b578 at ip=0x41192af3 (segfault code 15)
> > which is consistent with outher output like:
> >   hald-probe-stor(1672): unaligned access to 0xfafcbd26 at ip=0x00014013
> 
> The verbose dump we have now is actually quite useful for debugging.
> Whereas unaligned accesses are usually very straightforward to debug
> once you know where they are coming from (thus only need ip), segfaults
> are not always that way. The full register dump comes in handy...

I do not disagree, that dumps are useful in general.
Nevertheless, is this specific dump really that useful ?
Can you really fix bugs with the dump without use of gdb ?
On i386 userspace crashes aren't even shown in the syslog.
 
> Can we make this controllable by prctl, so that we can have both verbose
> and terse output options, with the verbose one being the default? My
> rationale is that you don't usually know if an app is going to crash, so
> it's better to have the debug info you need if it does crash, and you
> can turn it off if your app runs in a way that the verbose output is
> somehow adversely affecting it (slowing it down too much, etc).

Good idea.
But again, on i386 there isn't shown anything.
Do we really want the overhead to add a new prctl option ?

> Also, you might want to remove "segfault" from the output string, since
> the crash can be from SIGSEGV, SIGILL, SIGBUS, etc...

Ok.

Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
