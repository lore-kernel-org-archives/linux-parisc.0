Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD71D4829
	for <parisc-linux@parisc-linux.org>; Sat,  5 Oct 2002 18:05:54 -0600 (MDT)
Date: Sat, 5 Oct 2002 17:07:28 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Joel Soete <joel.soete@freebel.net>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Need help to improve uaccess.h patch
Message-ID: <20021006000728.GA15230@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3D9F49FD.2040703@freebel.net> <200210052210.g95MACBv010773@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210052210.g95MACBv010773@hiauly1.hia.nrc.ca>
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

> > That is my main doubt :(
> > In this uaccess.h, I read (but i am not quit sure to have understand all 
> >   fine aspect) that we have to 'jump' after the erronious code (for me 
> > 3b-[12]b + 1 ? am i wrong? ). And understand +3 in get_user_asm because 
> > we would have to jump after the cast "(x) = (__typeof__(*(ptr))) 
> > __gu_val;". Is it wrong?
> 
> I may be wrong but I think the code is trying to build a PLABEL.  In
> which case, the value should be 2 or 3.  The least significant bit is
> not used.  See the runtime architecture manual for more info on PLABELs.

nah, the comment says:

/*
 * The exception table contains two values: the first is an address
 * for an instruction that is allowed to fault, and the second is
 * the number of bytes to skip if a fault occurs. We also support in
 * two bit flags: 0x2 tells the exception handler to clear register
 * r9 and 0x1 tells the exception handler to put -EFAULT in r8.
 * This allows us to handle the simple cases for put_user and
 * get_user without having to have .fixup sections.
 */

struct exception_table_entry {
        unsigned long addr;  /* address of insn that is allowed to fault.   */
        long skip;           /* pcoq skip | r9 clear flag | r8 -EFAULT flag */
};

so let's take __get_user() ...

#define __get_user(x,ptr)                               \
({                                                      \
        register long __gu_err __asm__ ("r8") = 0;      \
        register long __gu_val __asm__ ("r9") = 0;      \
        [...]
        if (segment_eq(get_fs(),KERNEL_DS)) {           \
            switch (sizeof(*(ptr))) {                   \
            case 1: __get_kernel_asm("ldb",ptr); break; \
            case 2: __get_kernel_asm("ldh",ptr); break; \
            case 4: __get_kernel_asm("ldw",ptr); break; \
            case 8: LDD_KERNEL(ptr); break;             \
            default: BUG(); break;                      \
            }                                           \
        }                                               \
        (x) = (__typeof__(*(ptr))) __gu_val;            \
        __gu_err;                                       \
})

iow, at the end of __get_user, x == r9, and the return value is r8

so, if the extable says:
                "\t.section __ex_table,\"a\"\n"         \
                 "\t.word\t1b\n"                        \
                 "\t.word\t(2b-1b)+3\n"                 \
                 "\t.previous"                          \

this means that:
if the insn at label 1 faults, handle the fault (see
arch/parisc/mm/fault.c) and then continue at 
label1+((label2-label1)&~3) == label2; also, since the lowest 2 bits are
set (+3), set r9 = 0 and r8 = -EFAULT --> get_user will set x = 0 and
return -EFAULT

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
