Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 73D5E4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Apr 2003 07:53:16 -0600 (MDT)
Date: Mon, 14 Apr 2003 15:53:14 +0200
Message-ID: <3E8AE87E00006D87@ocpmta2.freegates.net>
In-Reply-To: <1050320386.25353.11.camel@dhcp22.swansea.linux.org.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] parisc-linux.org kernel
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: "Grant Grundler" <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>On Llu, 2003-04-14 at 13:13, Joel Soete wrote:
>> +#if defined(__hppa__) && defined(CONFIG_SUPERIO)
>> +#include <asm/superio.h>
>> +#endif
>> +
>
>Please keep superio out of generic drivers
>
>
>>  	if (!using_inta)
>> +#if defined(__hppa__) && defined(CONFIG_SUPERIO)
>> +		hwif->irq = superio_get_ide_irq();	/* legacy mode */
>> +#else
>>  		hwif->irq = hwif->channel ? 15 : 14;	/* legacy mode */
>> +#endif
>>  	else if (!hwif->irq && hwif->mate && hwif->mate->irq)
>>  		hwif->irq = hwif->mate->irq;	/* share IRQ with mate */
>
>Ughh. Ok this needs tackling in a more general way. get_legacy_irq(0/1)
>perhaps. This isnt the only port we need to sort out.
>
>Ok suppose you added superio.h to include/asm-parisc/ide.h and added
>ide_get_legacy(int n) [n=0/1] for interfaces. I can do the same for the
>other ports (return 14+n) and it will stay clean in 2.4 and 2.5
>

> 
>>  	     (dev->class & 0x80))) {
>> -		unsigned long dma_base = ide_get_or_set_dma_base(hwif);
>> +		u32 dma_base = ide_get_or_set_dma_base(hwif);
>
>Thats reverting a fix. dma_base must be unsigned long for 64bit
>platforms. Looks just like a merge error.

Sorry note a merge error but well a revert because I encounter a problem
in a previous merge. I have to review,

Thanks for advises,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
