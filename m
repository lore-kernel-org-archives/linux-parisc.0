Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 251B4482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 01:05:36 -0700 (MST)
Subject: [parisc-linux] /lib/ld.so.1 (glibc) issues on parisc-linux 2.5
	kernel??
From: Ryan Bradetich <rbradetich@uswest.net>
To: libc-alpha@sources.redhat.com
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Message-Id: <1048493134.8777.22.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 24 Mar 2003 01:05:34 -0700
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

Hello again,

I have been working on tracking this down some more, and I think I found
something odd.  I just wanted to verify this is an anomaly (and
potentially the problem) or if this is the correct behavior, understand
why.


I am starting to think the kernel is doing the correct thing and
glibc is causing the problem ... based on debug output from i386
and just my general understanding (or lack of understanding :))
of the elf file format.

The bootstrap_map.l_addr was printed using _dl_debug_printf right
after the following line in glibc-2.3.1/elf/rtld.c:

	      ELF_DYNAMIC_RELOCATE (&bootstrap_map, 0, 0);

The ENTRY_POINT, _start, and user_entry line was added as the first
line of code in the function dl_main in glibc-2.3.1/elf/rtld.c.

This is the debug output on hppa:
---------------------------------
rbrad@vega:~/glibc-2.3.1/hppa-linux/obj/elf$ ./ld.so --verify /bin/sh

05626:  bootstrap_map.l_addr: 41000000
05626:  ENTRY_POINT: 41027162 _start: 41027162 user_entry: 41001ff0


This is the Entry point address from the ld.so library on hppa:
---------------------------------------------------------------
rbrad@vega:~/glibc-2.3.1/hppa-linux/obj/elf$ readelf -a ld.so | grep
Entry
  Entry point address:               0x1ff0




This is the debug output on i386:
---------------------------------
rbrad@beavis:~/debug/glibc-2.3.1/i386-linux/obj/elf$ ./ld.so --verify
/bin/sh
18878:  bootstrap_map.l_addr: 80000000
18878:  ENTRY_POINT: 80000b10 _start: 80000b10 user_entry: 80000b10


This is the Entry point address from the ld.so library on i386:
---------------------------------------------------------------
rbrad@beavis:~glibc-2.3.1/i386-linux/obj/elf$ readelf -a ld.so | grep
Entry
  Entry point address:               0xb10



The i386 library makes sense to me: the bootstrap_map.l_addr + the
_start == the user_entry point. On hppa, this is not true, and I 
do not understand why.  The reason why this works when the AT_ENTRY
aux header is not added is because the user_entry defaults to
ENTRY_POINT, and is modified iff the aux AT_ENTRY header is present.
[Note: this code is at:
   glibc-2.3.1/sysdeps/generic/dl-sysdep.c:_dl_sysdep_start()]


Is there a bug in the dynamic loader for hppa that doesn't load the 
address at load_address + _start?  Or can someone explain why there
is an additional 0x25172 byte offset for the entry point? 

I will keep digging around and see what I can dig up, but without
understanding how the dynamic loader works, I feel pretty blind.

Thanks,

- Ryan

P.S. Please cc me on any responses... I am not subscribed to this
list.


-- 
Ryan Bradetich <rbradetich@uswest.net>
