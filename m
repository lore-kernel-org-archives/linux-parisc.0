From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Anyone want a task?
Date: Sat, 28 Aug 2004 16:19:09 +0100
Message-ID: <20040828151909.GB16196@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

----- Forwarded message from Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl> -----

From: Bartlomiej Zolnierkiewicz <bzolnier@elka.pw.edu.pl>
Reply-To: bzolnier@milosz.na.pl
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [PATCH] PA-RISC IDE update
Date: Sat, 28 Aug 2004 17:08:35 +0200
User-Agent: KMail/1.6.2
In-Reply-To: <20040814221440.GE12936@parcelfarce.linux.theplanet.co.uk>


Hi,

On Sunday 15 August 2004 00:14, you wrote:
> Hi Bart
>
> Yet another patch to fix SuckyIO IDE on PA-RISC workstations.  SPARC64
> doesn't define CONFIG_SUPERIO so definitely won't be affected by this
> patch.

applied but SuckyIO workarounds should be later moved from superio.c to 
ns87415.c - no code outside drivers/ide/ should know anything about internal 
IDE driver structures such as struct hwif_s (ide_hwif_t) - please  fix it

thanks

> diff -urpNX dontdiff linus-2.6/drivers/ide/pci/ns87415.c
> parisc-2.6/drivers/ide/pci/ns87415.c ---
> linus-2.6/drivers/ide/pci/ns87415.c	Sat Aug 14 11:16:33 2004
> +++ parisc-2.6/drivers/ide/pci/ns87415.c	Sat Aug 14 11:05:30 2004
> @@ -24,6 +24,9 @@
>  #include <linux/init.h>
>
>  #include <asm/io.h>
> +#ifdef CONFIG_SUPERIO
> +#include <asm/superio.h>
> +#endif
>
>  static unsigned int ns87415_count = 0, ns87415_control[MAX_HWIFS] = { 0 };
>
> @@ -128,6 +131,13 @@ static int ns87415_ide_dma_check (ide_dr
>  	if (drive->media != ide_disk)
>  		return HWIF(drive)->ide_dma_off_quietly(drive);
>  	return __ide_dma_check(drive);
> +}
> +
> +static void __init init_iops_ns87415(ide_hwif_t *hwif)
> +{
> +#ifdef CONFIG_SUPERIO
> +	superio_ide_init_iops(hwif);
> +#endif
>  }
>
>  static void __init init_hwif_ns87415 (ide_hwif_t *hwif)

----- End forwarded message -----

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
