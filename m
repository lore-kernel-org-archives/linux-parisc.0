Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (mail.tiscali.be [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id E00AD483E
	for <parisc-linux@parisc-linux.org>; Mon,  7 Oct 2002 10:19:44 -0600 (MDT)
Date: Mon, 7 Oct 2002 18:12:22 +0200
Message-ID: <3D8EED0B00001976@ocpmta5.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Need help to improve uaccess.h patch
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Randolph Chung wrote:
>>>That is my main doubt :(
>>>In this uaccess.h, I read (but i am not quit sure to have understand all

>>>  fine aspect) that we have to 'jump' after the erronious code (for me

>>>3b-[12]b + 1 ? am i wrong? ). And understand +3 in get_user_asm because

>>>we would have to jump after the cast "(x) = (__typeof__(*(ptr))) 
>>>__gu_val;". Is it wrong?
>>
>>I may be wrong but I think the code is trying to build a PLABEL.  In
>>which case, the value should be 2 or 3.  The least significant bit is
>>not used.  See the runtime architecture manual for more info on PLABELs.
> 
> 
> nah, the comment says:
> 
> /*
>  * The exception table contains two values: the first is an address
>  * for an instruction that is allowed to fault, and the second is
>  * the number of bytes to skip if a fault occurs. We also support in
>  * two bit flags: 0x2 tells the exception handler to clear register
>  * r9 and 0x1 tells the exception handler to put -EFAULT in r8.
>  * This allows us to handle the simple cases for put_user and
>  * get_user without having to have .fixup sections.
>  */

But may I any way use a .fixup section (I do not find any usage of a .fixup
section in parisc code). Even lusercopy.S do not use it (just a kind of)?

> 
> struct exception_table_entry {
>         unsigned long addr;  /* address of insn that is allowed to fault.
  */
>         long skip;           /* pcoq skip | r9 clear flag | r8 -EFAULT
flag */
> };
> 
> so let's take __get_user() ...
> 
> #define __get_user(x,ptr)                               \
> ({                                                      \
>         register long __gu_err __asm__ ("r8") = 0;      \
>         register long __gu_val __asm__ ("r9") = 0;      \
>         [...]

Well in the case of a 64bits int, I could not use only one "r9" register.
May I used a third register: "r10" for instance?

>         }                                               \
>         (x) = (__typeof__(*(ptr))) __gu_val;            \
>         __gu_err;                                       \
> })
> 
> iow, at the end of __get_user, x == r9, and the return value is r8
> 
> so, if the extable says:
>                 "\t.section __ex_table,\"a\"\n"         \
>                  "\t.word\t1b\n"                        \
>                  "\t.word\t(2b-1b)+3\n"                 \
>                  "\t.previous"                          \
> 
> this means that:
> if the insn at label 1 faults, handle the fault (see
> arch/parisc/mm/fault.c) and then continue at 
> label1+((label2-label1)&~3) == label2; also, since the lowest 2 bits are
> set (+3), set r9 = 0 and r8 = -EFAULT --> get_user will set x = 0 and
> return -EFAULT
> 
Thanks a lot for all of your understand and help,
    Joel
