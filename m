Return-Path: <carlos@baldric.uwo.ca>
Received: from fep04-mail.bloor.is.net.cable.rogers.com
	(fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C2EB4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  3 Feb 2004 14:53:00 -0700 (MST)
Received: from systemhalted ([24.43.33.92])
	by fep04-mail.bloor.is.net.cable.rogers.com
	(InterMail vM.5.01.05.12 201-253-122-126-112-20020820) with ESMTP id
	<20040203214954.ZGFF435777.fep04-mail.bloor.is.net.cable.rogers.com@systemhalted>
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 3 Feb 2004 16:49:54 -0500
Date: Tue, 3 Feb 2004 16:53:18 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040203215318.GB13520@baldric.uwo.ca>
References: <20040203215113.E38D0494194@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040203215113.E38D0494194@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Feb 03, 2004 at 02:51:13PM -0700, Carlos O'Donell wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	carlos	04/02/03 14:51:13
> 
> Modified files:
> 	include/linux  : compat_siginfo.h 
> 
> Log message:
> Change compat_copy_siginfo_to_user to take the true argument values of the function.
> 
> _______________________________________________
> parisc-linux-cvs mailing list
> parisc-linux-cvs@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux-cvs

This matches what I've sent upstream to akpm.

Index: include/linux/compat_siginfo.h
===================================================================
RCS file: /var/cvs/linux-2.6/include/linux/compat_siginfo.h,v
retrieving revision 1.2
diff -u -p -r1.2 compat_siginfo.h
--- include/linux/compat_siginfo.h      28 Jan 2004 05:12:46 -0000      1.2
+++ include/linux/compat_siginfo.h      3 Feb 2004 21:50:30 -0000
@@ -11,7 +11,8 @@
 typedef struct compat_siginfo{
 } compat_siginfo_t;
 
-static inline int compat_copy_siginfo_to_user(void *x, unsigned long y)
+static inline int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, 
+                                               struct siginfo *from)
 {
        return -1;
 }
