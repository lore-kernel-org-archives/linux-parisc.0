Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout04.sul.t-online.com (mailout04.sul.t-online.com [194.25.134.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC352482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 11:14:01 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: H_Aue@t-online.de (Hinrich Aue)
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Date: Tue, 8 Jan 2002 19:17:45 +0100
MIME-Version: 1.0
Message-ID: <16O0kw-0Ci6ASC@fwd05.sul.t-online.com>
Subject: [parisc-linux] RAID - speed measure
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

It's of course not mem speed measure as mentioned before in the forum :-)
It's RAID - spped measure. stupid fault.

raid5: measuring checksumming speed
   8regs     : 77961.200 MB/sec
   8regs_prefetch:    56.400 MB/sec
   32regs    :    94.800 MB/sec
   32regs_prefetch:    95.200 MB/sec
raid5: using function: 8regs (77961.200 MB/sec)

But anyway, it's strange. Perhaps only a missing division /1000.
