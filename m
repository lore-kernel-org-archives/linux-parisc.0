Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE3E6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 16:53:14 -0600 (MDT)
Subject: Re: [parisc-linux] Debian 3.0 on C200
From: Ryan Bradetich <rbradetich@uswest.net>
To: Michael Madden <madden@maddentechnologies.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020830222805.GA29652@maddentechnologies.com>
References: <20020830222805.GA29652@maddentechnologies.com>
Content-Type: text/plain
Date: 30 Aug 2002 16:53:13 -0600
Message-Id: <1030747993.19450.415.camel@beavis>
Mime-Version: 1.0
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

Michael,

Yes, I have been using X on a C200 as my primary workstation at work for
the last couple of months.

The trick is to see if you have a supported video card or not.

When your system boots (check dmesg) do you see a line that looks
something similar to this?

fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio:
0xfa100000

If you see the fb0: device, then you can use X on the framebuffer
driver.  I can send you my config if you would like, but I think I'm
using the default config the debian package setup for me.

If you do not see the fb0: line, then you can not run X on the system
yet because HP has not released any documentation on the drivers. 
[Note: there is an effort underway (check the recent archives) about
getting X running on a voodoo2 card on a c200 so that effort might
be of interest to you also!

- Ryan


On Fri, 2002-08-30 at 16:28, Michael Madden wrote:
> Hello:
> 
> Has anyone gotten X to work with the Debian 3.0 port on a PA-RISC C200 machine? 
> I have a C200 that I've installed Debian 3.0 on, but I cannot get X setup 
> correctly.
> 
> The hardware is:
> Main memory size: 768 Mbytes
> 1  Raven U 200 (9000/780/C200) processor
> 2 16550A serial ports
> 1 ethernet interface
>   eth0: Digital DS21143 Tulip rev 48
> PCI bus devices:
> SCSI storage controller: LSI Logic / Symbios Logic (formerly NCR) 53c875 (rev 4).
> Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 48).
> Display controller: PCI device 103c:1008 (Hewlett-Packard Company) (rev 2).
