From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] confirme: bug in arg checking in clone.S
Date: Sat, 04 Mar 2006 20:00:17 +0000
Message-ID: <4409F1D1.70605@tiscali.be>
References: <200601080241.07960.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200601080241.07960.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Mike and list,

Mike Frysinger wrote:
> for some reason the attached test case (originally from LTP) segfaults on 
> glibc/hppa systems ... every other arch ive tested on works fine ...
> 
Ok I find this LTP Stuff.
# ./clone04
clone04     1  BROK  :  Unexpected signal 11 received.


Effectively, as the comment said:
  * DESCRIPTION
  *      Verify that,
  *      clone(2) returns -1 and sets errno to EINVAL if
  *      child stack is set to a zero value(NULL)

Also as your subject better explain, the hppa implementation didn't do a "Sanity check arguments" (as other arch does).

Can somebody could check this patch proposal:
--- ./sysdeps/unix/sysv/linux/hppa/clone.S.Orig 2006-01-14 17:48:33.000000000 +0000
+++ ./sysdeps/unix/sysv/linux/hppa/clone.S      2006-03-04 19:46:03.000000000 +0000
@@ -46,6 +46,11 @@
          .text
  ENTRY(__clone)

+       /* Sanity check arguments.  */
+       ldi     -EINVAL, %ret0
+       comib,=,n       0,%r26,.Lerror  /* no NULL function pointers */
+       comib,=,n       0,%r25,.Lerror  /* no NULL stack pointers */
+
         /* Save the fn ptr and arg on the new stack.  */
         stwm    %r26,64(%r25)
         stw     %r23,-60(%r25)
====<>====

(Not sure I didn't miss some nop in delay slot on comib?)

Thanks in advance,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
