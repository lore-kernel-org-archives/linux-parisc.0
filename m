Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 768F3482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 15:42:24 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18F01b-0001uY-00; Thu, 21 Nov 2002 22:42:19 +0000
Date: Thu, 21 Nov 2002 22:42:18 +0000
From: Matthew Wilcox <willy@debian.org>
To: Chris Jantzen <chris-parisc@maybe.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C180 not booting Sarge kernel
Message-ID: <20021121224218.B13955@parcelfarce.linux.theplanet.co.uk>
References: <20021121090154.GB23152@maybe.net> <Pine.LNX.4.44.0211210831370.23497-100000@wolf.alaskatech> <20021121090154.GB23152@maybe.net> <20021121135754.GA3811@systemhalted> <Pine.LNX.4.44.0211210831370.23497-100000@wolf.alaskatech> <20021121220930.GF23152@maybe.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021121220930.GF23152@maybe.net>; from chris-parisc@maybe.net on Thu, Nov 21, 2002 at 02:09:30PM -0800
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

On Thu, Nov 21, 2002 at 02:09:30PM -0800, Chris Jantzen wrote:
> While I have somebody's attention: I have some EISA 3c597's that I'd
> like to use in this machine. I carefully compile the kernel module with
> the same parameters and install it and all I ever get is:
> 
> ryoko:~# modprobe 3c59x
> 3c59x: Donald Becker and others. www.scyld.com/network/vortex.html
> 3c59x: 3Com EISA 3c590 Vortex 10Mbps at 0x1000. Vers LK1.1.16
> 
> ccio-dma.c:638: Assertion dev failed!
> Kernel panic: dev
> 
> Message from syslogd@ryoko at  Thu Nov 21 09:47:32 2002 ...
> ryoko kernel: Kernel panic: dev

Yeah, so somebody needs to write the code that allows EISA devices to
do DMA back to the host ... I have the specs here, maybe I should write
them up and somebody else can write the code?

-- 
Revolutions do not require corporate support.
