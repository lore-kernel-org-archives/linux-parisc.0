From: Joel Soete <soete.joel@tiscali.be>
Subject: [id]cache meaning? [Was: [parisc-linux] 2.6.10-rc1-pa11 profile data]
Date: Sun, 28 Nov 2004 21:01:42 +0000
Message-ID: <41AA3CB6.5070407@tiscali.be>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111081154.GR15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,


Randolph Chung wrote:
>>I've collect two profiles for -64SMP and will collect
>>some UP profiles tomorrow. profiles so far are measuring
>>a full kernel build. I expect I'll do the same for -64UP
>>kernels too.
> 
> 
> hmm.. interesting. top consumers are (with idle loop functions removed)
> 
>  40646 flush_kernel_icache_page                 406.4600
>   7364 fdsync                                   368.2000
>  10567 flush_user_dcache_range_asm              293.5278
>  10387 flush_user_icache_range_asm              288.5278

I have additional question about such functions:

	* in parisc above ..._dcache_... refer well to data cache?
	* and respectively ..._icache_... refer to instruction cache?

Have they different meaning for generic linux?

The confusion came for me from:

include/asm-parisc/cacheflush.h:
[...]
#define flush_icache_page(vma,page)   do { flush_kernel_dcache_page(page_address(page)); 
flush_kernel_icache_page(page_address(page)); } while (0)
[...]

Thanks again,
	Joel

PS: I didn't suspect any error, I am just confused :(


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
