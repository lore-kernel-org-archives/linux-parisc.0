Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blimpo.internal.net (ppp01.ts1-1.NewportNews.visi.net [209.8.196.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4DBC1482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Oct 2001 07:54:25 -0600 (MDT)
Date: Sat, 20 Oct 2001 09:54:06 -0400
From: Ben Collins <bcollins@debian.org>
To: parisc-linux@lists.parisc-linux.org, randolph@tausq.org
Message-ID: <20011020095406.L10952@visi.net>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020170907.G1037@bubble.sa.bigpond.net.au>
Sender: Ben Collins <bmc@visi.net>
Subject: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 20, 2001 at 05:09:07PM +0930, Alan Modra wrote:
> Newer binutils don't initialise .got entries for global syms, so the
> scheme used by sysdeps/hppa/dl-machine.h:elf_machine_dynamic to find
> the address of .dynamic no longer works.
> 
> ChangeLog
> 	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic):  Make it a
> 	const function.  Do not use &_DYNAMIC as .got entries for global
> 	syms are no longer initialised.  Instead they rely on the reloc,
> 	which hasn't yet been applied.
> 	(elf_machine_load_address): Make it const.  Call
> 	elf_machine_dynamic as that function is called fropm rtld anyway.

Is this the fix for a newly built ld.so segfaulting? If so, there seems
to be something else wrong too. Newly built ld.so still segfaults,
here's the gdb:

Starting program: /usr/src/glibc/glibc-2.2.4/./hppa-linux/obj/elf/ld.so

Program received signal SIGSEGV, Segmentation fault.
0x41003298 in _dl_start_final (arg=0xbff00414, bootstrap_map_p=0xbff00508, start_time=1090519040)
    at rtld.c:233
233       _dl_rtld_map.l_addr = bootstrap_map_p->l_addr;
(gdb) print bootstrap_map_p
$1 = (struct link_map *) 0xbff00508
(gdb) print bootstrap_map_p->l_addr
$2 = 1090519040
(gdb) print &_dl_rtld_map
$3 = (struct link_map *) 0x41029270
(gdb) print _dl_rtld_map.l_addr
$4 = 0


This is with binutils 2.11.92.0.7 and gcc-3.0.2 snapshot from 9-22-2001
(latest Debian packages available). I can give you more info if you need
it.

-- 
 .----------=======-=-======-=========-----------=====------------=-=-----.
/                   Ben Collins    --    Debian GNU/Linux                  \
`  bcollins@debian.org  --  bcollins@openldap.org  --  bcollins@linux.com  '
 `---=========------=======-------------=-=-----=-===-======-------=--=---'
