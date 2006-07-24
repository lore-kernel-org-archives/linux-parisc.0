From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 14:27:58 -0400
Message-ID: <20060724182758.GC15566@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: klibc@zytor.com
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I hacked out a rough first implementation of parisc64 for klibc
last month, and only just got around to testing it now.

The good news, it compiled fine on the first shot. The bad news,
it failed to link usr/klibc/libc.so, and I'm not clueful enough
to know why.

hppa64-linux-gnu-ld  -Ttext 0x40001000 -o usr/klibc/libc.so --start-group
[...]
usr/klibc/socketcalls/recvmsg.o /usr/lib/gcc/hppa64-linux-gnu/4.1.2/libgcc.a --end-group
hppa64-linux-gnu-ld: warning: cannot find entry symbol main; defaulting to 0000000040001000
hppa64-linux-gnu-ld: usr/klibc/libc.so: Not enough room for program headers (allocated 5, need 6)
 Section to Segment mapping:
  Segment              Sections...
  00:           PHDR:  
  01:         INTERP:  .interp 
  02:           LOAD:  .interp .dynamic .hash .dynsym .dynstr 
  03:           LOAD:  .text .rodata .PARISC.unwind .eh_frame 
  04:           LOAD:  .data.rel.ro .data .opd .dlt .bss 
  05:        DYNAMIC:  .dynamic 
hppa64-linux-gnu-ld: final link failed: Bad value
make[2]: *** [usr/klibc/libc.so] Error 1
make[1]: *** [all] Error 2
make: *** [klibc] Error 2

You can fetch it from
git://git.kernel.org/pub/scm/linux/kernel/git/kyle/klibc-parisc64.git,
and compile it with:

make CROSS_COMPILE=hppa64-linux-gnu- ARCH=parisc64 V=1

(It seemed to build without warning on my Debian etch rp2470)

Any hints would be appreciated.

Cheers,
	Kyle M.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
