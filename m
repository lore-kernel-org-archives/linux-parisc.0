Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (unknown [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B0FB4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Sep 2002 10:18:41 -0600 (MDT)
Date: Tue, 10 Sep 2002 12:18:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: Jochen Friedrich <jochen@scram.de>,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <20020910161829.GD2732@systemhalted>
References: <Pine.LNX.4.44.0209092343150.2394-100000@alpha.bocc.de> <20020909220448.GP17893@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020909220448.GP17893@tausq.org>
Subject: [parisc-linux] HPUX guru needed -> definition of EWOULDBLOCK in /usr/include/asm/errno.h
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

> 
> On some SysV systems EAGAIN != EWOULDBLOCK. I think we inherited the
> errno definitions from HPUX...
> 
> glibc's documentation says:
> 
> Portability Note: In many older Unix systems, this condition was indicated by EWOULDBLOCK, which was a distinct error code different from EAGAIN. To make your program portable, you should check for both codes and treat them the same. 
> 
> sounds like good advice to me.. :-)
> 
> it does say, however, that for glibc EWOULDBLOCK and EAGAIN should have
> the same value though, so i guess ours is wrong... i wonder if we'll
> break things if we changed it.
> 
> randolph

I agree with randolph, you should change the code to check for EAGAIN aswell.

On the other hand...

We have to do both of the following in order to maintain backwards compatibility.
I'm all for ignoring that and just doing 'b' :}

a. Emulate EWOULDBLOCK == EAGAIN in assembly during syscall errors.
	- Added code to glibc :(

See:
glibc-2.2.5/sysdeps/unix/i386/sysdep.S
glibc-2.2.5/sysdeps/unix/sparc/sysdep.S
glibc-2.2.5/sysdeps/unix/x86_64/sysdep.S
glibc-2.2.5/sysdeps/unix/arm/sysdep.S
...

b. Just change the kernel header to alias EWOULDBLOCK as EAGAIN.

--- linux/include/asm-parisc/errno.h	1999-12-24 12:05:04.000000000 -0500
+++ linux/include/asm-parisc/errno.h.new	2002-09-10 12:09:52.000000000 -0400
@@ -134,7 +134,7 @@
 
 #define	EALREADY	244	/* Operation already in progress */
 #define	EINPROGRESS	245	/* Operation now in progress */
-#define	EWOULDBLOCK	246	/* Operation would block (Linux returns EAGAIN) */
+#define	EWOULDBLOCK	EAGAIN	/* Operation would block (Linux returns EAGAIN) */
 #define	ENOTEMPTY	247	/* Directory not empty */
 #define	ENAMETOOLONG	248	/* File name too long */
 #define	ELOOP		249	/* Too many symbolic links encountered */

This seems best since I don't really see any code in ioctl32.c that returns
EWOULDBLOCK :) We just confuse the applicaiton by providing a different value.
Does this have anything to do with HPUX compatibility? Would an HPUX application
expect different semantic meansings from these two values?

c.
