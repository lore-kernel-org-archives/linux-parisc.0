From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] is this a known hppa64-linux-ld bug?
Date: Sat, 11 Sep 2004 02:17:25 -0700
Message-ID: <20040911091725.GM28659@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

i'm doing some experiments with code that contains:

.section .text.function, "ax"
....
1: stw %r19,(%sr3,%r20)
2: /* some other insn */
....

.section .fixup, "ax"
3: b,l 2b
.previous

.section __ex_table, "aw"
.dword 1b,3b
.previous

when this code is compiled and assembled, i can see in the disassembly
that the insn at "3:" contains a PCREL17F reloc against
.text.function+xxx which is pointing to the location of "2:". So far so
good...

But after linking with the rest of the kernel, the b,l address at "3:"
is wrong (it points to an address that is an offset from the __ex_table
section). 

not sure why this is happening, but it looks like a ld bug?

does anybody have a suggestion for a workaround? 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
