Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25452482A
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Mar 2004 08:07:24 -0700 (MST)
Date: Tue, 23 Mar 2004 16:07:14 +0100
Message-ID: <40561EAF00005B43@ocpmta1.freegates.net>
In-Reply-To: <402A42A100007F17@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

I come back to you with more relevant info (I hope)
>I'm pretty sure it will look like this:
>RAM      Phys Address
>0-2GB -> 0-2GB
>      -> 2-4GB I/O Space (mostly PCI MMIO)
>2-4GB -> 4-6GB (courtesy of the memory controller)
>
>The N-class was the first box which has an I/O hole from 2-4GB
>physical address range. I hope Joel will be able to confirm this.
>If not, I likely have documentation to confirm this.
>
I added some more printk as follow:
in arch/parisc/kernel/inventory.c

static void __init pat_memconfig(void)
{
        unsigned long actual_len;
        struct pdc_pat_pd_addr_map_entry mem_table[PAT_MAX_RANGES+1];
        struct pdc_pat_pd_addr_map_entry *mtbl_ptr;
        physmem_range_t *pmem_ptr;
        long status;
        int entries;
        unsigned long length;
        int i;

        length = (PAT_MAX_RANGES + 1) * sizeof(struct pdc_pat_pd_addr_map_entry);

        status = pdc_pat_pd_get_addr_map(&actual_len, mem_table, length,
0L);

/* JSO S */
        if ((status == PDC_OK)) {
                printk("Status == PDC_OK.\n");
                printk("Sizeof(struct pdc_pat_pd_addr_map_entry) = %d.\n",
sizeof(struct pdc_pat_pd_addr_map_entry));
                printk("actual_len = %ld.\n", actual_len);
                printk("length = %ld.\n", length);
        }
/* JSO E */
        if ((status != PDC_OK)
            || ((actual_len % sizeof(struct pdc_pat_pd_addr_map_entry)) !=
0)) {

                /* The above pdc call shouldn't fail, but, just in
                 * case, just use the PAGE0 info.
                 */

                printk("\n\n\n");
                printk(KERN_WARNING "WARNING! Could not get full memory configuration.
"
                        "All memory may not be used!\n\n\n");
                pagezero_memconfig();
                return;
        }

        entries = actual_len / sizeof(struct pdc_pat_pd_addr_map_entry);
        printk("entries = %d.\n", entries);

        if (entries > PAT_MAX_RANGES) {
                printk(KERN_WARNING "This Machine has more memory ranges
than we support!\n");
                printk(KERN_WARNING "Some memory may not be used!\n");
        }

        /* Copy information into the firmware independent pmem_ranges
         * array, skipping types we don't care about. Notice we said
         * "may" above. We'll use all the entries that were returned.
         */

        npmem_ranges = 0;
        mtbl_ptr = mem_table;
        pmem_ptr = pmem_ranges; /* Global firmware independent table */
        for (i = 0; i < entries; i++,mtbl_ptr++) {
                if (   (mtbl_ptr->entry_type != PAT_MEMORY_DESCRIPTOR)
                    || (mtbl_ptr->memory_type != PAT_MEMTYPE_MEMORY)
                    || (mtbl_ptr->pages == 0)
                    || (   (mtbl_ptr->memory_usage != PAT_MEMUSE_GENERAL)
                        && (mtbl_ptr->memory_usage != PAT_MEMUSE_GI)
                        && (mtbl_ptr->memory_usage != PAT_MEMUSE_GNI) ) )
{

                        continue;
                }

                if (npmem_ranges == MAX_PHYSMEM_RANGES) {
                        printk(KERN_WARNING "This Machine has more memory
ranges than we support!\n");
                        printk(KERN_WARNING "Some memory will not be used!\n");
                        break;
                }

                set_pmem_entry(pmem_ptr++,mtbl_ptr->paddr,mtbl_ptr->pages);
                npmem_ranges++;
        }
        for (i = 0; i < entries; i++)
                printk("pmem_ranges[%d].pages = %ld.\n", i, pmem_ranges[i].pages);
        printk("npmem_ranges = %d.\n", npmem_ranges);
}

arch/parisc/mm/init.c
static void __init setup_bootmem(void)
{
[snip]
#ifndef CONFIG_DISCONTIGMEM
        /*
         * Sort the ranges. Since the number of ranges is typically
         * small, and performance is not an issue here, just do
         * a simple insertion sort.
         */

        printk("npmem_ranges = %d.(line 143)\n", npmem_ranges);
        for (i = 1; i < npmem_ranges; i++) {
                int j;

                for (j = i; j > 0; j--) {
                        unsigned long tmp;

                        if (pmem_ranges[j-1].start_pfn <
                            pmem_ranges[j].start_pfn) {

                                break;
                        }
                        tmp = pmem_ranges[j-1].start_pfn;
                        pmem_ranges[j-1].start_pfn = pmem_ranges[j].start_pfn;
                        pmem_ranges[j].start_pfn = tmp;
                        tmp = pmem_ranges[j-1].pages;
                        pmem_ranges[j-1].pages = pmem_ranges[j].pages;
                        pmem_ranges[j].pages = tmp;
                }
        }

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
                printk("MAX_GAP = %ld.\n", MAX_GAP);
                if (pmem_ranges[i].start_pfn -
                        (pmem_ranges[i-1].start_pfn +
                         pmem_ranges[i-1].pages) > MAX_GAP) {
                        npmem_ranges = i;<=====================[ref1.]
                        break;
                }
        }
#endif

        printk("npmem_ranges = %d.(line 186)\n", npmem_ranges);
        if (npmem_ranges > 1) {
[snip]

<==== return by pat_memconfig() ====>
Status == PDC_OK.
Sizeof(struct pdc_pat_pd_addr_map_entry) = 32.
actual_len = 64.
length = 1056.
entries = 2.
pmem_ranges[0].pages = 524288.
pmem_ranges[1].pages = 524288.
npmem_ranges = 2.

So pat_memconfig() returns well 2 entries of 2Gb Ok

<==== return by setup_bootmem() ====>
npmem_ranges = 2.(line 143)
npmem_ranges = 2.(line 171)
pmem_ranges[0].start_pfn = 524288.
pmem_ranges[0].pages = 524288.
pmem_ranges[1].start_pfn = 524288.
MAX_GAP = 262144.
npmem_ranges = 1.(line 186)
pmem_ranges[0].pages = 524288.

So here only one entry is scan because of condition ([ref1]) but I have no
clue of the actual meaning of this condition. Thanks in advance for info
:)

RSize = 2147483648.
Total Memory: 2048 Mb
On node 0 totalpages: 524288

Thanks,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
