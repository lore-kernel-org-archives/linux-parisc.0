Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0910149CD
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 03:53:15 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id FAA31633
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 05:52:59 -0400
Message-Id: <200110110952.FAA31633@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] a todo entry
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 11 Oct 2001 05:52:59 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

Hi!

Matthew Wilcox wrote:

> #define KERNEL_DS 0
> #define USER_DS mfsp(3)
> #define get_ds() (KERNEL_DS)
> #define get_fs() mfsp(2)
> #define set_fs(x) mtsp(x, 3)

I've been looking at it for the last two days and I still
cannot understand it :-). Why do You want set_fs to write to
sr3? If set_fs changes sr3, but we access memory in 
__get_user and __set_user using sr2, it is not going to work
(I think). By now I'm pretty convinced that set_fs should
operate on sr2 (which is supported by John's post). IMHO,
sr2 should behave like that (just a summary of what was said
before):

a) In userspace sr2 is always 0, so that everybody can make 
   their syscals.
b) sr2 is set to sr3 when we enter the kernel.
c) get_fs returns sr2 and set_fs sets sr2, so that we can
   always use sr2 as the space in __get_user/__set_user
d) When we return to userspace from the kernel, sr2 is
   set to 0 again.

While modification of uaccess.h to satisfy c) is more or less
trivial, real problem for me is b) and d). I'm not quite sure, 
where to look for these entries and returns? I would guess, 
entry.S is the right place, but obviously I didn't RTFM enough to
hack it yet.

Another thing which confuses me a lot is a way the exception
table is constructed in __get_kernel_asm/__get_user_asm:

"\t.section __ex_table,\"a\"\n"        \
"\t.dword\t1b\n"                       \
"\t.dword\t(2b-1b)+3\n"                \
"\t.previous"  

What is the function of this "+3" thing? If 2b and 1b are the
word-aligned addresses of the instructions (which, I think,
they are), this does not make much sense. When the instruction
at 1b fails, it will try to skip (2b-1b)+3 bytes, which is
7, if 1b and 2b refer to subsequent instructions. In other
places it is just (2b-1b), which is perfectly understandable. 
It would be great, if someone could explain it.

Best regards,

Jurij.
