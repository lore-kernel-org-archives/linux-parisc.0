Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B6684829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Mar 2003 23:51:14 -0700 (MST)
Date: Fri, 07 Mar 2003 22:29:45 -0800 (PST)
Message-Id: <20030307.222945.32673395.davem@redhat.com>
To: grundler@dsl2.external.hp.com
Cc: jsm@udlkern.fc.hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030308063043.GB27859@dsl2.external.hp.com>
References: <200303061414.HAA26321@udlkern.fc.hp.com>
	<20030308063043.GB27859@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

   From: grundler@dsl2.external.hp.com (Grant Grundler)
   Date: Fri, 7 Mar 2003 23:30:43 -0700
   
   I don't pretend to understand the issues with virtual tags and
   linux VM design, I just want to encourage the discussion since
   I'd really like to see SMP work right on parisc.

If you flush caches exactly what sparc64 does in 2.5.x, and you do
have a virtually indexed, physically tagged cache, you should have no
correctness.  I've stressed that port to no end (in particular the LTP
suite has a great mmap/read/write coherency tester), and if there are
holes I'd like to know about them :-)

The sparc64 port only flushes when absolutely necessary.

The most crucial area to get efficient flushing is the
{copy,clear}_user_page implementation.  If you use temporary kernel
mappings mapped at virtual addresses matching the virtual color that
the user's mappings will have, this avoids virtually ALL of the
flushing for anonymous pages.  I haven't noticed too many ports pick
up this trick even though I mention it in cachetlb.txt.

On sparc64 I even save the original TLB entries before the flush
and restore them afterwards, so there is no TLB traffic as a result
of doing these temp mappings.
