Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id E16614852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Dec 2003 08:46:22 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBDFkFa32533; Sat, 13 Dec 2003 10:46:15 -0500
Subject: Re: [parisc-linux] proposed changes to dino.c
From: James Bottomley <James.Bottomley@steeleye.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
In-Reply-To: <1071329635.23720.2.camel@dhcp23.swansea.linux.org.uk>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<1071241131.1814.5.camel@mulgrave>
	<1071257297.21661.3.camel@dhcp23.swansea.linux.org.uk>
	<20031213035125.GB28775@colo.lackof.org>
	<1071329635.23720.2.camel@dhcp23.swansea.linux.org.uk>
Content-Type: text/plain
Date: 13 Dec 2003 10:45:54 -0500
Message-Id: <1071330357.2024.4.camel@mulgrave>
Mime-Version: 1.0
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 2003-12-13 at 10:33, Alan Cox wrote:
> If the other ROMs are disabled then I don't see that happening. Its an
> old trick btw - I claim no originality here. Don Becker had some driver
> code that did this, and the graphics people in Linux and Windows pull
> the trick of unmapping the frame buffer to use as the ROM map
> temporarily

Hmm, yes...I completely blow away the ROM bar in the patch...what I
should do is just to remove it's IORESOURCE_MEM flag so it isn't
ordinarily allocated (but it's requested location and size are still
available).  Then any driver that wanted access could get it...we still
have 1020kB available for mapping up to three roms in the bridge window.

The alternative is just to resize the bridge window after we've counted
the resources...I'm less enthusiastic about this beacuse the dino PCI
window has a maximum size of 8MB for everything on the bus...plug a few
of these four ports into a dino PCI bus and we'll still run out of
memory.

James
