Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server1.neuronet.pitt.edu (server1.neuronet.pitt.edu [150.232.128.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id D48A44846
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 10:05:28 -0600 (MDT)
Received: from neuronet.pitt.edu (white.neuronet.pitt.edu [150.232.130.110])
	by server1.neuronet.pitt.edu (8.8.8/8.8.8) with ESMTP id MAA05621
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 12:06:00 -0400 (EDT)
Message-ID: <3D1894AA.6020504@neuronet.pitt.edu>
Date: Tue, 25 Jun 2002 12:04:58 -0400
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] The compiler failed to link application, request for help
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

Hello,

In trying to compile a utility here, I end up with a linker error:

$ gcc -w -o pvmtalk pvmtalk.o dom_x.o usleep.o 
-L/home/neuro/contrib/pvm3.3.11/lib/LINUX -lpvm3 -lgpvm3 
-L/usr/X11R6/lib ../xvertext.5.0/libXrot.a -lX11 -lm
/home/neuro/contrib/pvm3.3.11/lib/LINUX/libpvm3.a(lpvm.o): In function 
`pvmbeatask':
lpvm.o(.text+0x29cf): the use of `tmpnam' is dangerous, better use `mkstemp'
/usr/bin/ld: can not size stub section: Bad value
/usr/bin/ld: BFD 2.12.90.0.1 20020307 Debian/GNU Linux internal error, 
aborting at ../../bfd/elf32-hppa.c line 4038 in elf32_hppa_relocate_section

/usr/bin/ld: Please report this bug.

collect2: ld returned 1 exit status

We have gcc 3.0.4. The sources compile with just some warnings.

Can someone offer any suggestion as to what this means and how we can 
solve it?

Thanks.
-- 
     Rafael
