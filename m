Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62662482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Jul 2001 05:20:06 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3F86AB00C; Fri,  6 Jul 2001 12:19:20 +0100 (BST)
Date: Fri, 6 Jul 2001 12:19:20 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Timothy Ball <timball@tux.org>
Cc: Parisc Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] booting images
Message-ID: <20010706121920.R23509@linuxcare.com>
References: <20010703151202.H19064@gwyn.tux.org> <20010704133802.K19064@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010704133802.K19064@gwyn.tux.org>; from timball@tux.org on Wed, Jul 04, 2001 at 01:38:02PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 04, 2001 at 01:38:02PM -0400, Timothy Ball wrote:
> On Tue, Jul 03, 2001 at 03:12:02PM -0400, Timothy Ball wrote:
> > I have a 735 and have had a bit of a time to try to get this thing to
> > boot and install. I have downloaded the palinux-0.9-32sti.iso.gz file
> > from the parisc website. Is there anything special I have to do to this
> > image to make it bootable? 
> 
> Okay I got the iso and it's booting... but then it gets down to these
> last few lines:
> 
> --snip--snip--snip--
> CPU(s): 1x PA7100 (PCX-T) at 125.000000 MHz
> Kernel command line: HOME=/ TERM=linux root=/dev/ram console=tty0 sti=0
> sti_font=VGA8x16
> Console: colour dummy device 80x25
> --snip--snip--snip--
> 
> Then it hangs... Not sure what to do... 

http://mkhppa1.esiee.fr/list.html says 735 is only known to work
with serial console.  Don't know if that is still valid.  You
should try the 0.9.1 ISO available from ESIEE, but please wait until
they have fixed it - the one currently available does not boot at all!

Richard
