Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9054655.dip.t-dialin.net [217.5.70.85])
	by dsl2.external.hp.com (Postfix) with ESMTP id A58A0482A
	for <parisc-linux@parisc-linux.org>; Fri,  1 Feb 2002 14:05:33 -0700 (MST)
Date: Fri, 1 Feb 2002 21:49:03 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Display for C100?
Message-ID: <20020201214903.A2678@solo.franken.de>
References: <Pine.LNX.4.21.0202011318340.23933-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0202011318340.23933-100000@maestro.symsys.com>; from ingram@symsys.com on Fri, Feb 01, 2002 at 01:53:52PM -0600
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

On Fri, Feb 01, 2002 at 01:53:52PM -0600, Greg Ingram wrote:
> STI device: HPA4071A
> Console: switching to colour frame buffer device 160x64
> fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf6100000

that's a HCRX24 graphics board.

> Would anyone know what kind of monitor I need?

You need a monitor, which supports sync on green and a resolution of
1280 x 1024 60Hz.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
