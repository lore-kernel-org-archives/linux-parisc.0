From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached to the pgd
Date: Tue, 14 Jul 2015 08:01:01 -0400
Message-ID: <BLU436-SMTP93AAFE2533CA8B6DDB478E979B0@phx.gbl>
References: <55A408F5.601@gmx.de> <55A4095E.4060200@gmx.de> <BLU436-SMTP242FD91860D61AA98A01389979B0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	"jejb@parisc-linux.org Bottomley" <jejb@parisc-linux.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Linux Kernel list <linux-kernel@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP242FD91860D61AA98A01389979B0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Faulting instruction is:
    4021a11c:   0f 38 12 d0     std r24,8(r25)

Register r25 is misaligned by 1.

Dave

On 2015-07-14, at 7:52 AM, John David Anglin wrote:

> Sadly, it appears we are not out of the woods yet:
> 
> mx3210 login: Backtrace:
> [<000000004021c904>] free_hot_cold_page+0x234/0x250
> [<000000004021c974>] free_hot_cold_page_list+0x54/0x90
> [<0000000040224f28>] release_pages+0x308/0x3f0
> [<0000000040226ae8>] __pagevec_release+0x58/0x78
> [<00000000402287f4>] invalidate_mapping_pages+0x244/0x258
> [<000000004029c284>] inode_lru_isolate+0x1e4/0x2b0
> [<0000000040240f34>] __list_lru_walk_one.isra.4+0xc4/0x1c0
> [<00000000402411bc>] list_lru_walk_one+0x64/0x80
> [<000000004029cc2c>] prune_icache_sb+0x54/0x88
> [<000000004027c564>] super_cache_scan+0x2a4/0x308
> [<0000000040228d6c>] shrink_slab+0x34c/0x408
> [<000000004022d23c>] shrink_zone+0x2bc/0x2c8
> [<000000004022e0d4>] kswapd+0x6a4/0xb70
> [<00000000401a5e14>] kthread+0x144/0x178
> [<0000000040145020>] end_fault_vector+0x20/0x28
> [<0000000014281000>] 0x14281000
> 
> 
> Kernel Fault: Code=15 regs=000000007c749020 (Addr=0000000000001841)
> CPU: 2 PID: 286 Comm: kswapd2 Not tainted 4.0.8+ #1
> task: 000000007f75f528 ti: 000000007c748000 task.ti: 000000007c748000
> 
>     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001101111111100001110 Not tainted
> r00-03  000000ff0806ff0e 0000000000000000 0000000040766a40 000000007c748f00
> r04-07  00000000406eac70 00000000421d1540 0000000000000040 0000000040766940
> r08-11  ffffffffffffff80 0000000000000013 0000000000200200 0000000000100100
> r12-15  0000000000000001 ffffffffffffffff 00000000407fd980 00000000427ea580
> r16-19  0000000000000013 00000000427ea5b0 0000000000000002 00000000427ea5a0
> r20-23  000000007c748ff0 0000000040766a40 0000000000000020 0000000040766980
> r24-27  00000000421d1560 0000000000001839 0000000000000000 00000000406eac70
> r28-31  0000000000000000 0000000000000000 000000007c749020 0000000000000040
> sr00-03  0000000000b45800 0000000001060800 0000000000000000 0000000000b45800
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004021a11c 000000004021a120
> IIR: 0f3812d0    ISR: 0000000000000000  IOR: 0000000000001841
> CPU:        2   CR30: 000000007c748000 CR31: 572c033000297031
> ORIG_R28: 000000007c749210
> IAOQ[0]: free_pcppages_bulk+0x34c/0x470
> IAOQ[1]: free_pcppages_bulk+0x350/0x470
> RP(r2): 0x40766a40
> Backtrace:
> [<000000004021c904>] free_hot_cold_page+0x234/0x250
> [<000000004021c974>] free_hot_cold_page_list+0x54/0x90
> [<0000000040224f28>] release_pages+0x308/0x3f0
> [<0000000040226ae8>] __pagevec_release+0x58/0x78
> [<00000000402287f4>] invalidate_mapping_pages+0x244/0x258
> [<000000004029c284>] inode_lru_isolate+0x1e4/0x2b0
> [<0000000040240f34>] __list_lru_walk_one.isra.4+0xc4/0x1c0
> [<00000000402411bc>] list_lru_walk_one+0x64/0x80
> [<000000004029cc2c>] prune_icache_sb+0x54/0x88
> [<000000004027c564>] super_cache_scan+0x2a4/0x308
> [<0000000040228d6c>] shrink_slab+0x34c/0x408
> [<000000004022d23c>] shrink_zone+0x2bc/0x2c8
> [<000000004022e0d4>] kswapd+0x6a4/0xb70
> [<00000000401a5e14>] kthread+0x144/0x178
> [<0000000040145020>] end_fault_vector+0x20/0x28
> [<0000000014281000>] 0x14281000
> 
> Kernel panic - not syncing: Kernel Fault
> ---[ end Kernel panic - not syncing: Kernel Fault
> 
> This is with:
> Linux version 4.0.8+ (dave@mx3210) (gcc version 4.9.3 (GCC) ) #1 SMP Mon Jul 13 18:47:55 EDT 2015
> 
> Dave
> 
> On 2015-07-13, at 2:54 PM, Helge Deller wrote:
> 
>> COOL !!!
>> I think this is our kernel 4.0 OOM bugfix !!
>> 
>> Helge
>> 
>> 
>> -------- Forwarded Message --------
>> Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached to the pgd
>> Date: Mon, 13 Jul 2015 20:52:37 +0200
>> From: Helge Deller <deller@gmx.de>
>> To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jejb@parisc-linux.org, mpatocka@redhat.com, kirill.shutemov@linux.intel.com
>> CC: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, John David Anglin <dave.anglin@bell.net>, Meelis Roos <mroos@linux.ee>
>> 
>> Hi Christophe,
>> 
>> On 13.07.2015 11:32, Christophe JAILLET wrote:
>>> Commit 0e0da48dee8d ("parisc: mm: don't count preallocated pmds")
>>> introduced a memory leak.
>>> 
>>> After this commit, the 'return' statement in pmd_free is executed in all
>>> cases. Even for pmd that are not attached to the pgd.
>>> So 'free_pages' can never be called anymore, leading to a memory leak.
>> 
>> That's really great!!! Thanks for spotting this!
>> 
>> I assume this fixes the leak which killed our debian buildds with OOM
>> after an uptime of 1-4 days and which only happened since kernel 4.0.
>> Meelis Roos reported the issue already in this thread:
>> http://marc.info/?l=linux-parisc&m=142999113232154&w=2
>> 
>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> 
>> Acked-by: Helge Deller <deller@gmx.de>
>> 
>> 
>> Will this patch be pushed via linux-mm or another tree, if
>> not I can take it via the parisc tree?
>> 
>> 
>> Helge
>> 
>> 
>>> ---
>>> This patch is *untested* as I don't have the hardware to test it.
>>> 
>>> This is just a guess based on the indentation, the comment in the code
>>> and the commit log.
>>> ---
>>> arch/parisc/include/asm/pgalloc.h | 3 ++-
>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/arch/parisc/include/asm/pgalloc.h b/arch/parisc/include/asm/pgalloc.h
>>> index 3a08eae..f66d3738 100644
>>> --- a/arch/parisc/include/asm/pgalloc.h
>>> +++ b/arch/parisc/include/asm/pgalloc.h
>>> @@ -72,7 +72,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>>> 
>>> static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>>> {
>>> -	if(pmd_flag(*pmd) & PxD_FLAG_ATTACHED)
>>> +	if (pmd_flag(*pmd) & PxD_FLAG_ATTACHED) {
>>> 		/*
>>> 		 * This is the permanent pmd attached to the pgd;
>>> 		 * cannot free it.
>>> @@ -81,6 +81,7 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
>>> 		 */
>>> 		mm_inc_nr_pmds(mm);
>>> 		return;
>>> +	}
>>> 	free_pages((unsigned long)pmd, PMD_ORDER);
>>> }
>>> 
>>> 
>> 
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 
>> 
>> 
> 
> --
> John David Anglin	dave.anglin@bell.net
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--
John David Anglin	dave.anglin@bell.net



