From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] GCC not disabling the use fr31 even with
	-mdisable-fpregs.
Date: Sun, 7 Aug 2005 19:35:08 -0400
Message-ID: <20050807233503.GE9703@systemhalted.org>
References: <20050807193949.GA9703@systemhalted.org>
	<200508072014.j77KEaHm028909@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508072014.j77KEaHm028909@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 07, 2005 at 04:14:36PM -0400, John David Anglin wrote:
> If you look at the register names and numbers, you will see that
> GCC doesn't deal with the right half of the fpregs in 64-bit mode,
> thus it wouldn't save and restore the right half of an fpreg.  There's
> only one place that I know of where there would be a reference to
> the right half of a floating point register and that's in a xmpyu.
> However, this only appears in the final code generation.

Yes, I agree with you :)
 
> > There may be a bug in objdump for disassembling that particular insn. I
> > don't know how the left/right completers are encoded in the insn.
> 
> How up-to-date is objdump?  I'm not seeing a problem.  Send .o.
> 
> If you look at the arch, you will see that there are 6 bits for
> specifying fpregs in instructions like fldw and xmpyu that can access
> either half.

.o file can be found at:
www.baldric.uwo.ca/~carlos/sched.o

carlos@firin:~/fsrc/linux-2.6-exp/linux-2.6$ hppa64-linux-gnu-objdump -d
kernel/sched.o | grep fr31R
     600:       5c df 00 9a     fldw 4c(r6),fr31R
    29d8:       5c df 24 8a     fldw 1244(r6),fr31R
    29fc:       5c df 24 8a     fldw 1244(r6),fr31R
    2a50:       5c df 24 8a     fldw 1244(r6),fr31R
    2a74:       5c df 24 8a     fldw 1244(r6),fr31R
  4c:   5f 5f 00 22     fldw 10(r26),fr31R
 130:   5c 3f 00 9a     fldw 4c(r1),fr31R
carlos@firin:~/fsrc/linux-2.6-exp/linux-2.6$ 

I think that objdump should not produce fr31R if it's dumping 2.0w code.

> > What is of real concern is the save/restore of fr31, when the compiler
> > has been told to disable floating point registers.
> 
> There's a bug there:
> 
> #define CONDITIONAL_REGISTER_USAGE \
> {                                               \
>   int i;                                        \
>   if (TARGET_DISABLE_FPREGS || TARGET_SOFT_FLOAT)\
>     {                                           \
>       for (i = FP_REG_FIRST; i < FP_REG_LAST; i++)\
> 	fixed_regs[i] = call_used_regs[i] = 1;  \
>     }                                           \
> 
> It looks like the '<' should be '<=".  It's not disabling the last
> fpreg.

Aha! Zat is ze bug! :)

CC'ing the list for the sake of posterity.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
