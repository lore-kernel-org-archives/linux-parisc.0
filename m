From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: compile failure on hppa64: pte_mkwrite
Date: Fri, 14 Jan 2011 15:15:59 -0800
Message-ID: <4D30D92F.20106@xenotime.net>
References: <alpine.SOC.1.00.1101150057210.8462@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1101150057210.8462@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/14/11 14:59, Meelis Roos wrote:
> Tried todays 2.6.37+git on hppa64 and it fail to compile:
> 
>   CC      arch/parisc/kernel/asm-offsets.s
> In file included from /home/mroos/linux-2.6/arch/parisc/include/asm/pgtable.h:13,
>                  from arch/parisc/kernel/asm-offsets.c:37:
> include/linux/mm.h: In function 'maybe_mkwrite':
> include/linux/mm.h:482: error: implicit declaration of function 'pte_mkwrite'
> include/linux/mm.h:482: error: incompatible types when assigning to type 'pte_t' from type 'int'
> In file included from arch/parisc/kernel/asm-offsets.c:37:
> /home/mroos/linux-2.6/arch/parisc/include/asm/pgtable.h: At top level:
> /home/mroos/linux-2.6/arch/parisc/include/asm/pgtable.h:338: error: conflicting types for 'pte_mkwrite'
> include/linux/mm.h:482: note: previous implicit declaration of 'pte_mkwrite' was here
> make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
> make: *** [prepare0] Error 2
> 
> It seems pte_mkwrite is referenced in mm.h but not defined anywhere in 
> include directory.
> 

James posted a patch:

http://marc.info/?l=linux-parisc&m=129504371532124&w=2

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
