Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA23888
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Nov 1999 13:44:13 -0700
Date: Thu, 4 Nov 1999 15:55:07 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Congratulations, remarks and questions
In-Reply-To: <19991103123044.18853.rocketmail@web507.yahoomail.com>
Message-ID: <Pine.LNX.4.10.9911041551480.14544-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


In theory, most of these changes are, I think, already in the kernel tree
in CVS.

On Wed, 3 Nov 1999, Ulrich Strelow wrote:
> My first try was to build the kernel without
> specifying CONFIG_NETDEVICES=n. This leads to the
> following problem: the kernel stops booting with these
> messages:  
> 
> Starting lasi lan at 0xf0826000
> lasi_alloc_irq(0xc0127968): No LASI found in system
> yet
> IRQ not found for lasi lan at 0xf0826000
> Warning : device (10, 0xb, 0x0, 0x72, 0x0) NOT claimed
> by Lasi i82596(???) LAN 700 or similiar (old)

The problem here is that the i82596 expects to be connected to a Lasi, not
the ASP thing that's in a 715.  We have no docs on ASP, so we can't really
do anything about this until later.

> Now the questions: the kernel boots to the
> sash-prompt, but no keyboard input is possible
> (neither the HIL-keyboard, nor the keyboard from the
> serial terminal I was using). Is this because of the
> missing support for the ASP chip of the 715/33 ? 

This is because:
- right now no terminal we have supports a keyboard
- we don't have a HIL keyboard driver because of ASP

> Are
> all devices (HIL, SCSI and LAN) connected via that
> chip ? And finally: has HP found and published the
> docs of that chip so that someone is able to write the
> supporting routines ?

ASP support is something we might be able to get from openbsd or mklinux
source, I haven't checked.  It's on our list of documentation we want from
HP though.

- Alex
