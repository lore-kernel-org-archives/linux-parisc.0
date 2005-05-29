From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] c3k panics
Date: Sun, 29 May 2005 17:15:46 +0000
Message-ID: <4299F8C2.2060400@tiscali.be>
References: <200505290141.j4T1ffhI006449@hiauly1.hia.nrc.ca>
	<42999A30.6070602@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42999A30.6070602@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Randolph,

Ah that's a week that I reading code, cvs patches archives, ... and seems that something is not equal everywhere but didn't reach to 
point out since I can put together:

arch/parisc/kernel/unaligned.c
[snip]
#define FIXUP_BRANCH(lbl) \
         "\tldil L%%" #lbl ", %%r1\n"                    \
         "\tldo R%%" #lbl "(%%r1), %%r1\n"               \
         "\tbv,n %%r0(%%r1)\n"
[snip]

(since this patche: <http://cvs.parisc-linux.org/linux-2.6/arch/parisc/kernel/unaligned.c?r1=1.12&r2=1.13>
and this comment:
Revision 1.13  - (view) (download) (as text) (annotate) - [select for diffs]
Tue Sep 21 19:50:55 2004 UTC (8 months ago) by tausq
Branch: MAIN
CVS Tags: LINUS_2_6_9_RC3_MERGED, LINUS_2_6_9_RC3_PRE
Branch point for: LINUS_2_6_9_RC3
Changes since 1.12: +2 -3 lines
Diff to previous 1.12

<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/024799.html>)

otc in arch/parisc/kernel/syscall.S
[snip]
#ifndef CONFIG_64BIT
         .macro fixup_branch,lbl
         b           \lbl
         .endm
#else
         .macro fixup_branch,lbl
         ldil        L%\lbl, %r1
         ldo         R%\lbl(%r1), %r1
         bv,n        %r0(%r1)
         .endm
#endif
[snip]

(Just for the record e.g. 64bit kernel works fine but not it's twin 32bit on b2k)

Thanks in advance for your relevant advise,
	Joel

Joel Soete wrote:
> 
> 
> John David Anglin wrote:
> 
>> I can panic my c3750 very consistently running the binutils testsuite
>> (cvs source as of 20050526).
> 
> mmm the experimental debian bintuils-2.16 seems to works fine for me 
> (kernel 2.6.8.1-pa11 32bit on a b180).
> 
>> I've tried many of the default kernels
>> to see if I could isolate when the problem was introduced.  The last
>> kernel that seems unaffected is 2.6.8.1-pa11.  The problem is present
>> in 2.6.12-rc5-pa0 and 2.6.11-pa4.
>>
> I observe the same differences of behaviour.
> 
> Btw, that looks like the pb I encountered many times when I tried 
> CONFIG_DEBUG_SLAB=y?
> 
> As I tried to explain in detail 
> (<http://lists.parisc-linux.org/pipermail/parisc-linux/2005-May/026493.html>) 
> there is a big pb with this option. Unfortunately, I am not a C 
> programer and so lake of deep knowledges to suggest a proper fix :-(
> 
> If it's your case too, can you try without this option.
> (or give a try to this patch attempt: 
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2005-May/026474.html>. 
> 
> it's not perfect but it helps me anyway :-) ).
> 
> 
>> The sad part is that panic is also broken and no error messages are
>> produced when the fault occurs.  Before adding panic=180 to the command
>> line, pressing TOC just yielded a register dump for panic itself.  That's
>> not too useful.  In my testing, the last working panic dump was with
>> 2.6.9-pa1 which faulted with a HPMC during boot.
>>
> 
> The same for me, it seems that the pb appears during 2.6.9 developement;
> as far as I can test, it seems that the pb appears between 2.6.9-rc2-pa2 
> and pa5;
> For my part I already tried to revert only this pa5 (just to be sure) 
> <http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2004-September/034576.html> 
> 
> but it doesn't help :-)
> 
> So still have to revert few thing (but it would be hard like fixup 
> stuff) to try to isolate the pb?
> 
> Ah still a question: is it the same pb for 32bit and 64bit twin kernel?
> 
> Thanks,
>     Joel
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
