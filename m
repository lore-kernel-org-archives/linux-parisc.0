From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Sun, 15 Jul 2007 14:49:13 -0400 (EDT)
Message-ID: <200707151849.l6FInDB4011476__4475.2333699309$1416624415$gmane$org@hiauly1.hia.nrc.ca>
References: <200707151935.27525.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: randolph@tausq.org,
 parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200707151935.27525.deller@gmx.de> from "Helge Deller" at Jul 15, 2007 07:35:27 pm
List-ID: <linux-parisc.vger.kernel.org>

> On Sunday 15 July 2007, Randolph Chung wrote:
> > In reference to a message from Helge Deller, dated Jul 15:
> > > Clean up syslog output of crashing userspace apps.
> > > With this patch the syslog will print:
> > >   portmap(1480): invalid access to 0x8232b578 at ip=0x41192af3 (segfault code 15)
> > > which is consistent with outher output like:
> > >   hald-probe-stor(1672): unaligned access to 0xfafcbd26 at ip=0x00014013
> > 
> > The verbose dump we have now is actually quite useful for debugging.
> > Whereas unaligned accesses are usually very straightforward to debug
> > once you know where they are coming from (thus only need ip), segfaults
> > are not always that way. The full register dump comes in handy...
> 
> I do not disagree, that dumps are useful in general.
> Nevertheless, is this specific dump really that useful ?
> Can you really fix bugs with the dump without use of gdb ?
> On i386 userspace crashes aren't even shown in the syslog.

I find the dumps useful.  While in most cases gdb is necessary
to fix bugs, it's not 100 % reliable when used to examine core
dumps (sorry Randolph).  The getdents bug that I tracked down
a few weeks ago was a case in point.

They are a double edge sword.  Recently, gcc was generating so
many faults that the log file system was filling up.  So, it
would be nice to be able to switch them on/off.

Hey, i386 hardly has any registers worth showing ;)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
