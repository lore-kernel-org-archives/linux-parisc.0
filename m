From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Sat, 26 Mar 2005 10:48:06 -0500 (EST)
Message-ID: <200503261548.j2QFm7eL005849@hiauly1.hia.nrc.ca>
References: <16965.9081.148972.856329@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <16965.9081.148972.856329@gargle.gargle.HOWL> from "Matthias
	Klose" at Mar 26, 2005 09:55:21 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>   it's not that recent (I can't upload this one every week without the
>   risk beeing killed by buildd admins for slower architectures ;)
> 
> - You can get gcc-4.0 packages from experimental, just add
>   deb http://http.us.debian.org/debian experimental main contrib
>   to /etc/apt/sources.list.
>   Provided that somebody is building and uploading these ...
> 
> Besides the recent gcc-snapshot build failure, I'm having problems
> building the packages at all at the moment, there's no difference
> using between sarge and unstable.

I've had this problem from time to time, particularly on server
machines.  My c3k is solid and this doesn't happen.  For some reason,
the libjava build is most prone to the segfaults in sh/bash and
sometimes make.  Grant's recent builds on gsyprf11 seem to have
changed the nature of the faults.  Now, the kernel panics instead
of a segfault in sh.  Grant would know more as to what's causing
these crashes.

> - if the build succeeds, every test case in the testsuite fails, due
>   to expect(?) problems. lamont told me that's reproducible on another
>   A500, seeing some messages on the serial console, but I can't see
>   these messages. I'm currently running the A500 kernels from the
>   parisc archives. palinux-a500-defconfig-2.6.{8.1-pa11,11-pa2,12-rc1-pa1}
>   all show the same behaviour.

I think that there are issues with expect, tcl and dejagnu.

1) Dejagnu asks expect to trap SEGFAULTS.  This is undefined and results
   in the fault insn being executed repeatively.  It's a simple one line
   fix to remove this:

--- runtest.exp.orig    2004-08-25 16:10:38.000000000 -0400
+++ runtest.exp 2004-08-25 16:11:13.000000000 -0400
@@ -1503,8 +1503,7 @@
 if ![exp_debug] {
      foreach sig "{SIGTERM {terminated}} \
		    {SIGINT  {interrupted by user}} \
-             {SIGQUIT {interrupted by user}} \
-             {SIGSEGV {segmentation violation}}" {
+             {SIGQUIT {interrupted by user}}" {
	 set signal [lindex $sig 0]
	 set str [lindex $sig 1]
	 trap "send_error \"got a \[trap -name\] signal, $str \\n\"; log_and_exit;" $signal

   I've probably munged the diff doing a cut and paste.

2) There is some kind of timing issue with expect/tcl when a given
   test ends.  This causes expect to hang.  When this happens, you
   will see a defunct expect task.  It is a child of the expect task
   that is hung.

   Tcl 8.3 works better than 8.4.  I know they have changed some of
   the code in this area but I don't know why this happens.  I've also
   had this happen on x86 but pa seems much more prone to this problem.

   Tcl 8.3 also works better for tests that generate a lot of output.
   It is less likely to truncate the output resulting in a test failure.
   I think this has to do with the handling of pipes at exit.

3) A warning appears compiling expect in a couple of places regarding
   the second argument of waitpid.  It's always int.  However, expect
   thinks the type of this argument is WAIT_STATUS_TYPE.  This gets
   used when NO_UNION_WAIT isn't defined.  This problem can be worked
   around be adding "-ansi -D_SVID_SOURCE -D_POSIX_SOURCE" to CFLAGS.
   I had hoped that fixing this would resolve the expect hangs but it
   doesn't seem to help.  However, I do like a build without warnings.
   To get this with the above CFLAGS, a number of missing include
   directives need to be added.

   I use the following setup:

   dave@hiauly6:~/gnu/expect-5.43/objdir$ runtest --version
   WARNING: Couldn't find the global config file.
   Expect version is       5.43.0
   Tcl version is          8.3
   Framework version is    1.4.4

   I haven't seen any significant difference in behavior between
   5.42.1 and 5.43.0.  The former is the debian patched source.

4) There is a exit timing issue in tcl 8.4.  I tried a patch from the
   tcl list that claimed to fix this but it didn't seem to fix either
   the hangs or the truncation problem.

> - The libjava build sometimes fails with an sh/bash error. Restarting
>   the build usually fixes this.

:(  I've been hoping that some of these issues are caused by the put_user
problem.

> - gnat doesn't build, even if you include some prebuilt files (which
>   might be wrongly generated) from another build.

I've been regularly building gnat, so I think that you may have a problem
with your prebuilt files.  There was an issue like this in going from
3.3 to 3.4.  If you are starting from 3.3, try starting from 3.4.

There is an issue with tasking.  I have a patch to enable tasking
in Ada.  However, even the simplest possible Ada program that uses
tasking hangs.  I haven't had a chance to look at it much but it
seems like that we may have a problem with signals and thread
support.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
