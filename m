Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F0CF4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 06:37:58 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h3EBdmRN025682;
	Mon, 14 Apr 2003 12:39:49 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h3EBdliJ025680;
	Mon, 14 Apr 2003 12:39:47 +0100
Subject: Re: [parisc-linux] parisc-linux.org kernel
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E8AE87E00006C1C@ocpmta2.freegates.net>
References: <3E8AE87E00006C1C@ocpmta2.freegates.net>
Content-Type: text/plain
Message-Id: <1050320386.25353.11.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 14 Apr 2003 12:39:46 +0100
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

On Llu, 2003-04-14 at 13:13, Joel Soete wrote:
> +#if defined(__hppa__) && defined(CONFIG_SUPERIO)
> +#include <asm/superio.h>
> +#endif
> +

Please keep superio out of generic drivers


>  	if (!using_inta)
> +#if defined(__hppa__) && defined(CONFIG_SUPERIO)
> +		hwif->irq = superio_get_ide_irq();	/* legacy mode */
> +#else
>  		hwif->irq = hwif->channel ? 15 : 14;	/* legacy mode */
> +#endif
>  	else if (!hwif->irq && hwif->mate && hwif->mate->irq)
>  		hwif->irq = hwif->mate->irq;	/* share IRQ with mate */

Ughh. Ok this needs tackling in a more general way. get_legacy_irq(0/1)
perhaps. This isnt the only port we need to sort out.

Ok suppose you added superio.h to include/asm-parisc/ide.h and added
ide_get_legacy(int n) [n=0/1] for interfaces. I can do the same for the
other ports (return 14+n) and it will stay clean in 2.4 and 2.5

 
>  	     (dev->class & 0x80))) {
> -		unsigned long dma_base = ide_get_or_set_dma_base(hwif);
> +		u32 dma_base = ide_get_or_set_dma_base(hwif);

Thats reverting a fix. dma_base must be unsigned long for 64bit
platforms. Looks just like a merge error.
