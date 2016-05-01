From: Helge Deller <deller@gmx.de>
Subject: RFC: parisc regset support
Date: Sun, 1 May 2016 11:25:31 +0200
Message-ID: <5725CB8B.7010206@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Randolph Chung <randolph@tausq.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

Earlier this month I posted a patch which adds regset support
to parisc and which I'm planning to push for kernel v4.7:
https://patchwork.kernel.org/patch/8787691/

In this patch is the "new" user-visible regset 
which I've laid out like this:

> +struct user_regs_struct {
> +	unsigned long gr[32];	/* PSW is in gr[0] */
> +	unsigned long sr[8];
> +	unsigned long iaoq[2];
> +	unsigned long iasq[2];
> +	unsigned long sar;	/* CR11 */
> +	unsigned long iir;	/* CR19 */
> +	unsigned long isr;	/* CR20 */
> +	unsigned long ior;	/* CR21 */
> +	unsigned long ipsw;	/* CR22 */
> +	unsigned long cr0;
> +	unsigned long cr24, cr25, cr26, cr27, cr28, cr29, cr30, cr31;
> +	unsigned long cr8, cr9, cr12, cr13, cr10, cr15;
> +	unsigned long _pad[80-64];	/* pad to ELF_NGREG (80) */
> +};

Current glibc versions use this definition in
/usr/include/hppa-linux-gnu/sys/ucontext.h

/* Container for all general registers.  */
typedef struct gregset
  {
    greg_t g_regs[32];
    greg_t sr_regs[8];
    greg_t cr_regs[24]; 
    greg_t g_pad[16];
  } gregset_t;

What is you opinion on this change, e.g. using explicit names of the
control registers and their order?

By the way, the order I choosed is modelled after the in-kernel
ELF/core-dump code which can be seen in  arch/parisc/include/asm/elf.h:

/*
 * Fill in general registers in a core dump.  This saves pretty
 * much the same registers as hp-ux, although in a different order.
 * Registers marked # below are not currently saved in pt_regs, so
 * we use their current values here.
 *
 *      gr0..gr31
 *      sr0..sr7
 *      iaoq0..iaoq1
 *      iasq0..iasq1
 *      cr11 (sar)
 *      cr19 (iir)
 *      cr20 (isr)
 *      cr21 (ior)
 *  #   cr22 (ipsw)
 *  #   cr0 (recovery counter)
 *  #   cr24..cr31 (temporary registers)
 *  #   cr8,9,12,13 (protection IDs)
 *  #   cr10 (scr/ccr)
 *  #   cr15 (ext int enable mask)
 *
 */

#define ELF_CORE_COPY_REGS(dst, pt)     \
        memset(dst, 0, sizeof(dst));    /* don't leak any "random" bits */ \
        memcpy(dst + 0, pt->gr, 32 * sizeof(elf_greg_t)); \
        memcpy(dst + 32, pt->sr, 8 * sizeof(elf_greg_t)); \
        memcpy(dst + 40, pt->iaoq, 2 * sizeof(elf_greg_t)); \
        memcpy(dst + 42, pt->iasq, 2 * sizeof(elf_greg_t)); \
        dst[44] = pt->sar;   dst[45] = pt->iir; \
        dst[46] = pt->isr;   dst[47] = pt->ior; \
        dst[48] = mfctl(22); dst[49] = mfctl(0); \
        dst[50] = mfctl(24); dst[51] = mfctl(25); \
        dst[52] = mfctl(26); dst[53] = mfctl(27); \
        dst[54] = mfctl(28); dst[55] = mfctl(29); \
        dst[56] = mfctl(30); dst[57] = mfctl(31); \
        dst[58] = mfctl( 8); dst[59] = mfctl( 9); \
        dst[60] = mfctl(12); dst[61] = mfctl(13); \
        dst[62] = mfctl(10); dst[63] = mfctl(15);


