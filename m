Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA30300
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 03:42:26 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 10:44:05 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C8992B005; Thu,  2 Nov 2000 10:43:06 +0000 (GMT)
Date: Thu, 2 Nov 2000 10:43:06 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a500.out16
Message-ID: <20001102104306.F32715@linuxcare.com>
References: <200011020821.AAA28301@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011020821.AAA28301@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Nov 02, 2000 at 12:21:36AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 02, 2000 at 12:21:36AM -0800, Grant Grundler wrote:
> Hi Richard (et al),
> I finally think I understand how pcibios_align_resource() is used...
> that definitely was the problem. Everything on A500 but PCI-PCI bridge
> seems to be assigned I/O port and MMIO addresses correctly.
> 
> I'll look at tulip code tomorrow to see why it's not happy.

I fixed tulip_core.c to report what it means, which gave me

tulip: MMIO resource (0x400@0xfffffffff8020000) unavailable, aborting

Note sym53c8xx.c doesn't seem to bother with request_mem_region(), so
maybe request_mem_region() is just broken.

I then patched out the goto, so it ignored that error, and....

Linux Tulip driver version 0.9.8 (July 13, 2000)
tulip: MMIO resource (0x400@0xfffffffff8020000) unavailable, aborting
PCI: Setting latency timer of device 00:00.0 to 64
eth0: Digital DS21143 Tulip rev 65 at 0x0, 00:30:6E:03:79:A0, IRQ 128.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 10.160.240.111, my address is 10.160.240.117
Switching from PDC console

Wheeee!  Nice work Grant!

Richard
