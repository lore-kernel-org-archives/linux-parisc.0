Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 348704829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 07:25:36 -0600 (MDT)
Date: Wed, 25 Sep 2002 15:25:13 +0200
Message-ID: <3D8F011400000B05@ocpmta2.be.tiscali.com>
In-Reply-To: <200209091727.g89HRZF3021659@hiauly1.hia.nrc.ca>
From: jsoe0708@tiscali.be
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	"Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] followup: Inline Assembly Help request
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

Following my investigation to fix the problem of 64bits integer transfer
between kernel and user space (put_user in uaccess.h), I still had a problem:

how to access of the two int (32bit) parts of a long long?

In mips sources I found this interresting stuff:
__put_user_asm_ll32
...
    1:    sw    %1, %2
    2:    sw    %D1, %3
....

which would correspond to what I need but it is not available for hppa.

So I do something like:
...
#define STD_USER(x, ptr)                      \
({                                            \
    unsigned int xh = (unsigned int)(x>>32),  \
                 xl = (unsigned int) (x);     \
    __put_user_asm_64(xh, xl, ptr);           \
})
...

and so 
...
#define __put_user_asm_64(xh, xl, ptr)                      \
        __asm__ __volatile__ (                              \
                "\n1:\tstw\t%2,0(%%sr3,%1)\n"               \
                "2:\tstw\t%3,4(%%sr3,%1)\n"                 \
                "3:\n"                                      \
                "\t.section __ex_table,\"a\"\n"             \
                 "\t.word\t1b\n"                            \
                 "\t.word\t(3b-1b)+1\n"                     \
                 "\t.word\t2b\n"                            \
                 "\t.word\t(3b-2b)+1\n"                     \
                 "\t.previous"                              \
                : "=r"(__pu_err)                            \
                : "r"(ptr), "r"(xh), "r"(xl), "0"(__pu_err))
...

which has a border effect:
tty_ioctl.c: In function `get_termio':
tty_ioctl.c:175: warning: right shift count >= width of type
tty_ioctl.c:175: warning: right shift count >= width of type
tty_ioctl.c:175: warning: right shift count >= width of type
tty_ioctl.c:175: warning: right shift count >= width of type
tty_ioctl.c:175: warning: right shift count >= width of type

Is there some other means somewhere else?

Thanks in advance,
    Joel
