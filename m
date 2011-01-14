From: Meelis Roos <mroos@linux.ee>
Subject: compile failure on hppa64: pte_mkwrite
Date: Sat, 15 Jan 2011 00:59:49 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1101150057210.8462@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Tried todays 2.6.37+git on hppa64 and it fail to compile:

  CC      arch/parisc/kernel/asm-offsets.s
In file included from /home/mroos/linux-2.6/arch/parisc/include/asm/pgtable.h:13,
                 from arch/parisc/kernel/asm-offsets.c:37:
include/linux/mm.h: In function 'maybe_mkwrite':
include/linux/mm.h:482: error: implicit declaration of function 'pte_mkwrite'
include/linux/mm.h:482: error: incompatible types when assigning to type 'pte_t' from type 'int'
In file included from arch/parisc/kernel/asm-offsets.c:37:
/home/mroos/linux-2.6/arch/parisc/include/asm/pgtable.h: At top level:
/home/mroos/linux-2.6/arch/parisc/include/asm/pgtable.h:338: error: conflicting types for 'pte_mkwrite'
include/linux/mm.h:482: note: previous implicit declaration of 'pte_mkwrite' was here
make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1
make: *** [prepare0] Error 2

It seems pte_mkwrite is referenced in mm.h but not defined anywhere in 
include directory.

-- 
Meelis Roos (mroos@linux.ee)
