Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA02224
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 05:06:59 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 12:08:41 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9E8CEB005; Thu,  2 Nov 2000 12:07:36 +0000 (GMT)
Date: Thu, 2 Nov 2000 12:07:36 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a500.out16
Message-ID: <20001102120736.K32715@linuxcare.com>
References: <200011020821.AAA28301@milano.cup.hp.com> <20001102104306.F32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001102104306.F32715@linuxcare.com>; from rhirst@linuxcare.com on Thu, Nov 02, 2000 at 10:43:06AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 02, 2000 at 10:43:06AM +0000, Richard Hirst wrote:
> Linux Tulip driver version 0.9.8 (July 13, 2000)
> tulip: MMIO resource (0x400@0xfffffffff8020000) unavailable, aborting
> PCI: Setting latency timer of device 00:00.0 to 64
> eth0: Digital DS21143 Tulip rev 65 at 0x0, 00:30:6E:03:79:A0, IRQ 128.
> eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
> Sending BOOTP requests.... OK
> IP-Config: Got BOOTP answer from 10.160.240.111, my address is 10.160.240.117
> Switching from PDC console
> 
> Wheeee!  Nice work Grant!

And if you stop it from trying to switch from pdc to ttyS0 console:

Linux Tulip driver version 0.9.8 (July 13, 2000)
PCI: Setting latency timer of device 00:00.0 to 64
eth0: Digital DS21143 Tulip rev 65 at 0x0, 00:30:6E:03:79:A0, IRQ 128.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 10.160.240.111, my address is 10.160.240.117
kmem_create: Forcing size word alignment - nfs_fh
Looking up port of RPC 100003/2 on 10.160.240.111
Looking up port of RPC 100005/2 on 10.160.240.111
VFS: Mounted root (nfs filesystem) readonly.
Warning: unable to open an initial console.
Kernel panic: Attempted to kill init!

Richard
