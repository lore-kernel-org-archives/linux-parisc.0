Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep01-mail.bloor.is.net.cable.rogers.com (fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1343E4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 13:39:23 -0600 (MDT)
Date: Mon, 19 May 2003 15:40:28 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
Message-ID: <20030519194028.GA542@systemhalted>
References: <200305191705.h4JH5YPo020750@hiauly1.hia.nrc.ca> <Pine.BSF.4.53.0305191732240.86062@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.53.0305191732240.86062@e0-0.zab2.int.zabbadoz.net>
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

> What is this patch for ?
> 	glibc23-hppa-Rminkernel.dpatch

Does two things:

1- Sets minimum required kernel version for glibc to run on.
2- Enables unwind_find_fde copat code.
 
> make[4]: Target `tests' not remade because of errors.
> make[4]: Leaving directory `/u1/src/glibc/glibc-2.3.1/glibc-2.3.1/elf'
> make[3]: *** [elf/tests] Error 2
> make[3]: Target `check' not remade because of errors.
> make[3]: Leaving directory `/u1/src/glibc/glibc-2.3.1/glibc-2.3.1'
> make[2]: *** [check] Error 2
> make[2]: Leaving directory `/u1/src/glibc/glibc-2.3.1/hppa-linux/obj'
> date >>/u1/src/glibc/glibc-2.3.1/log-test-hppa-linux
> make[1]: Leaving directory `/u1/src/glibc/glibc-2.3.1'
> touch /u1/src/glibc/glibc-2.3.1/hppa-linux/compiled-source
>  debian/rules binary
> Need root privileges
> make: *** [/u1/src/glibc/glibc-2.3.1/hppa-linux/installed-binaries] Error 1

Did you use -rfakeroot as a dpkg-buildpackage option?
 
> PS: again from building time (2.5.69-pa1) :

Can't help you there since I can't recreate the problem.

c.
