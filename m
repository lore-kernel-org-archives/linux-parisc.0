Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EDE14852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 28 Feb 2004 09:45:08 -0700 (MST)
Date: Sat, 28 Feb 2004 09:45:06 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] C3000 and Promise Ultra100 TX2 PCI Controller
Message-ID: <20040228164506.GA11659@colo.lackof.org>
References: <1077757727.26560.7.camel@dhcp23.swansea.linux.org.uk>
	<Pine.LNX.4.58.0402260127230.26951@sal.ucc.ie>
	<20040226051124.GB3645@colo.lackof.org>
	<Pine.LNX.4.58.0402260513010.28003@sal.ucc.ie>
	<20040226155659.GA11451@colo.lackof.org>
	<1077907459.29711.13.camel@dhcp23.swansea.linux.org.uk>
	<20040227212356.GA28668@colo.lackof.org>
	<Pine.LNX.4.58.0402272325410.9660@sal.ucc.ie>
	<Pine.LNX.4.58.0402280055400.10811@sal.ucc.ie>
	<1077984432.31248.4.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1077984432.31248.4.camel@dhcp23.swansea.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org,
	Grant Grundler <grundler@parisc-linux.org>, "M. Grabert" <xam@cs.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Feb 28, 2004 at 04:07:13PM +0000, Alan Cox wrote:
> The SI goes via mmio promise via PIO, so it may be you unfixed the one
> that was right ?

oic.  siimage.c doesn't use the same code path.
I'll guess promise needs the arch/parisc/lib/io.c patch anyway
and something else is wrong with siimage. I'll track that
down later - could be something similar...

drivers/ide/pci/siimage.c:  default_hwif_mmiops(hwif);

ide-iops.c:void default_hwif_mmiops (ide_hwif_t *hwif)
...
        hwif->INSW      = ide_mm_insw;

include/asm-parisc/ide.h:
static __inline__ void __ide_mm_insw(unsigned long port, void *addr, u32 count)
{
        while (count--) {
                *(u16 *)addr = readw(port);
                addr += 2;
        }
}

include/asm/io.h:#define readw(addr) (*(volatile unsigned short *) __io_virt(addr))


Uhoh..no swapping at all in this case.
I was expecting readw to swap bytes.
Am I just confused again about how a BE is supposed to behave?
*sigh*

grant
