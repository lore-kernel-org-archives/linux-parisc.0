Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FAEA485B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 May 2002 15:21:28 -0600 (MDT)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.6/8.11.0) id g43LLVI24083
	for parisc-linux@lists.parisc-linux.org; Fri, 3 May 2002 17:21:31 -0400
Date: Fri, 3 May 2002 17:21:31 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020503172131.A24017@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kdb patches for -pa23 ... moooo!
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

parisc,

kdb-parisc patches for -pa23 can be found at:

http://www.baldric.uwo.ca/~carlos/kdb-parisc/

No feature enhancements or bug fixes, just a 'it works with -pa23' changes.
There were only a few changes to be made to /arch/parisc/kernel/traps.c.
I put together the changes based on the -pa11 kdb patches. 

c.
