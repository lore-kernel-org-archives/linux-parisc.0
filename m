Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72DE74840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Jan 2004 12:56:24 -0700 (MST)
Date: Mon, 5 Jan 2004 14:48:09 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20040105194809.GA9269@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


pa'ers,

glibc 2.3.2.ds1-10

- Added profiling patches (Thanks Randolph!)
- Rebuilt glibc.
- Did not modify changelog or bump version.

Testers wanted please, in particular to test if building with -pg works
on your system and you get the expected results.

If testing goes well, these patches are going into debian-glibc's tree.

Cheers,
Carlos.
