Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (dns.franken.de [193.175.24.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C10E4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 16:45:06 -0600 (MDT)
Date: Wed, 9 Oct 2002 00:33:16 +0200
To: "b.gunreben" <b.gunreben@web.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Can't start X-windows on HP C240 with HP FX4 graphics card ?
Message-ID: <20021008223316.GB3692@solo.franken.de>
References: <5.1.0.14.2.20021007125233.00ada6a0@pophost.khk.be> <3DA1BB0F.97887A66@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DA1BB0F.97887A66@web.de>
From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
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

On Mon, Oct 07, 2002 at 06:49:19PM +0200, b.gunreben wrote:
> the FX? Cards are unsupported at the moment. However, if I understand
> correctly, there has been a port for x86 linux at times of kernel
> 2.2.16. I am not a kernel hacker, but I would like to know if there is a
> possibility to port the beta quality  driver from 
> http://www.hp.com/workstations/support/software/drivers/linux/video/fxvideo/
> to current kernels.

porting the kernel won't help, the X server modules contain all the
important bits. The header file supplied with the kernel sources give
some insides about the FX hardware. But not enough to give an idea
how to setup the framebuffer to a mode, we could use for a simple
framebuffer.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
