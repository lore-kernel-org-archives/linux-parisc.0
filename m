Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08D644840
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Nov 2003 21:21:05 -0700 (MST)
Date: Wed, 26 Nov 2003 21:21:03 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 and 2.6 - need config help
Message-ID: <20031127042103.GC1321@colo.lackof.org>
References: <Pine.LNX.4.58.0311201817470.21743@sal.ucc.ie> <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0311270244030.9783@sal.ucc.ie>
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

On Thu, Nov 27, 2003 at 03:07:18AM +0000, M. Grabert wrote:
...
> The IDE harddisk is running for the last couple of months, and I had no
> errors whatsoever (using the onboard IDE chipset of the C3k).

Really! I'm amazed since last time I played with suckyio IDE it
barely worked for CD-ROM installs.

> However it appears that writing and reading from/to the harddisk slows
> down the access time quite a bit (ie. streaming a 180kbit/s movie and
> writing a file with 1000kbit/s makes the movie to appear/play jerky);
> whereas multiple reads doesn't affect it (ie. streaming serveral movies at
> a time with 180kbit/s each).

DMA is probably not enabled. This means all data is "manually" (ie by
the CPU) read or written to the IDE controller 16-bits at a time.
With interrupts turned off, mind you.

Enabling DMA would make a big difference in performance.

> Can anybody tell me what config options I need to boot a 2.6 kernel
> without serial console support (since it's broken) and without
> STI (since I don't have a graphics card in my C3k)?

Willy, tausq, and I hacked around on suckyio serial support.
I posted a preliminary patch to
	 ftp://ftp.parisc-linux.org/patches/diff-2.6.0-suckyio-serial-02

ISTR we have to reset the USB/LAN device via a firmware call *before*
messing with IO MMU (spurious DMA by USB or LAN will MCA the box).
The problem is this firmware call also blows away the serial console.

Work remaining:
1) determine when USB or LAN was left active by firmware.
2) only call firmware to reset all IO when USB or LAN was left active.
3) a) make an early call to init suckyio and it's serial port.
   b) or save/restore suckyio config space registers before/after
      the PDC_IO_RESET calls so PDC console continues to work.

> I've seen a config option 'DUMMY_CONSOLE' in .config, but I don't find
> how to select it in 'make menuconfig' or any description in Documentation/.
> 
> I have several machines that run headless - I use serial console then.
> But I never had a situation where I didn't even have serial console ...

yeah - the real problem is init sequence completely changed in 2.6 (vs 2.4).
We haven't reworked all the same quirks from 2.4 into 2.6 yet.

hth,
grant
