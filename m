Return-Path: <carlos@baldric.uwo.ca>
Received: from fep01-mail.bloor.is.net.cable.rogers.com
	(fep01-mail.bloor.is.net.cable.rogers.com [66.185.86.71])
	by dsl2.external.hp.com (Postfix) with ESMTP id 962FD4843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 22:25:16 -0700 (MST)
Received: from systemhalted ([24.43.33.92])
	by fep01-mail.bloor.is.net.cable.rogers.com
	(InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP id
	<20040128052224.IGR484300.fep01-mail.bloor.is.net.cable.rogers.com@systemhalted>
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Jan 2004 00:22:24 -0500
Date: Wed, 28 Jan 2004 00:25:31 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040128052530.GI12191@baldric.uwo.ca>
References: <20040128051415.4C9724941AA@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040128051415.4C9724941AA@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 10:14:15PM -0700, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/01/27 22:14:15
> 
> Modified files:
> 	include/asm-parisc: posix_types.h 
> 
> Log message:
> __kernel_time_t should be of type long on 32-bit systems, it used to be int
> 

The generic code expects this to be of type long on all builds, even
32-bit. This might cause other warnings in parisc drivers that have
gotten used to having time_t as int.

Index: include/asm-parisc/posix_types.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/asm-parisc/posix_types.h,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -p -r1.2 -r1.3
--- include/asm-parisc/posix_types.h	28 Sep 2003 04:06:17 -0000	1.2
+++ include/asm-parisc/posix_types.h	28 Jan 2004 05:14:14 -0000	1.3
@@ -29,7 +29,7 @@ typedef long			__kernel_time_t;
 typedef unsigned int		__kernel_size_t;
 typedef int			__kernel_ssize_t;
 typedef int			__kernel_ptrdiff_t;
-typedef int			__kernel_time_t;
+typedef long			__kernel_time_t;
 #endif
 typedef char *			__kernel_caddr_t;
 
