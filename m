From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] (hppa glibc 2.3.3 exp.) Recompile expect,
	then run gdb tests with new expect?
Date: Sat, 25 Sep 2004 08:37:54 -0400
Message-ID: <20040925123745.GZ27033@baldric.uwo.ca>
References: <20040924132313.GU27033@baldric.uwo.ca>
	<4152E882000003B7@mail-7-bnl.tiscali.it>
	<20040924201920.GY27033@baldric.uwo.ca>
	<20040924230331.GC22642@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040924230331.GC22642@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 24, 2004 at 04:03:31PM -0700, Randolph Chung wrote:
> > I also recommend building gdb to see if had regressions.
> 
> for some reason, i cannot run the gdb testsuite. the failures look
> weird:
> 
> Executing on host: as ../../../gdb-cvs/gdb/testsuite/gdb.asm/asmsrc1.s -I../../../gdb-cvs/gdb/testsuite/gdb.asm -I/home/tausq/gdb/build-cvs/gdb/testsuite/gdb.asm -gdwarf2 -o asmsrc1.o    (timeout = 300)
> spawn as ../../../gdb-cvs/gdb/testsuite/gdb.asm/asmsrc1.s -I../../../gdb-cvs/gdb/testsuite/gdb.asm -I/home/tausq/gdb/build-cvs/gdb/testsuite/gdb.asm -gdwarf2 -o asmsrc1.o
> assembler exited with status -1
> assembler output is:
> spawn failed
> WARNING: Testcase compile failed, so all tests in this file will automatically fail.
> 
> if i run the "as" command manually it seems to work.

I think something is broken with expect. Kernel builds seem to progress
well. I'm running a glibc build right now to see if we pickup any
regressions.

If you have a couple of free minutes could you see if you can test
that expect works separately?

I might even recommend rebuilding expect under the new libc and see if
that helps. I'm not saying that this is a solution, but rather that
we might have some slightly incompatible changes somewhere. Perhaps some
behaviour that is *allowed* to change that expect relied upon.

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
