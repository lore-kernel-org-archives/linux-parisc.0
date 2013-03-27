From: Fengguang Wu <fengguang.wu@intel.com>
Subject: lib/mpi/generic_mpih-mul1.c:50:3: error: inconsistent operand
 constraints in an 'asm'
Date: Wed, 27 Mar 2013 09:06:56 +0800
Message-ID: <20130327010656.GB16102@localhost>
References: <5151d698.hmaj4mi8UziPZgoG%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Dmitry Kasatkin <dmitry.kasatkin@intel.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5151d698.hmaj4mi8UziPZgoG%fengguang.wu@intel.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Dmitry,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux master
head:   a12183c62717ac4579319189a00f5883a18dff08
commit: 5ce3e312ec5c11abce13215be70700778bf601f0 crypto: GnuPG based MPI lib - header files (part 2)
date:   1 year, 5 months ago
config: make ARCH=parisc allyesconfig

All error/warnings:

   In file included from lib/mpi/generic_mpih-mul1.c:30:0:
   lib/mpi/longlong.h:355:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   lib/mpi/generic_mpih-mul1.c: In function 'mpihelp_mul_1':
>> lib/mpi/generic_mpih-mul1.c:50:3: error: inconsistent operand constraints in an 'asm'
--
   In file included from lib/mpi/generic_mpih-mul2.c:30:0:
   lib/mpi/longlong.h:355:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   lib/mpi/generic_mpih-mul2.c: In function 'mpihelp_addmul_1':
>> lib/mpi/generic_mpih-mul2.c:49:3: error: inconsistent operand constraints in an 'asm'
--
   In file included from lib/mpi/generic_mpih-mul3.c:30:0:
   lib/mpi/longlong.h:355:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   lib/mpi/generic_mpih-mul3.c: In function 'mpihelp_submul_1':
>> lib/mpi/generic_mpih-mul3.c:49:3: error: inconsistent operand constraints in an 'asm'
--
   In file included from lib/mpi/mpih-div.c:31:0:
   lib/mpi/longlong.h:355:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
   lib/mpi/mpih-div.c: In function 'mpihelp_mod_1':
>> lib/mpi/mpih-div.c:97:5: error: inconsistent operand constraints in an 'asm'
>> lib/mpi/mpih-div.c:97:5: error: inconsistent operand constraints in an 'asm'
>> lib/mpi/mpih-div.c:106:4: error: inconsistent operand constraints in an 'asm'
>> lib/mpi/mpih-div.c:106:4: error: inconsistent operand constraints in an 'asm'
>> lib/mpi/mpih-div.c:135:5: error: inconsistent operand constraints in an 'asm'
>> lib/mpi/mpih-div.c:135:5: error: inconsistent operand constraints in an 'asm'

vim +/asm +50 lib/mpi/generic_mpih-mul1.c

cdec9cb5 Dmitry Kasatkin 2011-08-31  34  	      mpi_limb_t s2_limb)
cdec9cb5 Dmitry Kasatkin 2011-08-31  35  {
cdec9cb5 Dmitry Kasatkin 2011-08-31  36  	mpi_limb_t cy_limb;
cdec9cb5 Dmitry Kasatkin 2011-08-31  37  	mpi_size_t j;
cdec9cb5 Dmitry Kasatkin 2011-08-31  38  	mpi_limb_t prod_high, prod_low;
cdec9cb5 Dmitry Kasatkin 2011-08-31  39  
cdec9cb5 Dmitry Kasatkin 2011-08-31  40  	/* The loop counter and index J goes from -S1_SIZE to -1.  This way
cdec9cb5 Dmitry Kasatkin 2011-08-31  41  	 * the loop becomes faster.  */
cdec9cb5 Dmitry Kasatkin 2011-08-31  42  	j = -s1_size;
cdec9cb5 Dmitry Kasatkin 2011-08-31  43  
cdec9cb5 Dmitry Kasatkin 2011-08-31  44  	/* Offset the base pointers to compensate for the negative indices.  */
cdec9cb5 Dmitry Kasatkin 2011-08-31  45  	s1_ptr -= j;
cdec9cb5 Dmitry Kasatkin 2011-08-31  46  	res_ptr -= j;
cdec9cb5 Dmitry Kasatkin 2011-08-31  47  
cdec9cb5 Dmitry Kasatkin 2011-08-31  48  	cy_limb = 0;
cdec9cb5 Dmitry Kasatkin 2011-08-31  49  	do {
cdec9cb5 Dmitry Kasatkin 2011-08-31 @50  		umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
cdec9cb5 Dmitry Kasatkin 2011-08-31  51  		prod_low += cy_limb;
cdec9cb5 Dmitry Kasatkin 2011-08-31  52  		cy_limb = (prod_low < cy_limb ? 1 : 0) + prod_high;
cdec9cb5 Dmitry Kasatkin 2011-08-31  53  		res_ptr[j] = prod_low;
cdec9cb5 Dmitry Kasatkin 2011-08-31  54  	} while (++j);
cdec9cb5 Dmitry Kasatkin 2011-08-31  55  
cdec9cb5 Dmitry Kasatkin 2011-08-31  56  	return cy_limb;
cdec9cb5 Dmitry Kasatkin 2011-08-31  57  }



---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
