Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41037482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Sep 2002 20:46:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17n996-0003An-00; Fri, 06 Sep 2002 03:46:56 +0100
Date: Fri, 6 Sep 2002 03:46:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: palinux <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
Message-ID: <20020906034656.A26580@parcelfarce.linux.theplanet.co.uk>
References: <3D77D183.2080905@charter.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D77D183.2080905@charter.net>; from bdhilton@charter.net on Thu, Sep 05, 2002 at 05:49:55PM -0400
Subject: [parisc-linux] Re: C200 Voodoo2 Progress Report
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

On Thu, Sep 05, 2002 at 05:49:55PM -0400, B. Douglas Hilton wrote:
>   This is the Debian source for Glide3 on the Alpha arch,
>   which is also big-endian. Initial compilation failed in

nope.  alpha is little-endian.

LE: alpha, arm, cris, i386, ia64, superh
BE: m68k, mips, parisc, ppc, s390, sparc

(yes, i know many of these CPUs are bi-endian, but these are the default
configs)

-- 
Revolutions do not require corporate support.
