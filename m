Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0DF1482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Sep 2002 10:27:26 -0600 (MDT)
Date: Mon, 9 Sep 2002 18:27:22 +0200
Message-ID: <3D3815AF0000F2CA@ocpmta3.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Inline Assembly Help request
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

Continuing to figure out how to translate this C in assembly:
static inline int __put_user_u64(unsigned long long val, unsigned long long
*  ptr)
{
    int  err;
    err = (int) put_user((unsigned int)(val>>32) ,(unsigned int *)ptr);
    err |= (int) put_user((unsigned int)val,(unsigned int *)ptr+1);
    return err;
}

(needed for > evms-1.1.0)

With many luck, I found interresting references about online assembly in
gcc.

But I do not yet find explanation about details of the following asm code:
#define __put_user_asm(stx,x,ptr)                           \
        __asm__ __volatile__ (                              \
                "\n1:\t" stx "\t%2,0(%%sr3,%1)\n"           \
                "2:\n"                                      \
                "\t.section __ex_table,\"a\"\n"             \
                 "\t.word\t1b\n"                            \
                 "\t.word\t(2b-1b)+1\n"                     \
                 "\t.previous"                              \
                : "=r"(__pu_err)                            \
                : "r"(ptr), "r"(x), "0"(__pu_err))

which is more clear with gcc -S:

1:      stw     %r21,0(%sr3,%r19)
2:
        .section __ex_table,"a"
        .word   1b
        .word   (2b-1b)+1
        .previous

My questions are:
what are the actual means "1:", "2:" (seems like label?)

and what means the rest
".section __ex_table,...
 ...
 .previous"

I do not yet found reference on this part (even in Assembly-HOWTO).
Where could I found doc on this details?

Thanks in advance for attention,
    Joel
                          


Big Brother Anders  - With Tiscali you will see it all !  Check it up on
 www.tiscali.be/bigbrother
