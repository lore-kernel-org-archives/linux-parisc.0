Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 450214829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Jan 2003 17:52:59 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18bs5Z-0006wa-00; Fri, 24 Jan 2003 00:52:57 +0000
Date: Fri, 24 Jan 2003 00:52:57 +0000
From: Matthew Wilcox <willy@debian.org>
To: "b.gunreben" <b.gunreben@web.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel update bug?
Message-ID: <20030124005257.A26567@parcelfarce.linux.theplanet.co.uk>
References: <3E305C44.11F38160@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E305C44.11F38160@web.de>; from b.gunreben@web.de on Thu, Jan 23, 2003 at 10:19:00PM +0100
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

On Thu, Jan 23, 2003 at 10:19:00PM +0100, b.gunreben wrote:
> Now the reason: I found, that with kernel 2.4.9, there were 3 serial devices
> found
> 
> /dev/ttyS0 uart 16550A port 0x0000 irq 90 baud_base 454545 spd_normal
> /dev/ttyS1 uart 16550A port 0x0000 irq 106 baud_base 454545 spd_normal
> /dev/ttyS2 uart 16550A port 0x0000 irq 170 baud_base 454545 spd_normal
> 
> the later kernel finds only the first two of these interfaces, and restarts
> when restoring the settings of /dev/ttyS2. Later it crashes completely of
> course. I could fix this behaviour by commenting out the last line in
> /etc/serial.conf.
> 
> Now my question: should kernel 2.4.20 find two or three serial devices on a
> C360, and why does the kernel crash if setserial tries to configure a
> (nonexistant?) device?

Well, how many serial ports do you have?  ;-)

It was a bug up till (i think) a 2.4.17 kernel that we found a ghost
serial port.  And setserial is a broken piece of crap that will crash
the machine if it tries to set serial ports that don't exist.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
