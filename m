Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9051D7B.dip.t-dialin.net [217.5.29.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8A8D482C
	for <parisc-linux@parisc-linux.org>; Wed, 12 Dec 2001 15:22:51 -0700 (MST)
Date: Wed, 12 Dec 2001 23:20:51 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Sven Cronenberg <sven.cronenberg@web.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] X WIndows on HP9000 720 or 735
Message-ID: <20011212232051.B1998@solo.franken.de>
References: <3C17254A.3050209@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C17254A.3050209@web.de>; from sven.cronenberg@web.de on Wed, Dec 12, 2001 at 10:37:14AM +0100
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

On Wed, Dec 12, 2001 at 10:37:14AM +0100, Sven Cronenberg wrote:
> I am using 2 HP9000 WOrkstatiosn at home. One HP900/720 system with CRX8 
>  graphic card and and a HP9000/735 with CRX48Z graphics system.

> I would like to know if anyone has succeeded in running X Windows for 
> PARISC Linux on one of those machines?

not yet. There is some code for these boards in the kernel, but it's disabled
by default. I'm waiting for hardware to verify the code is working or if it
isn't to fix it.

> By the way: How das the x-windows for PARISC Linux work. Does it access 
> the graphics card via the framebuffer device or directly?

via a framebuffer device.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
