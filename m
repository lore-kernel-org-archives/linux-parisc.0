From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] SLAB bug SMP 64bit / XFS mess
Date: Wed, 6 Apr 2005 14:17:17 +0200
Message-ID: <4208D51500017145@mail-5-bnl.tiscali.it>
References: <20050403033456.71a9cafa@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050403033456.71a9cafa@Tatooine.r3z0>
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

> Hi pa-ckers
> 
> tried 2.6.12-rc1-pa9 64bit SMP (gcc 3.3.5) with DEBUG_SLAB enabled, got=

> the following BUG:
> LBA version TR4.0 (0x5) found at 0xfffffffffed3c000
> kernel BUG at mm/slab.c:1495!
> Backtrace:
>  [<0000000010114480>] show_stack+0x60/0xf0

One thought about show_stack() (i.e. dump_stack()) :

its code looks like:
void show_stack(struct task_struct *task, unsigned long *s)
{
        struct unwind_frame_info info;

        if (!task) {
                unsigned long sp;
                struct pt_regs *r;

HERE:
                asm volatile ("copy %%r30, %0" : "=3Dr"(sp));
                r =3D (struct pt_regs *)kmalloc(sizeof(struct pt_regs), G=
FP_KERNEL);
                if (!r)
                        return;
...

while #if DEBUG in slab kmalloc will:
static inline kmem_cache_t *kmem_find_general_cachep(size_t size, int gfp=
flags)
{
        struct cache_sizes *csizep =3D malloc_sizes;

#if DEBUG
        /* This happens if someone tries to call  
        * kmem_cache_create(), or __kmalloc(), before
        * the generic caches are initialized.
        */
        BUG_ON(csizep->cs_cachep =3D=3D NULL);
#endif
...

(this special case appends to me when I tried to change BUG_ON() by WARN_=
ON()
in kernel/posix-cpu-timers.c
see <http://cvs.parisc-linux.org/linux-2.6/kernel/posix-cpu-timers.c?rev=3D=
1.3&view=3Dmarkup>
with following 
Badness in run_posix_cpu_timers at /CAD/linux-2.6.12-rc1-pa9-050401/kerne=
l/posi5
Backtrace:
 [<00000000101124e8>] dump_stack+0x18/0x28
 [<000000001015ed20>] run_posix_cpu_timers+0x168/0x1d0
 [<0000000010113648>] timer_interrupt+0xc8/0x178
 [<00000000101170b8>] real32_call+0xe0/0x110
 [<0000000010116624>] pdc_iodc_putc+0x9c/0x150
 [<00000000101686b4>] __do_IRQ+0x94/0x1e0
 [<0000000010116054>] pdc_tod_read+0xac/0x100
 [<0000000010116050>] pdc_tod_read+0xa8/0x100
 [<00000000103e6890>] proc_dodebug+0x0/0x2d0
 [<00000000103e64f0>] rpc_proc_register+0x0/0xb0
 [<00000000103e5de0>] rpc_unlink+0x0/0x1a8
 [<00000000103e5240>] rpc_depopulate+0x0/0x1f0
 [<00000000103e4cb0>] rpc_show_info+0x0/0xe8
 [<00000000103e4618>] rpc_alloc_inode+0x0/0x30
 [<00000000103e3ed0>] content_open+0x0/0xb0
 [<00000000103e35e0>] qword_addhex+0x0/0x110


Kernel Fault: Code=3D26 regs=3D000000001057cbe0 (Addr=3D0000000000000000)=


     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000000000001110 Not tainted
r00-03  0000000000000000 0000000010481e38 0000000010112680 00000000080000=
0f
r04-07  00000000105c0b40 00000000101124e8 000000001057cb60 000000001057c2=
e0
r08-11  0000000000000000 00000000105c9b40 0000000000000000 00000000105d86=
a4
r12-15  0000000000000000 00000000ffffffff 0000000000000000 00000000f04000=
04
r16-19  000000001057c2e0 00000000f000017c 00000000f0000174 00000000105662=
30
r20-23  000000000800000e 00000000000003ea 00000000000003ea 00000000006297=
7c
r24-27  ffffffffffffffff 00000000000000d0 0000000000000000 00000000105c0b=
40
r28-31  0000000000000066 000000001057cbb0 000000001057cbe0 00000000000000=
60
sr0-3   0000000000000000 0000000000000000 0000000000000000 00000000000000=
00
sr4-7   0000000000000000 0000000000000000 0000000000000000 00000000000000=
00

IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010176d20 0000000010=
176d24
 IIR: 0f4010d5    ISR: 0000000000000000  IOR: 0000000000000000
 CPU:        0   CR30: 000000001057c000 CR31: 0000000010580000
 ORIG_R28: 0000000000000000   
 IAOQ[0]: kmem_cache_alloc+0x18/0x60
 IAOQ[1]: kmem_cache_alloc+0x1c/0x60
 RP(r2): show_stack+0x80/0xf0 
Kernel panic - not syncing: Kernel Fault

a objdump of slab showing:
0000000000000000 <kmem_cache_alloc>:
   0:   0f c2 12 c1     std rp,-10(,sp)
   4:   73 c4 01 08     std,ma r4,80(sp)
   8:   73 c3 3f 11     std r3,-78(sp)
   c:   db 39 0f e0     extrd,s r25,63,32,r25
  10:   00 01 0e 63     rsm 1,r3
  14:   37 dd 3f a1     ldo -30(sp),ret1 
  18:   0f 40 10 d5     ldd 0(,r26),r21    <=3D=3D=3D=3D
  1c:   0e a0 10 94     ldw 0(,r21),r20
  20:   86 80 20 58     cmpib,=3D 0,r20,54 <kmem_cache_alloc+0x54>
)

Hth,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
