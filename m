Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA07011
	for <parisc-linux@puffin.external.hp.com>; Thu, 20 Jul 2000 13:28:07 -0600
Message-ID: <20000720192915.1112.qmail@web4802.mail.yahoo.com>
Date: Thu, 20 Jul 2000 12:29:15 -0700 (PDT)
From: Jeff Towarnicki <jtowarnicki@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] problems compiling..
List-ID: <linux-parisc.vger.kernel.org>

I am having problems compiling gcc.. I am following
the recipe but I get problems with include files not
being found... I think the problem is because the
include directive -I looks for include files in
"include.h"'s and not <include.h>'s.. this is the
error I get (after about 30 mins into the compiling of
gcc on a pIII 450:
(the include files are there.... in
/home/jeff/parisc/include... )

if anyone can point out something I am doing wrong
much appreciated.. thanks.. Jeff

-----------------------------------------------------

 /home/jeff/parisc/gcc-build/gcc/xgcc
-B/home/jeff/parisc/gcc-build/gcc/
-B/home/jeff/parisc//hppa1.1-linux/bin/ -c -g -O2 -I.
-I../../../gcc/libio   ../../../gcc/libio/iogetline.c
-o pic/iogetline.o; \
else true; fi
/home/jeff/parisc/gcc-build/gcc/xgcc
-B/home/jeff/parisc/gcc-build/gcc/
-B/home/jeff/parisc//hppa1.1-linux/bin/ -c -g -O2 -I.
-I../../../gcc/libio  ../../../gcc/libio/iogetline.c
In file included from
../../../gcc/libio/iogetline.c:26:
../../../gcc/libio/libioP.h:30:19: errno.h: No such
file or directory
In file included from ../../../gcc/libio/iolibio.h:1,
                 from ../../../gcc/libio/libioP.h:47,
                 from
../../../gcc/libio/iogetline.c:26:
../../../gcc/libio/libio.h:30:23: _G_config.h: No such
file or directory
../../../gcc/libio/iogetline.c:27:20: string.h: No
such file or directory
make[1]: *** [iogetline.o] Error 1
make[1]: Leaving directory
`/home/jeff/parisc/gcc-build/hppa1.1-linux/libio'
make: *** [all-target-libio] Error 2
[jeff@localhost gcc-build]$               



__________________________________________________
Do You Yahoo!?
Get Yahoo! Mail – Free email you can access from anywhere!
http://mail.yahoo.com/
