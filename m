From: Helge Deller <deller@gmx.de>
Subject: Re: Issue with pata_sil680
Date: Mon, 20 Jan 2014 21:12:43 +0100
Message-ID: <52DD833B.2010907@gmx.de>
References: <b1936c5daf63913a0a5d0c37b7ebc425@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: Guy Martin <gmsoft@tuxicoman.be>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <b1936c5daf63913a0a5d0c37b7ebc425@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Guy,

On 01/20/2014 01:24 PM, Guy Martin wrote:
> I tried to switch to the ATA drivers but I keep getting a panic
> whenever I load the pata_sil680 module on my C8000 
> 
> Kconfig : http://bpaste.net/show/170067/
> Kver : 3.12.8-gentoo
> 
> This is the backtrace :
> insmoterminator ~ # insmod pata_sil680.ko
> pata_sil680 0000:60:02.0: version 0.4.9
> pata_sil680 0000:60:02.0: sil680: BA5_EN = 1 clock = 00
> pata_sil680 0000:60:02.0: sil680: BA5_EN = 1 clock = 10
> sil680: 133MHz clock.
> Backtrace:
>  [<00000000401ad0c4>] handle_percpu_irq+0xbc/0xf8
>  [<00000000401a62c4>] generic_handle_irq+0x4c/0x68
>  [<00000000401062a4>] syscall_do_resched+0x28/0x34
>  [<000000004011e1f8>] execute_on_irq_stack+0x70/0xb8
....
> 
> If I hack the driver to enable MMIO, I have the following backtrace :
> scsi2 : pata_sil680
> scsi3 : pata_sil680
> ata1: PATA max UDMA/133 irq 71
> ata2: PATA max UDMA/133 irq 71
> scsi 3:0:0:0: CD-ROM            HL-DT-ST DVDRAM GSA-4082B A208 PQ: 0 ANSI: 5
> ata2.00: configured for UDMA/66
> sr0: scsi3-mmc drive: 32x/32x writer dvd-ram cd/rw xa/form2 cdda tray
> cdrom: Uniform CD-ROM driver Revision: 3.20
> sr 3:0:0:0: Attached scsi CD-ROM sr0
> sr 3:0:0:0: Attached scsi generic sg1 type 5
>  [<00000000401ad0c4>] handle_percpu_irq+0xbc/0xf8
>  [<00000000401a62c4>] generic_handle_irq+0x4c/0x68
>  [<00000000401062a4>] syscall_do_resched+0x28/0x34
> 
> 
> With MMIO, it goes a little bit further as it detects the drive correctly but eventually fails the same way.
> 
> As far as I understand the backtrace, it would seem that an IRQ
> handler function pointer is set to NULL or some NULL pointer deref
> occurs in the IRQ handler. Also, this is not the original DVD drive
> from the C8000. I replaced it with a DVD burner.> 
> How idea what can be the issue ?

I'm just guessing here since I would need to test myself.
But James Bottomley found once, that the secondary port of the cmd64x controller
was not completely wired physically up on parisc.
He posted a patch series here:  
http://www.spinics.net/lists/linux-ide/msg40816.html
Maybe there is some similarity for pata_sil680 too, esp. since it seems from
the log above that you connected your DVD drive to the secondary port (scsi3).
What happens if you connect it to scsi2/the first pata port instead? 

Helge
