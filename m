From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [mingo@elte.hu: [patch] spinlock consolidation, v2]
Date: Sun, 05 Jun 2005 19:13:27 +0000
Message-ID: <42A34ED7.7040205@tiscali.be>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<42A19697.8010501@tiscali.be>
	<20050604180302.GB19823@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050604180302.GB19823@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,

Grant Grundler wrote:
> On Sat, Jun 04, 2005 at 11:55:03AM +0000, Joel Soete wrote:
> ...
> 
>>Any way it failled to compile very early with following messages:
> 
> ...
> 
>>include2/asm/system.h:174: error: syntax error before "pa_tlb_lock"
> 
> 
> It's because of the obscene parisc interdependence between
> system.h, bitops.h, and spinlock.h.
> Mingo's patch will help break up that a bit better.
> 
> I'm working on fixing that up. Two of the commits I made
> last night are small steps in that direction.
> 
Much for record: after latest pa3 co (and a make clean), I still get the same error:
   gcc -Wp,-MD,arch/parisc/kernel/.asm-offsets.s.d  -nostdinc -isystem /usr/lib/gcc-lib/hppa-linux/3.3.5/include -D__KERNEL__ 
-Iinclude -Iinclude2 -I/usr/src/linux-2.6.12-rc5-pa3-050604/include -I/usr/src/linux-2.6.12-rc5-pa3-050604/arch/parisc/kernel 
-Iarch/parisc/kernel -Wall -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2 
-fomit-frame-pointer -pipe -mno-space-regs -mfast-indirect-calls -ffunction-sections -march=1.1 -mschedule=7200 
-DKBUILD_BASENAME=asm_offsets -DKBUILD_MODNAME=asm_offsets -S -o arch/parisc/kernel/asm-offsets.s 
/usr/src/linux-2.6.12-rc5-pa3-050604/arch/parisc/kernel/asm-offsets.c
                       ^^^^^^^^^^^^^^
In file included from include2/asm/atomic.h:17,
                  from include2/asm/bitops.h:8,
                  from /usr/src/linux-2.6.12-rc5-pa3-050604/include/linux/bitops.h:77,
                  from /usr/src/linux-2.6.12-rc5-pa3-050604/include/linux/thread_info.h:20,
                  from /usr/src/linux-2.6.12-rc5-pa3-050604/include/linux/spinlock.h:51,
                  from /usr/src/linux-2.6.12-rc5-pa3-050604/include/linux/capability.h:45,
                  from /usr/src/linux-2.6.12-rc5-pa3-050604/include/linux/sched.h:7,
                  from /usr/src/linux-2.6.12-rc5-pa3-050604/arch/parisc/kernel/asm-offsets.c:31:
include2/asm/spinlock.h:11: error: syntax error before '*' token
include2/asm/spinlock.h:12: warning: function declaration isn't a prototype
include2/asm/spinlock.h: In function `__raw_spin_is_locked':
include2/asm/spinlock.h:13: error: `x' undeclared (first use in this function)
[...]

seems that's because spinlock_t (which became raw_spinlock_t and move to asm/spinlock_types.h) was removed from asm-parisc/system.h

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
