Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA26853
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 18:22:57 -0700
Message-Id: <200012070118.UAA28814@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Wed, 6 Dec 2000 20:18:11 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rth@redhat.com, alan@linuxcare.com.au, law@cygnus.com,
        rhirst@linuxcare.com, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
In-Reply-To: <200012070057.TAA28741@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 6, 2000 07:57:49 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I am testing the following.  The bootstrap has gone well past the above
> point.  Maybe some generalization of this would work in general or

Failure:

stage1/xgcc -Bstage1/ -B/usr/local/hppa1.1-hp-hpux10.20/bin/ -c  -DIN_GCC    -g -O3 -fPIC -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes   -DHAVE_CONFIG_H    -I. -Icp -I../../gcc -I../../gcc/cp -I../../gcc/config -I../../gcc/../include ../../gcc/cp/decl.c -o cp/decl.o
../../gcc/cp/decl.c: In function `duplicate_decls':
../../gcc/cp/decl.c:3760: Internal error: Segmentation fault.
Please submit a full bug report.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[2]: *** [cp/decl.o] Error 1
make[2]: Leaving directory `/xxx/gnu/gcc-2.97/objdir/gcc'
make[1]: *** [stage_c] Error 2
make[1]: Leaving directory `/xxx/gnu/gcc-2.97/objdir/gcc'
make: *** [bootstrap-lean] Error 2

Hopefully, this is a different problem.

[snip]
decls_match warn_extern_redeclared_static duplicate_decls {GC 6819k -> 2774k} {GC 5707k -> 2827k}
Program received signal SIGSEGV, Segmentation fault0x35c264 in make_reorder_chain_1 (bb=0x401a3408, prev=0x401a3408)
    at ../../gcc/bb-reorder.c:409
409           next = (taken e_taken : e_fall)->dest;
(gdb) p taken
$1 = 1
(gdb) p e_taken->dest
Cannot access memory at address 0xc
(gdb) p e_fall->dest
$2 = (struct basic_block_def *) 0x401a3440

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
