Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id DDCAC4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Apr 2003 10:32:25 -0600 (MDT)
Date: Tue, 15 Apr 2003 18:32:22 +0200
Message-ID: <3E9BA3670000071C@ocpmta1.freegates.net>
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

Alan,

I just start to have a look (very busy right now)

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
>Ok suppose you added superio.h to include/asm-parisc/ide.h

That is already done :)

> and added
>ide_get_legacy(int n) [n=0/1] for interfaces.

And so I still have to add 
#if defined(CONFIG_SUPERIO)
#    define ide_get_legacy(x) superio_get_ide_irq()
#else
#    define ide_get_legacy(x) ... (still have to find what)
#endif

and so change in drivers/ide/pci/ns87415.c

    hwif->irq = ide_get_legacy();	/* legacy mode */

Well in fact I do not yet well understand (less experience :( ) how do you
foreseen to manage this stuff for other platform?

thanks in advance for your understand.

By the way, in drivers/char/serial.c, also related to 'superio', i noticed:

#ifdef CONFIG_SUPERIO
    superio_serial_init();
#endif

Here I don't see how could it be kept out of generic drivers. Any idea?

Joel

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
