From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] trivial patch for CONFIG_DEBUG_RWLOCK: pb to build
	kernel but ...
Date: Wed, 1 Dec 2004 11:45:42 +0100
Message-ID: <418A8025000099B9@mail-2-bnl.tiscali.it>
References: <418A8131000077FC@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A8131000077FC@mail-7-bnl.tiscali.it>
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
> 

> And so I tried to compile kernel with CONFIG_DEBUG_RWLOCK=3Dy
> 
> but unfortuantely it early failed to build:
>   hppa64-linux-gcc -Wp,-MD,kernel/.spinlock.o.d -nostdinc -iwithprefix
include
> -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -Wno-trigraphs -fno-s=
trict-aliasing
> -fno-common -O2 -fomit-frame-pointer -pipe -mno-space-regs -mfast-indir=
ect-calls
> -ffunction-sections -march=3D2.0 -mschedule=3D8000 -Wdeclaration-after-=
statement
>    -DKBUILD_BASENAME=3Dspinlock -DKBUILD_MODNAME=3Dspinlock -c -o kerne=
l/spinlock.o
> kernel/spinlock.c
> kernel/spinlock.c: In function `_write_trylock':
> kernel/spinlock.c:28: void value not ignored as it ought to be
> make[1]: *** [kernel/spinlock.o] Error 1
> make: *** [kernel] Error 2
> 
this trivial patch fix the pb of compilation:
--- include/asm-parisc/spinlock.h.Orig	2004-12-01 11:00:47.428581204 +010=
0
+++ ./include/asm-parisc/spinlock.h	2004-12-01 10:34:58.469054337 +0100
@@ -223,7 +223,7 @@
 }
 
 #ifdef CONFIG_DEBUG_RWLOCK
-extern void _dbg_write_trylock(rwlock_t * rw, const char *bfile, int bli=
ne);
+extern int _dbg_write_trylock(rwlock_t * rw, const char *bfile, int blin=
e);
 #define _raw_write_trylock(rw) _dbg_write_trylock(rw, __FILE__, __LINE__=
)
 #else
 static  __inline__ int _raw_write_trylock(rwlock_t *rw)
=3D=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D

but unfortunately failled to boot:
NET: Registered protocol family 16
write_lock caller: kernel/spinlock.c:211, IRQs enabled,
                                                       kernel BUG at arch=
/parisc/lib/debuglocks.c:171!
Backtrace:
 [<0000000010384ec0>] sock_alloc_inode+0x28/0x90
 [<000000001019ae1c>] check_spinlock_acquired+0x24/0xb8
 [<00000000101146a8>] dump_stack+0x20/0x38
 [<00000000102b4240>] _dbg_write_lock+0x248/0x260
 [<000000001019d20c>] cache_alloc_debugcheck_after+0x16c/0x218
 [<0000000010110a28>] _write_lock_bh+0x38/0x50
 [<00000000103b2a4c>] netlink_table_grab+0x2c/0x150
 [<00000000103b2e0c>] netlink_insert+0x64/0x2d0
 [<0000000010386760>] sock_create_lite+0x30/0x68
 [<00000000103b602c>] netlink_kernel_create+0xcc/0xf8
 [<0000000010111afc>] init+0x28c/0x478
 [<000000001010647c>] ret_from_kernel_thread+0x24/0x38

Kernel panic - not syncing: BUG!

this is comming from:

int _dbg_write_trylock(rwlock_t *rw, const char *bfile, int bline)
{
#if 0
	void *inline_pc =3D __builtin_return_address(0);
	int cpu =3D smp_processor_id();
#endif
	
	if(unlikely(in_interrupt())) {	/* acquiring write lock in interrupt cont=
ext,
bad idea */
		pdc_printf("write_lock caller: %s:%d, IRQs enabled,\n", bfile, bline);
		BUG();
	}

Any idea,
    Joel

-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
