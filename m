Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C0BD482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 13:30:09 -0700 (MST)
Message-Id: <200211212030.gALKU3h6001922@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.5cvs with gcc-3.3cvs
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Thu, 21 Nov 2002 15:30:03 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.44.0211212015160.39295-100000@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at Nov 21, 2002 08:23:24 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

>         ld  -T arch/parisc/vmlinux.lds.s arch/parisc/kernel/head.o   init/built-in.o --start-group  usr/built-in.o arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o  arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o  arch/parisc/hpux/built-in.o  arch/parisc/math-emu/built-in.o
> arch/parisc/kernel/init_task.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  lib/lib.a  arch/parisc/lib/lib.a `gcc -print-libgcc-file-name`  drivers/built-in.o  sound/built-in.o  net/built-in.o --end-group  -o vmlinux
> arch/parisc/kernel/built-in.o(__ksymtab+0x250): undefined reference to `$$mulU'

$$mulU is a non-existant millicode function.  It is not needed and the
reference should be removed from the kernel source.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
