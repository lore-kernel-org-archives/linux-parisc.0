Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from simba.sch.bme.hu (simba.sch.bme.hu [152.66.215.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1012E4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 01:37:16 -0600 (MDT)
Date: Thu, 19 Sep 2002 09:38:31 +0200 (MET DST)
From: Istvan Gyenes <frts@simba.sch.bme.hu>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.OSF.4.33.0209190926170.32375-100000@simba.sch.bme.hu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] SMP kernel problems on a D350
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

Hello List,

I'm trying to compile an SMP kernel for my D 350 (2cpu) server without
success.
The kernel source is 2.4.19-pa18 and in non-smp configuration it works
well. Anyway the SMP kernel compiles fine but when I try to boot it
stops at the "If this is the last message you see, you may need to switch
your console" line. I've switched the console but got no other output.
(It was the same with 2.4.19-pa14)
The system was installed from a debian 3.0 CD.
Can somebody send me a working .config? Or what can be the problem?

Thanks in advance,

__
Steve
