Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 29 Jun 2003 12:14:15 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030629181415.GA21094@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] byte swapping redux
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

Can someone explain why include/asm-parisc/byteorder.h uses the following?

#if !defined(__STRICT_ANSI__) || defined(__KERNEL__)
#  define __BYTEORDER_HAS_U64__
#  define __SWAB_64_THRU_32__
#endif

vs include/asm-sparc64/byeorder.h:
#define __BYTEORDER_HAS_U64__

I'm pretty sure we don't want __SWAB_64_THRU_32__ defined.
PA-RISC version of ___arch__swab64() is appropriately defined for
both 32 and 64-bit compiles.

For reference include/linux/byteorder/swab.h says:
#ifdef __BYTEORDER_HAS_U64__
static __inline__ __const__ __u64 __fswab64(__u64 x)
{
#  ifdef __SWAB_64_THRU_32__
        __u32 h = x >> 32;
        __u32 l = x & ((1ULL<<32)-1);
        return (((__u64)__swab32(l)) << 32) |
		((__u64)(__swab32(h)));
#  else
        return __arch__swab64(x);
#  endif
}
...

thanks,
grant
