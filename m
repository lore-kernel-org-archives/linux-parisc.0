Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rotapile (CPE-203-45-167-61.qld.bigpond.net.au [203.45.167.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id E81934833
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 18:49:00 -0600 (MDT)
Received: from rob by rotapile with local (Exim 3.22 #1 (Red Hat Linux))
	id 17BmDQ-0003jI-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 May 2002 10:48:56 +1000
From: Robert Stanford <rob@rotapile.com>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain
Date: 26 May 2002 10:48:56 +1000
Message-Id: <1022374136.14232.89.camel@rotapile>
Mime-Version: 1.0
Subject: [parisc-linux] 2.4.18 SMP instability
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

Regarding the below post, have the SMP issues been worked out on 2.4.18
yet? Im running 2.4.18-25 and the machine seems to lock whenever I try
to use apt with an smp kernel.

apt-get(3766): unaligned access to 0x403ce094 at ip=0x4005e47f     

Although I was doing some benchmarking and was able to make -j 3 vmlinux
using a 2.4.18-25 SMP kernel with no problems.


Robert Stanford


*cut*
--------------------------------------------------------------------
From: Matthew Wilcox (willy@debian.org)
Date: Thu Apr 11 2002 - 14:40:12 MDT

On Thu, Apr 11, 2002 at 03:16:25PM -0400, D'Ausilio, John wrote:
> Is the 2.4.18 which comes down from the archive as recent as the ones
in the
> FTP server? I'm going to boot back into the original kernel and try
getting
> the latest from the FTP server .. if that dosn't work I guess I'll get
the
> sources and build from CVS. Any other hints/clues/suggestions? Should
I just
> run single proc for now?

Yes, we've also found 2.4.18 to be unstable SMP. I believe Grant has a
handle on this problem now, so expect it to be fixed quite soon.
-------------------------------------------------------------------------
