Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA31626
	for <parisc-linux@puffin.external.hp.com>; Mon, 11 Dec 2000 11:46:02 -0700
Message-Id: <200012111848.NAA20477@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: law@redhat.com
Date: Mon, 11 Dec 2000 13:48:16 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rth@redhat.com, alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
In-Reply-To: <30059.976555744@upchuck> from "Jeffrey A Law" at Dec 11, 2000 10:29:04 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   In message <20001208225552.A4476@redhat.com>you write:
>   > On Fri, Dec 08, 2000 at 09:05:27PM -0700, Jeffrey A Law wrote:
>   > > Unfortunately, I can't actually test it yet to see what problems removing
>   > > that old hack will expose...
>   > 
>   > Heh.  Perhaps you could forward it to the hppa-linux folk and
>   > see what happens there.  Mayhap their linker is differently
>   > crash-prone.
> I wouldn't count on it :-)  And in general PA linux just isn't ready for
> the kind of testing I need to do for this patch.
> 
> What I really need to do is backport it into devo or 2000r1 where I can
> beat on the PIC & shared library code a little harder than I can on the
> external tree right now due to libstdc++-v3 issues.

This thread started when I attempted a bootstrap with "-g -O3 -fPIC".  The
full bootstrap gives a pretty good check of PIC code generation at least
for non shared code.  For the moment, I disable the new ABI and v3 for
my builds.  You might try "--enable-shared" as well.

I was going to deleting the hack and adding a general_operand test in
local-alloc to see if that would fix the reload problem with "-fPIC".
However, for the moment, there are still problems with a "normal" build
at "-O3".  With only the yesterdays CVS source and the patch below
to prevent rename registers walking of the return pointer, I get the
following failure building libstdc++ v2:

/xxx/gnu/gcc-2.97/objdir/gcc/g++ -B/xxx/gnu/gcc-2.97/objdir/gcc/ -nostdinc++ -isystem /xxx/gnu/gcc-2.97/libstdc++ -isystem /xxx/gnu/gcc-2.97/libstdc++/std -isystem /xxx/gnu/gcc-2.97/libstdc++/stl -isystem /xxx/gnu/gcc-2.97/libio -isystem /xxx/gnu/gcc-2.97/objdir/hppa1.1-hp-hpux10.20/libio -L/xxx/gnu/gcc-2.97/objdir/hppa1.1-hp-hpux10.20/libstdc++ -B/usr/local/hppa1.1-hp-hpux10.20/bin/ -B/usr/local/hppa1.1-hp-hpux10.20/lib/ -isystem /usr/local/hppa1.1-hp-hpux10.20/include -c -O3 -fno-implicit-templates -I../../../libstdc++ -I../../../libstdc++/stl -I../libio -I../../../libstdc++/../libio -I../../../libstdc++/../include -I../../../libstdc++/../gcc -nostdinc++  ../../../libstdc++/exception.cc
../../../libstdc++/exception.cc: In function `void __check_eh_spec(int, const 
   void**)':
../../../libstdc++/exception.cc:363: Internal error: Segmentation fault.
Please submit a full bug report.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[1]: *** [exception.o] Error 1
make[1]: Leaving directory `/xxx/gnu/gcc-2.97/objdir/hppa1.1-hp-hpux10.20/libstdc++'
make: *** [all-target-libstdc++] Error 2

The seg fault occurs in make_edge called from make_label_edge.  It occurs
because BLOCK_FOR_INSN (label) is 0.  The label either has been deleted or
never emitted.  I believe the reference comes from a note.  Didn't have
this problem last week.  If anybody is aware of a change that might have
affected this, let me know.

Progress has been slow in debugging this because there are problems with
the current version of gdb.  Register printouts and even the location
of seg faults is sometimes wrong.  Have to use adb to check results (yuck).
Need to get the current cvs version of gdb working properly on the pa again.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-12-08  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa.h: Define RETURN_POINTER_REGNUM and EPILOGUE_USES.

--- pa.h.orig	Wed Dec  6 20:21:25 2000
+++ pa.h	Fri Dec  8 16:28:58 2000
@@ -480,6 +480,9 @@
 #define INITIAL_FRAME_POINTER_OFFSET(VAR) \
   do {(VAR) = - compute_frame_size (get_frame_size (), 0);} while (0)
 
+/* Register in which the return pointer/address is passed to a function.  */
+#define RETURN_POINTER_REGNUM 2
+
 /* Base register for access to arguments of the function.  */
 #define ARG_POINTER_REGNUM 3
 
@@ -890,6 +893,11 @@
    functions that have frame pointers.
    No definition is equivalent to always zero.  */
 
+/* Define this macro as a C expression that is nonzero for registers
+   used by the epilogue or the `return' pattern.  */
+
+#define EPILOGUE_USES(REGNO) ((REGNO) == RETURN_POINTER_REGNUM)
+
 extern int may_call_alloca;
 
 #define EXIT_IGNORE_STACK	\
