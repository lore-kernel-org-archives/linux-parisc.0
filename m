Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5AF23482B
	for <parisc-linux@parisc-linux.org>; Sat, 27 Oct 2001 08:26:24 -0600 (MDT)
Message-ID: <3BDAC2FE.DBF72DDD@esiee.fr>
Date: Sat, 27 Oct 2001 16:21:50 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>,
	debian-hppa-request@lists.debian.org
Content-Type: multipart/mixed;
 boundary="------------DE19AA66CC3EFD0503049108"
Subject: [parisc-linux] Troubles with expect scripts
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

This is a multi-part message in MIME format.
--------------DE19AA66CC3EFD0503049108
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

	We are using some scripts using Expect language and they die with a
segmentation fault and you can read this output in the dmesg:

do_page_fault() pid=1068 command='webco' type=15 address=0x000ac800
vm_start = 0x00020000, vm_end = 0x00021000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000100001111
r0-3     00000000 000ac800 400864a7 faf00440
r4-7     40124438 4002a09c 40028a64 faf001c8
r8-11    faf001b8 00000003 00000003 000b9750
r12-15   00000000 ffffffff 000b9930 00000000
r16-19   00000000 00017800 00017800 40124438
r20-23   00000001 00010b9c 40086484 400288f8
r24-27   faf001c8 faf001b8 00000003 00020cb4
r28-31   4001d806 7efefeff faf004c0 4000dd67
sr0-3    00000000 00000af9 00000000 00000af9
sr4-7    00000af9 00000af9 00000af9 00000af9

IASQ: 00000af9 00000af9 IAOQ: 40086607 4008660b
 IIR: 0c201094    ISR: 00000af9  IOR: 000ac800
 CPU:        0   CR30: 16554000 CR31: 102e0000
 ORIG_R28: 4002a09c

I have recently updated glibc 2.2.4-3 but I tried Helge Deller's
"working" version with no result and I tried to recompile the package
and it was useless :( I also attached the output of strace -o output
webco 

If anyone has an idea, please try to fix it.

Thomas
ESIEE Team
--------------DE19AA66CC3EFD0503049108
Content-Type: text/plain; charset=us-ascii;
 name="output"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="output"

execve("/usr/local/bin/webco", ["webco"], [/* 19 vars */]) = 0
newuname({sys="Linux", node="dharma", ...}) = 0
brk(0)                                  = 0x21000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 7078, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40019000
close(3)                                = 0
open("/usr/lib/libexpect5.32.so.1", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\237"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 278388, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4002b000
mprotect(0x4005a000, 85876, PROT_NONE)  = 0
mmap(0x40069000, 16384, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x2e000) = 0x40069000
mmap(0x4006d000, 8052, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4006d000
close(3)                                = 0
open("/usr/lib/libtcl8.3.so.1", O_RDONLY) = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\1t\304"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 752784, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4006f000
mprotect(0x4010c000, 109712, PROT_NONE) = 0
mmap(0x4011b000, 49152, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x9c000) = 0x4011b000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0 D"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 75736, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40127000
mprotect(0x4012a000, 63448, PROT_NONE)  = 0
mmap(0x40139000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x40139000
close(3)                                = 0
open("/lib/libm.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\244"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 592524, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4013a000
mprotect(0x401b9000, 72332, PROT_NONE)  = 0
mmap(0x401c8000, 12288, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x7e000) = 0x401c8000
close(3)                                = 0
open("/lib/libutil.so.1", O_RDONLY)     = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\16"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 73600, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x401cb000
mprotect(0x401cd000, 65408, PROT_NONE)  = 0
mmap(0x401dc000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x1000) = 0x401dc000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\2z\240"..., 1024) = 1024
fstat64(3, {st_mode=0, st_size=0, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001b000
mmap(NULL, 1416396, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x401dd000
mprotect(0x4031a000, 117964, PROT_NONE) = 0
mmap(0x40329000, 45056, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x13c000) = 0x40329000
mmap(0x40334000, 11468, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40334000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001c000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001d000
mprotect(0x10000, 4096, PROT_READ|PROT_WRITE) = 0
mprotect(0x10000, 4096, PROT_READ|PROT_EXEC) = 0
munmap(0x40019000, 7078)                = 0
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++

--------------DE19AA66CC3EFD0503049108--
