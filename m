Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id D10804A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 09:26:06 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8F109B007; Fri, 16 Mar 2001 16:25:17 +0000 (GMT)
Date: Fri, 16 Mar 2001 16:25:17 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010316162517.Z31505@linuxcare.com>
References: <20010316115535.X31505@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010316115535.X31505@linuxcare.com>; from rhirst@linuxcare.com on Fri, Mar 16, 2001 at 11:55:35AM +0000
Subject: [parisc-linux] Re: New glibc on 715/75
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 16, 2001 at 11:55:35AM +0000, Richard Hirst wrote:
> I am trying the glibc etc from newcompilers-20010314 on my 715/75.
> It seems anything that is dynamically linked hangs on exit.

Hangs in this loop:

0x40014150 <__hppa_make_fptr+56>:       ldw 5f0(sr0,r1),r1
0x40014154 <__hppa_make_fptr+60>:       ldcw  0(sr0,r1),r1
0x40014158 <__hppa_make_fptr+64>:       cmpib,= 0,r1,0x40014150 <__hppa_make_fptr+56>
0x4001415c <__hppa_make_fptr+68>:       addil 0,r19,%r1

r19 = 4001a930.

For a good run on the B180, I get in to this code with the
same r19.  r1=r19, r1+0x5f0=0x4001af20

0x4001af20 <errno+1848>:        0x4001a7c8

0x4001a7c8 <__hppa_fptr_lock>:  0x00000001


Presumably on the 715/75 __hppa_fptr_lock is zero.

(gdb) bt
#0  0x40014150 in __hppa_make_fptr (sym_map=0x4001c508, value=1075005768, 
    root=0x4001a7cc, mem=0x0) at ../linuxthreads/sysdeps/hppa/pt-machine.h:44
#1  0x40014108 in _dl_function_address (map=0x4001c508, start=1075005768)
    at ../sysdeps/hppa/dl-symaddr.c:38
#2  0x4000f5e0 in _dl_fini () at dl-fini.c:170
#3  0x40060ff4 in exit () from /lib/libc.so.6
#4  0x40047460 in __libc_start_main () from /lib/libc.so.6
#5  0x0000139c in _start ()
#6  0x40014108 in _dl_function_address (map=0x4001c508, start=1075005768)
    at ../sysdeps/hppa/dl-symaddr.c:38

__hppa_make_fptr() is in sysdeps/hppa/dl-fptr.c


Richard
