Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: bug-binutils@gnu.org
Cc: parisc-linux@lists.parisc-linux.org
Message-Id: <20030131070155.8DDFD482A@dsl2.external.hp.com>
Date: Fri, 31 Jan 2003 00:01:55 -0700 (MST)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] PATCH hppa ordered load absolute ops
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

in trying to close a potential memory ordering hole for pa2.0 machines,
I've run into the following problem with binutils.

hppa linux kernel uses ldwa to access MMIO space instead of
using virtually mapped addresses. Normally, ordering is enforced
automatically to all IO space accesses according to the PA 2.0 architecture.
However, some platforms (not supported yet) have IO devices responding
to physical addresses *outside* the architected IO spaces and that's
the hole I was trying to close.

hppa64-linux-gcc -D__KERNEL__ -I/home/src/2.4.20/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -mpa-risc-2-0 -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=2.0 -mschedule=8000   -nostdinc -I /opt/palinux/lib/gcc-lib/hppa64-linux/3.0.4/include -DKBUILD_BASENAME=eeprom  -c -o eeprom.o eeprom.c
{standard input}: Assembler messages:
{standard input}:1039: Error: Invalid operands 
{standard input}:1054: Error: Invalid operands 
...

the -S output from eeprom.s looks like:
...
   1034 #NO_APP
   1035         extrd,u %r19,63,32,%r19
   1036 #APP
   1037                 stwa,o  %r19,0(%r26)
   1038 
   1039                 ldwa,o  0(%r26),%r21
   1040 
   1041 #NO_APP
   1042         or %r20,%r22,%r20

As one can see, "stwa,o" was ok but "ldwa,o" was not.
I've checked the pa2.0 arch and one of the restrictions is
the "im5" value must be zero (which it obviously is).

Appended is my very first attempt at adding a new opcode.
i think I have the match/mask fields right.
I'm still a bit sketchy on co/cc/@ specs.

thanks,
grant

--- ./binutils-2.13.90.0.16/include/opcode/hppa.h-orig  2003-01-30 21:06:56.000000000 -0800
+++ ./binutils-2.13.90.0.16/include/opcode/hppa.h       2003-01-30 22:58:54.000000000 -0800
@@ -405,6 +405,7 @@ static const struct pa_opcode pa_opcodes
 { "ldbx",       0x0c000000, 0xfc001fc0, "cXx(b),t", pa10, 0},
 { "ldwa",       0x0c000180, 0xfc00d3c0, "cxccx(b),t", pa10, FLAG_STRICT},
 { "ldwa",	0x0c001180, 0xfc00d3c0, "cmcc5(b),t", pa10, FLAG_STRICT},
+{ "ldwa",	0x0c0031a0, 0xfc1ff3d0, "cocc@(b),t", pa20, FLAG_STRICT},
 { "ldcw",       0x0c0001c0, 0xfc0013c0, "cxcdx(s,b),t", pa10, FLAG_STRICT},
 { "ldcw",       0x0c0001c0, 0xfc0013c0, "cxcdx(b),t", pa10, FLAG_STRICT},
 { "ldcw",	0x0c0011c0, 0xfc0013c0, "cmcd5(s,b),t", pa10, FLAG_STRICT},
@@ -415,6 +416,7 @@ static const struct pa_opcode pa_opcodes
 { "stby",	0x0c001300, 0xfc0013c0, "cscCx,V(b)", pa10, FLAG_STRICT},
 { "ldda",       0x0c000100, 0xfc00d3c0, "cxccx(b),t", pa20, FLAG_STRICT},
 { "ldda",	0x0c001100, 0xfc00d3c0, "cmcc5(b),t", pa20, FLAG_STRICT},
+{ "ldda",	0x0c003100, 0xfc1ff3d0, "cocc@(b),t", pa20, FLAG_STRICT},
 { "ldcd",       0x0c000140, 0xfc0013c0, "cxcdx(s,b),t", pa20, FLAG_STRICT},
 { "ldcd",       0x0c000140, 0xfc0013c0, "cxcdx(b),t", pa20, FLAG_STRICT},
 { "ldcd",	0x0c001140, 0xfc0013c0, "cmcd5(s,b),t", pa20, FLAG_STRICT},
