Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3415F4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  3 Feb 2004 16:09:09 -0700 (MST)
Received: from systemhalted ([24.43.33.92])
	by fep04-mail.bloor.is.net.cable.rogers.com
	(InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP id
	<20040203230411.GOM435777.fep04-mail.bloor.is.net.cable.rogers.com@systemhalted>
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 3 Feb 2004 18:04:11 -0500
Date: Tue, 3 Feb 2004 18:07:35 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040203230735.GC13520@baldric.uwo.ca>
References: <20040203230410.71952494194@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040203230410.71952494194@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Feb 03, 2004 at 04:04:10PM -0700, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/02/03 16:04:10
> 
> Modified files:
> 	include/linux  : compat.h 
> 
> Log message:
> Personality is a bitmask, so we use personality() to extract just the base personality before checking for PER_LINUX32 e.g. A compat task
> 

This booboo would have bitten eventually.

c.

Index: include/linux/compat.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/compat.h,v
retrieving revision 1.7
retrieving revision 1.8
diff -u -p -r1.7 -r1.8
--- include/linux/compat.h      28 Jan 2004 05:12:46 -0000      1.7
+++ include/linux/compat.h      3 Feb 2004 23:04:09 -0000       1.8
@@ -23,7 +23,7 @@
 
 /* Non-native task requiring compat */
 #ifndef HAVE_ARCH_IS_COMPAT_TASK
-#define is_compat_task(x) (x->personality == PER_LINUX32)
+#define is_compat_task(x) (personality(x->personality) == PER_LINUX32)
 #endif
 
 struct compat_itimerspec { 
