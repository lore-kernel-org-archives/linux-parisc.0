Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA01073
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 04:30:44 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 11:31:56 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3C903B005; Thu,  2 Nov 2000 11:30:47 +0000 (GMT)
Date: Thu, 2 Nov 2000 11:30:47 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a500.out16
Message-ID: <20001102113047.J32715@linuxcare.com>
References: <200011020821.AAA28301@milano.cup.hp.com> <20001102104306.F32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001102104306.F32715@linuxcare.com>; from rhirst@linuxcare.com on Thu, Nov 02, 2000 at 10:43:06AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 02, 2000 at 10:43:06AM +0000, Richard Hirst wrote:
> On Thu, Nov 02, 2000 at 12:21:36AM -0800, Grant Grundler wrote:
> > Hi Richard (et al),
> > I finally think I understand how pcibios_align_resource() is used...
> > that definitely was the problem. Everything on A500 but PCI-PCI bridge
> > seems to be assigned I/O port and MMIO addresses correctly.
> > 
> > I'll look at tulip code tomorrow to see why it's not happy.
> 
> I fixed tulip_core.c to report what it means, which gave me
> 
> tulip: MMIO resource (0x400@0xfffffffff8020000) unavailable, aborting
> 
> Note sym53c8xx.c doesn't seem to bother with request_mem_region(), so
> maybe request_mem_region() is just broken.

It is broken because of the following line in kernel/resource.c:

struct resource iomem_resource = { "PCI mem", 0x00000000, 0xffffffff, IORESOURCE_MEM };

'end' needs to be rather higher than 0xffffffff on 64 bit.  I changed it to

struct resource iomem_resource = { "PCI mem", 0x00000000, ~0, IORESOURCE_MEM };

and it works.  I havn't committed that 'fix' though.

Richard
