Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA03974
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 09:32:47 -0700
Message-Id: <199911231633.LAA03575@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: bame@debian.fc.hp.com (Paul Bame)
Date: Tue, 23 Nov 1999 11:33:03 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199911231559.IAA23827@debian.fc.hp.com> from "Paul Bame" at Nov 23, 99 08:59:52 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> = Honestly, I don't think we have a way yet to use the command line the HPUX
> = boot loader passes us (which I was told uses the ANSI C way of passing
> = arguments, i.e. argument count in GR26, pointer to NULL-terminated array
> = of pointers to NULL-terminated arrays of strings in GR25).  Anyone up to
> = write some glue code that puts that back together into a simple long string
> = Linux's commandline splitting code can spli again ?
> = 
> 
> I wrote that glue a while back -- it's in real/setup.c and is #if-0-ed.
> Unfortunately the strings are stored
> in low-ish physical RAM which is overwritten when the our kernel is
> loaded.  If we want the hpux command line badly enough, we'll have
> to load the kernel at a higher physical location.  It could then
> be copied to 0x10000 after we collect the command line.  
> 
> One could hard-code a command line in real/setup.c temporarily...

How much higher do you think is necessary?  Hpux seems to use 0x11000.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
