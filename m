From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Thu, 08 Apr 2010 23:11:41 +0200
Message-ID: <4BBE468D.5060609@gmx.de>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de> <4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org> <4BB5594C.8050505@fsij.org> <1270179025.18981.19.camel@mulgrave.site> <4BB568FB.1090908@fsij.org> <4BB5A557.2000405@fsij.org> <20100402193514.GA9860@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	NIIBE Yutaka <gniibe@fsij.org>, linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100402193514.GA9860@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 04/02/2010 09:35 PM, John David Anglin wrote:
> On Fri, 02 Apr 2010, NIIBE Yutaka wrote:
> 
>> NIIBE Yutaka wrote:
>>> To have same semantics as other archs, I think that VIPT-WB cache
>>> machine should have cache flush at ptep_set_wrprotect, so that memory
>>> of the page has up-to-date data.  Yes, it will be huge performance
>>> impact for fork.  But I don't find any good solution other than this
>>> yet.
>>
>> I think we could do something like (only for VIPT-WB cache machine):
>>
>> -	static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long 
>> address, pte_t *ptep)
>>
>> +	static inline void ptep_set_wrprotect(struct vm_area_struct *vma, struct 
>> mm_struct *mm, unsigned long addr, pte_t *ptep)
>> 	{
>> 		pte_t old_pte = *ptep;
>> +		if (atomic_read(&mm->mm_users) > 1)
>> +			flush_cache_page(vma, addr, pte_pfn(old_pte));
>> 		set_pte_at(mm, addr, ptep, pte_wrprotect(old_pte));
>> 	}
> 
> I tested the hack below on two machines currently running 2.6.33.2
> UP kernels.  The change seems to fix Debian #561203 (minifail bug)!
> Thus, I definitely think you are on the right track.  I'll continue
> to test.
> 
> I suspect the same issue is present for SMP kernels.

Hi Dave,

I tested your patch today on one of my machines with plain kernel 2.6.33 (32bit, SMP, B2000 I think).
Sadly I still did see the minifail bug.

Are you sure, that the patch fixed this bug for you?

Helge

do_page_fault() pid=21470 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=7986 command='minifail3' type=6 address=0x00000003                                                                                 
do_page_fault() pid=19952 command='minifail3' type=6 address=0x00000003                                                                                
do_page_fault() pid=13549 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=21862 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=4615 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=17336 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=21986 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=2157 command='minifail3' type=15 address=0x000000dc
do_page_fault() pid=23886 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=2681 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=3229 command='minifail3' type=15 address=0x000000ec
do_page_fault() pid=26095 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=20722 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=19912 command='minifail3' type=15 address=0x000000ec
...
pagealloc: memory corruption
7db0c780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
7db0c790: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
7db0c7a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
7db0c7b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
Backtrace:
 [<1011ec14>] show_stack+0x18/0x28
 [<10117ba0>] dump_stack+0x1c/0x2c
 [<101c6594>] kernel_map_pages+0x2a0/0x2b8
 [<1019e6c8>] get_page_from_freelist+0x3d4/0x614
 [<1019ea3c>] __alloc_pages_nodemask+0x134/0x610
 [<101b1d20>] do_wp_page+0x268/0xac0
 [<101b3b34>] handle_mm_fault+0x4d4/0x7c4
 [<1011d854>] do_page_fault+0x1f8/0x2fc
 [<1011f450>] handle_interruption+0xec/0x730
 [<10103078>] intr_check_sig+0x0/0x34
...
do_page_fault() pid=13414 command='minifail3' type=15 address=0x000000dc
do_page_fault() pid=22776 command='minifail3' type=15 address=0x00000000
do_page_fault() pid=26290 command='minifail3' type=15 address=0x000000ec
do_page_fault() pid=1399 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=16130 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=26401 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=3383 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=3400 command='minifail3' type=15 address=0x00000004
do_page_fault() pid=18659 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=3730 command='minifail3' type=6 address=0x00000003
do_page_fault() pid=28828 command='minifail3' type=6 address=0x00000003
