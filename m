Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18BC04879
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 22:36:17 -0700 (MST)
Date: Mon, 8 Mar 2004 22:36:15 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Andy Walker <andy@puszczka.com>
Subject: Re: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
Message-ID: <20040309053615.GA11669@colo.lackof.org>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 08, 2004 at 12:28:37PM +0100, Andy Walker wrote:
> Why is 8/12 (0x00089) reported as unknown in the device table and in
> proc/interrupts? Its the Zalon HVD SCSI.
...
> 6. unknown device at 0xfff8c000 [8/12] { 4, 0x0, 0x03c, 0x00089 }

It means we don't have an entry for Zalon in arch/parisc/kernel/hardware.c
Can you submit a patch for that?

(I confess: I'm being very lazy tonight and don't want to figure
what needs to go into the hardware.c array)

> zalon_probe: Zalon vers field is 0x1, IRQ 35
> ncr53c720-0: rev 0xf irq 35
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> scsi0 : ncr53c8xx-3.4.3e
> Using anticipatory io scheduler
>   Vendor: SEAGATE   Model: ST39173WD         Rev: 5764
>   Type:   Direct-Access                      ANSI SCSI revision: 02

Zalon is obviously recognized and seems to be working.

...
> weasel drivers # cat /proc/interrupts
>            CPU00
>   2:          0            EISA  cascade
>  32:    5268327      PARISC-CPU  timer
>  33:      11276      PARISC-CPU  lasi
>  34:          0      PARISC-CPU  Dino parisc8:0
>  35:      49026      PARISC-CPU  parisc8:12

hrm...good question. Oic.  RTFC. :^)
In drivers/scsi/zalon.c:
        if (request_irq(irq, ncr53c8xx_intr, SA_SHIRQ, dev->dev.bus_id, host)) {
                printk(KERN_ERR "%s: irq problem with %d, detaching\n ",
                        dev->dev.bus_id, irq);
                goto fail;
        }

sorry, can't help with the keyboard/mouse problems...

hth,
grant
