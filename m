From: Meelis Roos <mroos@linux.ee>
Subject: "add,dc" problem with new binutils in csum_ipv6_magic asm
Date: Mon, 14 Mar 2011 10:29:03 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103141024040.3640@math.ut.ee>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


While trying to compile 2.6.38-rc8-00065 on hppa64 with new binutils 
2.21.0.20110302 I hit a problem with inline asm in 64-bit variant of 
csum_ipv6_magic() with first network driver that used it:

  CC [M]  drivers/net/atl1c/atl1c_main.o                    
drivers/net/atl1c/atl1c_main.c:2543: warning: 'atl1c_resume' defined but not used
{standard input}: Assembler messages:
{standard input}:4996: Error: Invalid Add Condition: dc
{standard input}:4997: Error: Invalid Add Condition: dc
{standard input}:4998: Error: Invalid Add Condition: dc
{standard input}:4999: Error: Invalid Add Condition: dc
make[3]: *** [drivers/net/atl1c/atl1c_main.o] Error 1

arch/parisc/include/asm/checksum.h has the corresponding inline asm - it 
seems that add,dc is not accepted by the new binutils.

#define _HAVE_ARCH_IPV6_CSUM
static __inline__ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
                                          const struct in6_addr *daddr,
                                          __u32 len, unsigned short proto,
                                          __wsum sum)
{
        __asm__ __volatile__ (

#if BITS_PER_LONG > 32

        /*
        ** We can execute two loads and two adds per cycle on PA 8000.
        ** But add insn's get serialized waiting for the carry bit.
        ** Try to keep 4 registers with "live" values ahead of the ALU.
        */

"       ldd,ma          8(%1), %%r19\n" /* get 1st saddr word */
"       ldd,ma          8(%2), %%r20\n" /* get 1st daddr word */
"       add             %8, %3, %3\n"/* add 16-bit proto + len */
"       add             %%r19, %0, %0\n"
"       ldd,ma          8(%1), %%r21\n" /* 2cd saddr */
"       ldd,ma          8(%2), %%r22\n" /* 2cd daddr */
"       add,dc          %%r20, %0, %0\n"
"       add,dc          %%r21, %0, %0\n"
"       add,dc          %%r22, %0, %0\n"
"       add,dc          %3, %0, %0\n"  /* fold in proto+len | carry bit */
"       extrd,u         %0, 31, 32, %%r19\n"    /* copy upper half down */
"       depdi           0, 31, 32, %0\n"        /* clear upper half */
"       add             %%r19, %0, %0\n"        /* fold into 32-bits */
"       addc            0, %0, %0\n"            /* add carry */

#else  



-- 
Meelis Roos (mroos@linux.ee)
