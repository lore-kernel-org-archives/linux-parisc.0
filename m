Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA02672
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Nov 2000 05:26:59 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Nov 2000 12:28:42 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13rJ4A-00016G-00; Thu, 02 Nov 2000 12:01:58 +0000
Date: Thu, 2 Nov 2000 12:01:58 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a500.out16
Message-ID: <20001102120158.B3632@parcelfarce.linux.theplanet.co.uk>
References: <200011020821.AAA28301@milano.cup.hp.com> <20001102104306.F32715@linuxcare.com> <20001102113047.J32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001102113047.J32715@linuxcare.com>; from rhirst@linuxcare.com on Thu, Nov 02, 2000 at 11:30:47AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Nov 02, 2000 at 11:30:47AM +0000, Richard Hirst wrote:
> > Note sym53c8xx.c doesn't seem to bother with request_mem_region(), so
> > maybe request_mem_region() is just broken.
> 
> It is broken because of the following line in kernel/resource.c:
> 
> struct resource iomem_resource = { "PCI mem", 0x00000000, 0xffffffff, IORESOURCE_MEM };
> 
> 'end' needs to be rather higher than 0xffffffff on 64 bit.  I changed it to
> 
> struct resource iomem_resource = { "PCI mem", 0x00000000, ~0, IORESOURCE_MEM };
> 
> and it works.  I havn't committed that 'fix' though.

Probably just as well... the pci_consistent interfaces were designed
partly to stop 32-bit PCI cards having to do dual-address-cycle on
machines with an IOMMU.  if you can, this card should get mapped below
the 32-bit boundary.

-- 
Revolutions do not require corporate support.
