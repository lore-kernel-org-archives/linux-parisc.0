Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA05182
	for <parisc-linux@puffin.external.hp.com>; Sun, 30 Jul 2000 23:51:13 -0600
Message-Id: <200007310555.WAA28499@milano.cup.hp.com>
To: Matthew Hudson <mhudson@home.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] The Kxx0 machines and other questions. 
In-reply-to: Your message of "Sun, 30 Jul 2000 19:08:18 PDT."
             <3984C372.254E875@home.com>
Date: Sun, 30 Jul 2000 22:55:36 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Hudson wrote:
> Mathew Wilcox (?) wrote:
> > we're not really interested in supporting the k class right now.
> > it's pretty similar to early C/J class (C100, C110, J200, J210), but it
> > has some `interesting' devices in it that may be hard to support (the
> > SCSI adapter looks slightly strange).  we don't have any SMP support yet
> > and this machine won't be high on the priority list when we do start
> > working on SMP.  i guess you're going to have to join in and do some
> > hacking yourself :-)
> 
> Like I have the time for this, but... (famous last words)
> 
> Since I haven't had the time (yet) to attempt booting into Linux
> with this monster what is its status? Non-functional or?
> Where can I get some documentation for the various hardware in
> this machine.

Non-functional since U2/Uturn code is not ready yet (I'm working on it)
and not documented (let's not go there again right now). And even
if it were ready, I need to hack in some sort of an "I/O tree"
in order to support more than one U2/Uturn. K-class can have
multiple U2/Uturns.

The core I/O board has a NCR 53c720 chip with zalon - Richard Hirst
is working on that already. AFIAK, Zalon isn't documented but it's trivial
to initialize and the real problem is support for c720 chip in linux.

AFAICT, Built-in LAN, PS/2, serial ports, and SE SCSI are off a LASI.
Same chip as what's documented for the A180/712/et al.
But the firmware might be reporting them differently...someone who
cares will have to figure this out.

I doubt documents or code for the gecko-boa (GSC to HP-PB bus converter)
will ever get published....and even if it did, getting docs for the HP-PB
(aka NIO) devices is another huge hurdle. Look for a "HARRIER"
(card carrier for K-class, provides 4 "gsc" "slots") if you don't already
have one. At least some of the GSC devices (like tachyon, c720) will
get or are supported already.

> What is the status of the J210XC and will I be able to create
> a functional Linux environment for it(the J210) if I wanted to
> start coding? (currently running 10.20)

Once the U2/Uturn support is in place and user space stabilizes, yes.

Audio and graphics continue to be a problem WRT documentation and code.
I don't know what's up with "WAX" (EISA) support.

Matt, I didn't see a J210XC in the HW database.
(http://www.thepuffingroup.com/parisc/hw.html)
Since you asked about status and I've written this detailed reply,
I'd consider you a real dork at this point if you didn't enter
the J210XC into the HW database.  Could you please?
(thanks in advance :^)

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
