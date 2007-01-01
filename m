From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] timing bug in clone() ? [BUGFIX-PATCH attached]
Date: Mon, 1 Jan 2007 20:47:10 +0100
Message-ID: <200701012047.10616.deller__3324.87222408435$1416624245$gmane$org@gmx.de>
References: <200612291721.53961.deller@gmx.de> <4595BBC0.2020602@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4595BBC0.2020602@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat Dec 30 2006, Randolph Chung wrote:
> Helge Deller wrote:
> > Help !
> > 
> > I'm trying to find the reason, why the program below segfaults on parisc.
> > if you change the "#if 0" to "#if 1", then it works without segfaulting.
> > 
> > To me it seems we have some kind of race in the linux kernel, e.g.
> > thread exits, wants to notify parent, but parent hasn't returned from clone() call... ?!?
> > 
> > Any ideas ?
> 
> We have some other problems that may be related to this. It might be a
> race in how signals are delivered. We hit some problems with multiple
> threads that seems somewhat similar.  See thread_test2.c in our
> userspace cvs repo. It *might* be the same problem.
> 
> Sorry I don't have any ideas what the real problem is. I tried to debug
> this a bit but reach any conclusions. It might be because our fork() is
> quite slow because of all the cache flushing.

Thanks Randolph !

I've found the bug now... :-)
Patch is attached below, and the problem was not in the kernel, but in glibc.

The first hunk in the patch below ("Save the PIC register.") is the fix for the arguments check which I posted before (http://lists.parisc-linux.org/pipermail/parisc-linux/2006-December/031029.html). This hunk fixes LTP's clone04 test.

The second and third hunk fixes the "return 0" bug as reported by LTP's clone06 test.
It first saves the current FPIC register on the child's stack (to %arg0 instead of %sr0,%sp) and later reads it back from there in the third hunk just before calling _exit().
That way the PIC register has the correct value and exit() doesn't crashes any more.

Now all clone()-tests from LTP succeeds :-)

Helge


--- glibc-2.3.6.ds1/build-tree/glibc-2.3.6/debian/sysdeps/unix/sysv/linux/hppa/clone.S.org	2006-12-29 08:49:25.000000000 +0100
+++ glibc-2.3.6.ds1/build-tree/glibc-2.3.6/debian/sysdeps/unix/sysv/linux/hppa/clone.S	2007-01-01 19:53:00.000000000 +0100
@@ -32,6 +32,11 @@
 ENTRY(__clone)
 	/* FIXME: I have no idea how profiling works on hppa. */
 
+	/* Save the PIC register. */
+#ifdef PIC
+	stw	%r19,-32(%sr0, %sp)	/* parent */
+#endif
+
 	/* Sanity check arguments.  */
 	comib,=  0,%arg0,.Lerror        /* no NULL function pointers */
 	ldi     -EINVAL,%ret0
@@ -41,10 +46,8 @@
 	/* Save the fn ptr and arg on the new stack.  */
 	stwm    %arg0,64(%arg1)
 	stw	%arg3,-60(%arg1)
