Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F51648E7
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Aug 2003 17:20:03 -0600 (MDT)
Date: Thu, 28 Aug 2003 00:19:58 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C3000 and IDE DMA support
In-Reply-To: <20030827230925.GH31311@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0308280010270.16696-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 27 Aug 2003, Grant Grundler wrote:

> On Wed, Aug 27, 2003 at 11:22:54PM +0100, Alan Cox wrote:
> > Nod.. I'm trying to fathom the 3Mbyte/second behaviour while hdparm
> > claims DMA is on
>
> I thought each PIO READ costs something like 400 or 500 cycles on c3k
> (400Mhz CPU).  400/3 == 133 cycles/byte.
>
> Either doing very slow DMA or 32-bit (4*133 == 532) reads.
> Then it would make sense.

beast:/home/xam# hdparm -c /dev/hda

/dev/hda:
 IO_support   =  1 (32-bit)


Well, I set it to 32bit I/O, more specifically I also tried
c=0 (16bit, default), c=3 (32-bit with sync). Everytime the same:


beast:/home/xam# hdparm -Tt /dev/hda

/dev/hda:
 Timing buffer-cache reads:   128 MB in  1.80 seconds = 71.11 MB/sec
 Timing buffered disk reads:  64 MB in 20.48 seconds =  3.12 MB/sec


However switching of DMA (as I told in my previous post, 'hdparm -d 0')
will cause a kernel crash (+ dump).

I haven't tried to compile & test a kernel without DMA support (or NS87415
support)


greetings, Max
