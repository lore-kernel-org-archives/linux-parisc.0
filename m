Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23F664A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 07:42:54 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 91A82B005; Thu, 22 Feb 2001 14:43:31 +0000 (GMT)
Date: Thu, 22 Feb 2001 14:43:31 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Matthew Wilcox <matthew@wil.cx>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: schedule_tail
Message-ID: <20010222144331.G1129@linuxcare.com>
References: <Pine.LNX.4.21.0102222150310.14557-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0102230114130.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102230114130.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Fri, Feb 23, 2001 at 01:28:36AM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 23, 2001 at 01:28:36AM +1100, Alan Modra wrote:
> This is really crazy (or I am).  I replaced the calls to schedule_tail

This helps for me.  b,l disassembles as call, not b,l ...,rp:

===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.72
diff -u -r1.72 entry.S
--- entry.S     2001/02/20 02:19:52     1.72
+++ entry.S     2001/02/22 14:33:43
@@ -509,7 +509,7 @@
 
        /* Call schedule_tail first though */
 
-       b,l     schedule_tail, %r2
+       bl      schedule_tail, %r2
        ldo     64(%r30), %r30
 
        ldo     -64(%r30), %r30
@@ -1790,7 +1790,7 @@
 
        /* Set the return value for the child */
 child_return:
-       b,l     schedule_tail, %r2
+       bl      schedule_tail, %r2
        ldo     64(%r30), %r30
 
        ldo     -64(%r30), %r30


Richard
