From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: timing bug in clone() ? [BUGFIX-PATCH attached]
Date: Wed, 03 Jan 2007 18:12:47 +0100
Message-ID: <engo6f$jur$1__35288.2619751201$1416624634$gmane$org@sea.gmane.org>
References: <200612291721.53961.deller@gmx.de> <4595BBC0.2020602@tausq.org>
	<200701012047.10616.deller@gmx.de>
	<119aab440701021616q48f35673o76373519b7a23198@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos O'Donell wrote:

> On 1/1/07, Helge Deller <deller@gmx.de> wrote:
>> I've found the bug now... :-)
>> Patch is attached below, and the problem was not in the kernel, but in
>> glibc.
>>
>> The first hunk in the patch below ("Save the PIC register.") is the fix
>> for the arguments check which I posted before
>>
(http://lists.parisc-linux.org/pipermail/parisc-linux/2006-December/031029.html).
>> This hunk fixes LTP's clone04 test.
>>
>> The second and third hunk fixes the "return 0" bug as reported by LTP's
>> clone06 test. It first saves the current FPIC register on the child's
>> stack (to %arg0 instead of %sr0,%sp) and later reads it back from there
>> in the third hunk just before calling _exit(). That way the PIC register
>> has the correct value and exit() doesn't crashes any more.
>>
>> Now all clone()-tests from LTP succeeds :-)
>>
>> Helge
>>
>>
>> ---
>>
glibc-2.3.6.ds1/build-tree/glibc-2.3.6/debian/sysdeps/unix/sysv/linux/hppa/clone.S.org
>>      2006-12-29 08:49:25.000000000 +0100
>> +++
>>
glibc-2.3.6.ds1/build-tree/glibc-2.3.6/debian/sysdeps/unix/sysv/linux/hppa/clone.S
>>  2007-01-01 19:53:00.000000000 +0100 @@ -32,6 +32,11 @@
>>  ENTRY(__clone)
>>         /* FIXME: I have no idea how profiling works on hppa. */
>>
>> +       /* Save the PIC register. */
>> +#ifdef PIC
>> +       stw     %r19,-32(%sr0, %sp)     /* parent */
>> +#endif
>> +
>>         /* Sanity check arguments.  */
>>         comib,=  0,%arg0,.Lerror        /* no NULL function pointers */
>>         ldi     -EINVAL,%ret0
>> @@ -41,10 +46,8 @@
>>         /* Save the fn ptr and arg on the new stack.  */
>>         stwm    %arg0,64(%arg1)
>>         stw     %arg3,-60(%arg1)
>> -
>> -       /* Save the PIC register. */
>>  #ifdef PIC
>> -       stw     %r19,-32(%sr0, %sp)     /* parent */
>> +       stw     %r19,-32(%arg1)         /* save PIC on child's stack */
>>  #endif
>>
>>         /* Do the system call */
>> @@ -88,6 +91,11 @@
>>         bl      $$dyncall,%r31
>>         copy    %r31,%rp
>>
>> +       /* Restore PIC register for exit() */
>> +#ifdef PIC
>> +       ldw     -32(%sr0, %sp), %r19    /* parent */
>> +#endif
>> +
>>         bl      _exit,%rp
>>         copy    %ret0,%arg0
> 
> Ah, I found this already and fixed it in upstream. You need to submit
> this patch to debian's bts and get it applied to their fixed glibc
> version.
> 
> In the upstream versrion I allocated r4 as a temporary register
> instead of spilling to the stack and back.

yes, and I realized that you fixed it after I was finished with my patch :-(
Anyway, I filed a bugreport today at debian bts:
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=405411

Of course I prefer if we can switch to your NPTL-enabled glibc as soon as
possible. But in the meantime it's maybe good to have this patch in in the
old glibc...

Helge


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
