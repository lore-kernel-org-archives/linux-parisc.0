Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA19921
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Nov 1999 14:22:13 -0700
Date: Mon, 15 Nov 1999 17:34:27 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Andi <der_fisch@fischlustig.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] question about booting / console
In-Reply-To: <99111520410600.00425@beavis>
Message-ID: <Pine.LNX.4.10.9911151733390.10143-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


On Mon, 15 Nov 1999, Andi wrote:
> I have now sucessfully booted the linux kernel over the network with bootp.
> after booting the HP with "boot alt isl" , I changed the command line from
> console=ttyS0 to console=tty at the interactive bootloader, but after the kernel
> displays
> realmode_setup exited
> nothing else happens. I used the latest binary kernel snapshot, and I have a
> HP 712.

I'm pretty sure that that binary image will actually only work with a
serial console, so that's probably the issue.

I'll make sure there's better images up sometime this week.

- Alex
