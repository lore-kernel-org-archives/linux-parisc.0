Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id C57894829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 04:13:43 -0600 (MDT)
Date: Wed, 16 Apr 2003 12:13:38 +0200
Message-ID: <3E9BA3A600000AF6@ocpmta2.freegates.net>
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

>-- Original Message --
>Subject: Re: [parisc-linux] parisc-linux.org kernel
>From: Alan Cox <alan@lxorguk.ukuu.org.uk>
>To: Joel Soete <jsoe0708@tiscali.be>
>Cc: Grant Grundler <grundler@parisc-linux.org>,
>	parisc-linux@lists.parisc-linux.org
>Date: 15 Apr 2003 16:54:32 +0100
>
>
>On Maw, 2003-04-15 at 17:32, Joel Soete wrote:
>
>> >ide_get_legacy(int n) [n=0/1] for interfaces.
>>
>> And so I still have to add
>> #if defined(CONFIG_SUPERIO)
>> #    define ide_get_legacy(x) superio_get_ide_irq()
>> #else
>> #    define ide_get_legacy(x) ... (still have to find what)

well: clearer this morning, it would just have to become
#    define ide_get_legacy((x)) (x)?15:14

>> #endif
>
>What do you need to know if the legacy irq is to come from superio.

If I well understand the question: nothing because superio_get_ide_irq()
is defined in arch/parisc/kernel/superio.c as:
...
int
superio_get_ide_irq(void)
{
        if (sio_dev.irq_region)
                return sio_dev.irq_region->data.irqbase + IDE_IRQ;
        else
                return 0;
}

sio_dev being a global var:
...
static struct superio_device sio_dev = {
        iosapic_irq: -1
};

which is define in include/asm-parisc/superio.h as:
...
struct superio_device {
        u16 fdc_base;
        u16 sp1_base;
        u16 sp2_base;
        u16 pp_base;
        u16 acpi_base;
        int iosapic_irq;
        int iosapic_irq_enabled;
        struct irq_region *irq_region;
        struct pci_dev *lio_pdev;       /* pci device for legacy IO fn */
};
...

>Should be we be asking ide_get_legacy(struct pci_device *pdev) ?

IMHO it would be difficult this way; what do you thing?

>
>I just want to understand this so I (or you) do it right
>
You have certainly more experience and a broader view (over different platform)
than I (up to you)

Is this actually help?

Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
