Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA16864
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Oct 1999 09:55:10 -0600
Message-ID: <000701bf1401$110ab360$16f950cb@80.249.6.mmm.com.hk>
From: "William M. Brack" <wbrack@mmm.com.hk>
To: <parisc-linux@thepuffingroup.com>
Date: Mon, 11 Oct 1999 23:55:38 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] compiler "crash" on setup.c
List-ID: <linux-parisc.vger.kernel.org>

After following (more or less) the very helpful "recipe" by Grant Grundler,
including downloading the latest CVS kernel, I got quite a ways in
generating a Linux system (using an HPUX 10.20 E35 system) which I plan to
try to boot on an E25 system.  There was, however, one problem while doing
the "make vmlinux".  The egcs gcc compiler "crashed" while compiling
arch/kernel/setup.c, with the following:-

$
gcc -D__KERNEL__ -I/linux/linux/include -Wall -Wstrict-prototypes -O2 -fomit
-frame-pointer
 -mdisable-fpregs -fwritable-strings -fno-strict-aliasing -pipe -fno-strengt
h-reduce -c -o setup.o setup.c
setup.c:607: warning: `PA' redefined
(void *)((unsigned long)()&~0xc0000000)
  ! */@Ý igned long sversion );

IàI@7 ÿ@
 nclud@Ü^1@÷¨@pø"
LÐ_VARARGS_H @Ú"P
 unsigned long hp700fb_init(unsigned long mem_start)

(followed by voluminous lines of junk ....)
and terminated by a "Signal 11" message.  Now, I know about the infamous
"Signal 11 message" for gcc, and the fact that it is usually an indication
of memory or hardware failure, but in this instance it was very consistent
in that it failed at the same spot with the same warning on several retries.

Since it appeared that the #define'd macro PA was not actually used within
the program setup.c, I just removed it.  Once this was done, the compilation
was successful.

I would appreciate any comments as to the cause, and whether the removal of
this macro will get me into some other trouble later.

Thanks,

Bill Brack
Hong Kong
