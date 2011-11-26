From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: TLB Miss Bug?
Date: Fri, 25 Nov 2011 21:18:47 -0600
Message-ID: <1322277527.7362.12.camel@dabdike.cust.hotspot.t-mobile.com>
References: <BLU0-SMTP178D0B9C9992607985308C97CE0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP178D0B9C9992607985308C97CE0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2011-11-24 at 08:16 -0500, John David Anglin wrote:
> As GCC has gotten larger with time, I started seeing hangs in the  
> stage1 compilers when they are compiled
> with no optimization.  This first was seen with gnat1.  I now see it  
> with cc1 and cc1plus.
> 
> The hangs always occur at the same place (ldw,s instruction) in the  
> GCC casesi insn pattern:
> 
> (gdb) disass $pc-16,$pc+16
> Dump of assembler code from 0x45fbec4 to 0x45fbee4:
> 0x045fbec4 <cpp_spell_token+68>:	ldw 0(ret0),ret0
> 0x045fbec8 <cpp_spell_token+72>:	cmpib,<<,n 3,ret0,0x45fc168  
> <cpp_spell_token+744>
> 0x045fbecc <cpp_spell_token+76>:	ldil L%45fb800,r19
> 0x045fbed0 <cpp_spell_token+80>:	ldo 6dc(r19),r19
> => 0x045fbed4 <cpp_spell_token+84>:	ldw,s ret0(r19),r19
> 0x045fbed8 <cpp_spell_token+88>:	bv,n r0(r19)
> 0x045fbedc <cpp_spell_token+92>:	# 45fbeec
> 0x045fbee0 <cpp_spell_token+96>:	# 45fbfc8
> 
> What is interesting about this instruction is that it usually involves  
> an I and D access to the same page.

> strace shows nothing for process.  gdb can't single step from the  
> instruction.  A break at the next
> instruction is never hit.
> 
> I see the following with sysrq-trigger:
> 
> cc1plus R running task 0 16932 16931 0x00000010
> Backtrace:
> timer_interrupt(CPU 1): delayed! cycles 77ED56D2 rem BD46F next/now  
> 411D1E1AE13C/411D1E0F0CCD
> 
> Note the delayed timer interrupt "always" seems to occur.  Also, see  
> that the program isn't running kernel
> code.
> 
> So, my theory is there is a bug in the TLB miss handling.  Somehow a  
> data miss ejects the instruction entry,
> and we get into a loop inserting I and D TLB entries.  Sometimes the  
> machine gets out of the loop but it takes
> hours.

I'm still a bit Jetlagged from a customer trip to Germany, but this
looks entirely possible: Appendix F says that a later TLB insertion
purges an earlier one, so I'd say in a combined I/D TLB inserting
consecutive I and D entries purges the I.

It looks like a fix might be to insert TLB entries supporting both data
and instruction access in the combined TLB case.

James


