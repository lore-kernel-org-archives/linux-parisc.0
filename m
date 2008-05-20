From: Grant Grundler <grundler@parisc-linux.org>
Subject: BUG 2.6.26-rc2: deadlock with pa_tlb_lock
Date: Mon, 19 May 2008 23:39:53 -0600
Message-ID: <20080520053953.GB11402@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hey,
2.6.26-rc2 with fixed vmlinux.lds netboots and with NFS root seems
to mostly work. But it did seem to deadlock. From the TOC (PIM) dump,
looks like a lock didn't get unlocked and both CPUs where spinning
trying to acquire that lock:

CPU0 IP  : 0x4011a23c _spin_lock+14
CPU0 GR02: 0x4011cb6c flush_kernel_dcache_page_addr+34

CPU1 IP  : 0x4011a23c _spin_lock+14
CPU1 GR02: 0x4011cabc __flush_tlb_range+74


flush_kernel_dcache_page_addr() is pretty short:

void flush_kernel_dcache_page_addr(void *addr)
{
        flush_kernel_dcache_page_asm(addr);
        purge_tlb_start();
        pdtlb_kernel(addr);
        purge_tlb_end();
}

Since I just updated my tree to 2.6.26-rc3, I'll use the asm from that:
...
  20:   2b 60 00 00     addil L%0,dp,r1
                        20: R_PARISC_DLTIND21L  pa_tlb_lock
  24:   50 3a 00 00     ldd 0(r1),r26
                        24: R_PARISC_DLTIND14R  pa_tlb_lock
  28:   37 dd 3f a1     ldo -30(sp),ret1
  2c:   e8 00 a0 00     b,l 34 <flush_kernel_dcache_page_addr+0x34>,rp
                        2c: R_PARISC_PCREL22F   _spin_lock
  30:   08 1b 02 44     copy dp,r4
  34:   08 04 02 5b     copy r4,dp
  38:   04 a0 12 00     pdtlb r0(r5)
  3c:   34 1c 00 02     ldi 1,ret0
...

So while the offset looks wrong, __flush_tlb_range has a similar
construct:

  5c:   2b 60 00 00     addil L%0,dp,r1
                        5c: R_PARISC_DLTIND21L  pa_tlb_lock
  60:   08 1b 02 44     copy dp,r4
  64:   50 26 00 00     ldd 0(r1),r6
                        64: R_PARISC_DLTIND14R  pa_tlb_lock
  68:   37 dd 3f a1     ldo -30(sp),ret1
  6c:   e8 00 a0 00     b,l 74 <__flush_tlb_range+0x74>,rp
                        6c: R_PARISC_PCREL22F   _spin_lock
  70:   08 06 02 5a     copy r6,r26
  74:   08 04 02 5b     copy r4,dp
  78:   2b 60 00 00     addil L%0,dp,r1
                        78: R_PARISC_DLTIND21L  split_tlb
  7c:   50 3c 00 00     ldd 0(r1),ret0
                        7c: R_PARISC_DLTIND14R  split_tlb
  80:   0f 80 10 9f     ldw 0(ret0),r31
  84:   87 e0 20 72     cmpib,=,n 0,r31,c4 <__flush_tlb_range+0xc4>
  88:   9c a0 20 28     cmpb,*= r0,r5,a4 <__flush_tlb_range+0xa4>

So I'm pretty sure, whatever is wrong, it's got something to do
with pa_tlb_lock.

Rebuilding now with gcc-4.2 (instead of gcc-4.3) and retesting
with 2.6.26-rc3.

hth,
grant
