Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA09387
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 01:29:45 -0600
From: Helge Deller <deller@gmx.de>
Date: Wed, 18 Oct 2000 09:30:34 +0200
Content-Type: text/plain;
  charset="us-ascii"
To: James Waterhouse <james.waterhouse@videotron.ca>,
        "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
References: <39ED4B3B.85348ED2@videotron.ca>
In-Reply-To: <39ED4B3B.85348ED2@videotron.ca>
Subject: Re: [parisc-linux] booting on 712/60
MIME-Version: 1.0
Message-Id: <00101809303400.18775@P100>
List-ID: <linux-parisc.vger.kernel.org>

Hello James,

Am Wednesday 18 October 2000 09:03 schrieb James Waterhouse:
> Hello,
> 	I just compiled a ramdisk using mondays cvs src for everything. I'm
> using the graphics console ramdisk file off the puffin.external.hp.com
> (ramdisk20000530-sticon.tgz) to make the ramdisk. Now when I got to boot
> it boots up until the point where the kernel says...
>
> Sending BOOTP request.... OK
> IP-Config: Got BOOTP answer.. bla bla
> Switching from PDC console
>
> And then I get nothing. So what is happening when we switch from the PDC
> console? Is the output going to the serial port, or am I crashing
> because my graphics hardware is not supported, or am I crashing for some
> other reason?

I'm seeing the same here. The kernel switches independend of your 
kernel-settings (STI-Console - no STI-Console) to serial-console and just 
puts some of it's error-messages to the STI-console. 
If you don't have a nullmodem cable, you could try to ping/telnet your 
parisc, to see if it's still alive.
I currently don't know which change in CVS disallowed us to use just 
STI-Console, but will try to figure out later today. 

Helge.
 
>
> Thanks,
> James
