Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0A6F482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 22:43:11 -0700 (MST)
Received: from carlos by systemhalted with local (Exim 3.36 #1 (Debian))
	id 18dl0V-0003KI-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 00:43:31 -0500
Date: Wed, 29 Jan 2003 00:43:31 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030129054331.GF9855@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] We need our own libgcc-compat for a leaked __clz_tab
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

PA,

Problem:

- GCC used to export a symbol for __clz_tab (GLOBAL DEFAULT)
- Everything in debian is being built with newer tools (GCC 3.2).
- Symbol is no longer leaked (LOCAL HIDDEN)
- Libraries that had the leadked symbol are rebuilt (e.g. libcrypto)
- Binaries that had relocations against the symbol are failing (e.g.
  wget)

Solution:

- Create a libgcc-compat in glibc for the symbol __clz_tab
	= Various arches have them for certain symbols that were leaked
	= from GCC when we the GNU tools didn't have ".hidden"
	= So examples exist...
- Test the solution to see that atleast "wget" works.
- Put it into Debians glibc as a dpatch.
- Submit upstream for fame and glory.

I'm writing a paper and doing research until Saturday.

If someone feels gutsy enough to attempt a fix, please have at it... 
If not, it's currently the highest priority item on my TODO.

Cheers,
Carlos.
