Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA02612
	for <parisc-linux@puffin.external.hp.com>; Sun, 30 Jul 2000 18:04:41 -0600
Message-ID: <3984C372.254E875@home.com>
Date: Sun, 30 Jul 2000 19:08:18 -0500
From: Matthew Hudson <mhudson@home.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
CC: parisc-linux@thepuffingroup.com
References: <397C7472.98FA73C7@home.com> <20000724144024.B25594@vodka.thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] The Kxx0 machines and other questions.
List-ID: <linux-parisc.vger.kernel.org>


> On Mon, Jul 24, 2000 at 11:53:06AM -0500, Matthew Hudson wrote:
> > Now on subject. K200 working in Linux and if so
> > is there SMP support yet?
> 
> we're not really interested in supporting the k class right now.
> it's pretty similar to early C/J class (C100, C110, J200, J210), but it
> has some `interesting' devices in it that may be hard to support (the
> SCSI adapter looks slightly strange).  we don't have any SMP support yet
> and this machine won't be high on the priority list when we do start
> working on SMP.  i guess you're going to have to join in and do some
> hacking yourself :-)

Like I have the time for this, but... (famous last words)

Since I haven't had the time (yet) to attempt booting into Linux
with this monster what is its status? Non-functional or?
Where can I get some documentation for the various hardware in
this machine.

What is the status of the J210XC and will I be able to create
a functional Linux environment for it(the J210) if I wanted to
start coding? (currently running 10.20)

-Matt
