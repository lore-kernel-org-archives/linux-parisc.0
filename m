Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8B77482A
	for <parisc-linux@parisc-linux.org>; Mon,  8 Apr 2002 22:24:37 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id xlzkmaaa for parisc-linux@parisc-linux.org; Mon, 8 Apr 2002 21:23:31 -0700
Date: Mon, 8 Apr 2002 21:38:55 -0700
From: Randolph Chung <tausq@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020409043855.GI7563@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] volunteer sought for a binutils project
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

When building 64-bit kernels, the linker puts dynamic sections into the
resulting vmlinux file. This is not harmful per se, but is nonetheless
wrong (and confuses some of the modutils tools). Alan Modra explains 
the situation and how to fix it below. Anyone feel like give this a 
shot?

randolph

----- Forwarded message from Alan Modra <amodra@bigpond.net.au> -----

Date: Mon, 8 Apr 2002 17:18:29 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: Randolph Chung <tausq@debian.org>
Cc: dave@hiauly1.hia.nrc.ca
Subject: Re: unwind sections not sorted?

> legolas[19:30] t% readelf -d ./vmlinux-pa7
> 
> Dynamic segment at offset 0x25ee30 contains 11 entries:
>   Tag        Type                         Name/Value
>  0x0000000000000004 (HASH)               0x102ee4e0
>  0x0000000000000005 (STRTAB)             0x102ee4d8
>  0x0000000000000006 (SYMTAB)             0x102ee4d8
>  0x000000000000000a (STRSZ)              1 (bytes)
>  0x000000000000000b (SYMENT)             24 (bytes)
>  0x0000000060000001 (<unknown>: 60000001) 0 0x0000000000000003 (PLTGOT)             0x10383470
>  0x0000000000000015 (DEBUG)              0x0
>  0x0000000060000002 (<unknown>: 60000002) 0x0 0x0000000060000000 (<unknown>: 60000000) 0x102f6000 0x0000000000000000 (NULL)               0x0

Hrrm.  OK, another bug in elf64-hppa.c.  elf64_hppa_check_relocs creates
_all_ the dynamic sections whether needed or not.  It certainly shouldn't
be calling bfd_elf64_link_create_dynamic_sections, but rather call
elf64_hppa_create_dynamic_sections to create the sections the backend
needs.  Then of course, elf64_hppa_create_dynamic_sections needs to be
modified to not duplicate sections.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre

----- End forwarded message -----
