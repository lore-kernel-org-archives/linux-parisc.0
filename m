From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3 experimental debs - patches
	posted
Date: Fri, 24 Sep 2004 16:03:31 -0700
Message-ID: <20040924230331.GC22642@tausq.org>
References: <20040924132313.GU27033@baldric.uwo.ca>
	<4152E882000003B7@mail-7-bnl.tiscali.it>
	<20040924201920.GY27033@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040924201920.GY27033@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I also recommend building gdb to see if had regressions.

for some reason, i cannot run the gdb testsuite. the failures look
weird:

Executing on host: as ../../../gdb-cvs/gdb/testsuite/gdb.asm/asmsrc1.s -I../../../gdb-cvs/gdb/testsuite/gdb.asm -I/home/tausq/gdb/build-cvs/gdb/testsuite/gdb.asm -gdwarf2 -o asmsrc1.o    (timeout = 300)
spawn as ../../../gdb-cvs/gdb/testsuite/gdb.asm/asmsrc1.s -I../../../gdb-cvs/gdb/testsuite/gdb.asm -I/home/tausq/gdb/build-cvs/gdb/testsuite/gdb.asm -gdwarf2 -o asmsrc1.o
assembler exited with status -1
assembler output is:
spawn failed
WARNING: Testcase compile failed, so all tests in this file will automatically fail.

if i run the "as" command manually it seems to work.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
