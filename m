Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC8364A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 06:05:19 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA04348;
	Wed, 28 Feb 2001 00:04:51 +1100
Date: Wed, 28 Feb 2001 00:04:51 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP: We have ignition
In-Reply-To: <E14XiiG-0003Ee-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.21.0102272335540.18409-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 27 Feb 2001, Alan Cox wrote:

> Why isnt gcc prototyping and defining
> 
> 	__memcpy
> 	__strncpy
> 
> and #defining them across in libc header files ?

Huh?

> Is there a 'dont use builtins' flag ?

-fno-builtin

I'd be inclined to do this instead

--- include/asm-parisc/posix_types.h~	Tue Dec  5 13:13:45 2000
+++ include/asm-parisc/posix_types.h	Tue Feb 27 23:30:11 2001
@@ -19,10 +19,17 @@
 typedef int			__kernel_clock_t;
 typedef int			__kernel_daddr_t;
 /* Note these change from narrow to wide kernels */
+#ifdef __LP64__
 typedef unsigned long		__kernel_size_t;
 typedef long			__kernel_ssize_t;
 typedef long			__kernel_ptrdiff_t;
 typedef long			__kernel_time_t;
+#else
+typedef unsigned int		__kernel_size_t;
+typedef int			__kernel_ssize_t;
+typedef int			__kernel_ptrdiff_t;
+typedef int			__kernel_time_t;
+#endif
 typedef char *			__kernel_caddr_t;
 
 typedef unsigned short		__kernel_uid16_t;
