From: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
Subject: Testing the lws_compare_and_swap_2 syscall
Date: Tue, 24 Oct 2017 22:03:42 +0200
Message-ID: <1508874207@msgid.manchmal.in-ulm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello,

looking into John's recent fix for lws_compare_and_swap_2 on 32bit
systems I got the feeling things still aren't right yet. To defeat
or prove that, also since I'd like to learn more about this ... I wrote
a small program the uses that syscall, and things break galore.

Could you please check the code below[1] for obvious usage errors? Note
the entire cmpxchg2 function was copied from gcc, and the disassembly
output provided by objdump looks correct as far as I can tell.

The program takes four numerical parameters that correspond to the
four parameters of the syscall.

To start with, using the invalid value 4 as size parameter does not
return ENOSYS as I'd expect but crashes my system[2], using both 32 and
64 bit kernel, no root privileges required. This should never happen.

Regards,
    Christoph

[1]
======================================================================
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* borrowed from __kernel_cmpxchg2 in libgcc/config/pa/linux-atomic.c in the gcc sources */
static inline long
cmpxchg2 (void *mem, const void *oldval, const void *newval,
                   int val_size)
{
  register unsigned long lws_mem asm("r26") = (unsigned long) (mem);
  register unsigned long lws_old asm("r25") = (unsigned long) oldval;
  register unsigned long lws_new asm("r24") = (unsigned long) newval;
  register int lws_size asm("r23") = val_size;
  register long lws_ret   asm("r28");
  register long lws_errno asm("r21");
  asm volatile (        "ble    0xb0(%%sr2, %%r0)       \n\t"
                        "ldi    %6, %%r20               \n\t"
        : "=r" (lws_ret), "=r" (lws_errno), "+r" (lws_mem),
          "+r" (lws_old), "+r" (lws_new), "+r" (lws_size)
        : "i" (2)
        : "r1", "r20", "r22", "r29", "r31", "fr4", "memory"
  );

  /* If the kernel LWS call is successful, lws_ret contains 0.  */
  if (__builtin_expect (lws_ret == 0, 1))
    return 0;

  if (__builtin_expect (lws_errno == -EFAULT || lws_errno == -ENOSYS, 0))
    __builtin_trap ();

  /* If the kernel LWS call fails with no error, return -EBUSY */
  if (__builtin_expect (!lws_errno, 0))
    return -EBUSY;

  return lws_errno;
}



int main (int argc, char **argv) {

    if (argc != 5) {
        printf ("usage <mem> <old> <new> <size>\n");
        exit (1);
    }

    uint64_t a = atoi (argv[1]);
    uint64_t b = atoi (argv[2]);
    uint64_t c = atoi (argv[3]);
    unsigned long size = atoi (argv[4]);

    printf ("a = 0x%016llx, b = 0x%016llx, c = 0x%016llx\n",
        a,
        b,
        c
    );

    unsigned long r = cmpxchg2 (&a, &b, &c, size);

    printf ("a = 0x%016llx\n", a);
    printf ("r = 0x%lx\n", r);

    return 0;
}
======================================================================


[2]
| Backtrace:
|
| Kernel Fault: Code=26 (Data memory access rights trap) regs=000000007ca8f738 (Addr=0000000000000002)
| CPU: 0 PID: 1289 Comm: a.out Not tainted 4.12.0-2-parisc64-smp #1 Debian 4.12.13-1
| task: 000000007ca8eec0 task.stack: 000000007cb68000
|
|      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
| PSW: 00001000000001101111111100001111 Not tainted
| r00-03  000000ff0806ff0f 0000000040cf2000 0000000000010987 00000000f93963c0
| r04-07  00000000f853fc70 00000000ffffffff 00000000ffffffff 00000000ffffffff
| r08-11  00000000fffffffe 00000000ffffffff 00000000fffffffd 00000000000ed000
| r12-15  00000000ffffffff 0000000000911d28 0000000000000000 0000000000117be8
| r16-19  00000000009ce448 0000000000000000 0000000000000001 00000000f9396328
| r20-23  0000000000000002 00000000000004d4 00000000f844a08c 0000000000000004
| r24-27  00000000f9396330 00000000f9396328 00000000f9396320 0000000000011100
| r28-31  0000000040cf2528 0000000000000010 00000000f9396400 00000000000106e7
| sr00-03  00000000003a7800 0000000000000000 0000000000000000 00000000003a7800
| sr04-07  00000000003a7800 00000000003a7800 00000000003a7800 00000000003a7800
|
| IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000000000578 000000000000057c
|  IIR: 0e8095dc    ISR: 0000000000000000  IOR: 0000000000000002
|  CPU:        0   CR30: 000000007cb68000 CR31: 0000000011111111
|  ORIG_R28: 0000000000000000
|  IAOQ[0]: 0x578
|  IAOQ[1]: 0x57c
|  RP(r2): 0x10987
| Backtrace:
|
| Kernel panic - not syncing: Kernel Fault
| ---[ end Kernel panic - not syncing: Kernel Fault
