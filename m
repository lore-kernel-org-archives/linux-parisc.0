Return-Path: <soete.joel@tiscali.be>
Date: Mon, 3 May 2004 10:57:34 +0200
Message-ID: <408D436000004559@ocpmta1.freegates.net>
In-Reply-To: <1083442151.2030.27.camel@mulgrave>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
To: "James Bottomley" <James.Bottomley@steeleye.com>,
	"PARISC list" <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux-cvs@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Modified files:
> 	.              : Makefile 
> 	arch/parisc/kernel: asm-offsets.c entry.S head64.S 
> 	i
> clude/asm-parisc: page.h pgalloc.h pgtable.h 
> 
> Log message:
> Increase the maximum physical and virtual space available to
> the 64 bit kernel from 512GB to 8TB
> 

Sincerely nice job but how will it permit me to access at least to the only
all 4GB of the N4k I test when setup_bootmem() limits actually the usage
to the first 2Gb?

For remind:
 arch/parisc/mm/init.c
static void __init setup_bootmem(void)
{
[snip]
        /*
         * Throw out ranges that are too far apart (controlled by
         * MAX_GAP). If CONFIG_DISCONTIGMEM wasn't implemented so
         * poorly, we would recommend enabling that option, but,
         * until it is fixed, this is the best way to go.
         */

        printk("npmem_ranges = %d.(line 171)\n", npmem_ranges);
        for (i = 1; i < npmem_ranges; i++) {
              printk("pmem_ranges[%d].start_pfn = %ld.\n", i-1, pmem_ranges[i-1].pages);
                printk("pmem_ranges[%d].pages = %ld.\n", i-1, pmem_ranges[i-1].pages);
                printk("pmem_ranges[%d].start_pfn = %ld.\n", i, pmem_ranges[i].pages);
[snip]
           
And actual results would be:
<==== return by setup_bootmem() ====>
pmem_ranges[0].start_pfn = 0.
pmem_ranges[0].pages = 524288.
pmem_ranges[1].start_pfn = 1572864.

so 1572864-524288-0=1048576 greater then MAX_GAP = 262144.

I also investigate the choice of using CONFIG_DISCONTIGMEM but as far as
I understand this option is foreseen when each processor has its own ram
and can/want access the ram of the others (as on sun 6800): not the N4k case
where all ram is shared between all processor?

Thanks again for your attention,
   Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
