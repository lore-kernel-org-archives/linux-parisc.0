From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] (hppa glibc 2.3.3 exp.) Recompile expect, then
Date: Mon, 27 Sep 2004 00:22:13 -0400
Message-ID: <20040927042212.GN27033@baldric.uwo.ca>
References: <20040926185101.GE27033@baldric.uwo.ca>
	<200409261903.i8QJ3gA9011157@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409261903.i8QJ3gA9011157@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 26, 2004 at 03:03:42PM -0400, John David Anglin wrote:
> > Does it spend 5 minutes writing errors to the terminal? :)
> 
> No.  It either dumps core or hangs.

Haha :)
 
> > Have you tried running the experimental glibc packages in a chroot?
> 
> Sorry, I haven't had time in the past few days.  I've had a contract
> to get GCC buiding on AIX 4.3.3.

I ran my own. How does this look? I don't like the SEGV there...

make[1]: Entering directory `/mnt/flaire/src/toolchain-build/src/gcc-build32-glibc-2.3.3/gcc'
(rootme=`${PWDCMD-pwd}`; export rootme; \
srcdir=`cd ../../gcc-cvs/gcc; ${PWDCMD-pwd}` ; export srcdir ; \
cd testsuite; \
EXPECT=expect ; export EXPECT ; \
if [ -f ${rootme}/../expect/expect ] ; then  \
   TCL_LIBRARY=`cd .. ; cd ../../gcc-cvs/gcc/../tcl/library ; ${PWDCMD-pwd}` ; \
    export TCL_LIBRARY ; fi ; \
runtest --tool gcc )
Test Run By carlos on Sun Sep 26 14:58:56 2004
Native configuration is hppa-unknown-linux-gnu

                === gcc tests ===

Schedule of variations:
    unix

Running target unix
Using /usr/share/dejagnu/baseboards/unix.exp as board description file for target.
Using /usr/share/dejagnu/config/unix.exp as generic interface file for target.
Using /home/carlos/fsrc/toolchain-build/src/gcc-cvs/gcc/testsuite/config/default.exp as tool-and-target-specific interface file.
Running /home/carlos/fsrc/toolchain-build/src/gcc-cvs/gcc/testsuite/gcc.c-torture/compile/compile.exp ...
FAIL: gcc.c-torture/compile/20020807-1.c  -O3 -fomit-frame-pointer  (test for excess errors)
FAIL: gcc.c-torture/compile/20020807-1.c  -O3 -g  (test for excess errors)
FAIL: gcc.c-torture/compile/20040602-1.c  -O0  (test for excess errors)
FAIL: gcc.c-torture/compile/20040602-1.c  -O1  (test for excess errors)
FAIL: gcc.c-torture/compile/20040602-1.c  -O2  (test for excess errors)
FAIL: gcc.c-torture/compile/20040602-1.c  -O3 -fomit-frame-pointer  (test for excess errors)
FAIL: gcc.c-torture/compile/20040602-1.c  -O3 -g  (test for excess errors)
FAIL: gcc.c-torture/compile/20040602-1.c  -Os  (test for excess errors)
Running /home/carlos/fsrc/toolchain-build/src/gcc-cvs/gcc/testsuite/gcc.c-torture/execute/builtins/builtins.exp ...
got a SEGV signal, segmentation violation

                === gcc Summary ===

# of expected passes            3589
# of unexpected failures        8
# of expected failures          6
# of unsupported tests          30
WARNING: program timed out.
Couldn't determine version of /usr/bin/gcc:

This is the 3_4-branch from a little while back.

It looks like it's still running?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
