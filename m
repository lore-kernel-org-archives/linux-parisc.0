Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from winfree.gag.com (winfree.gag.com [192.133.104.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BC054829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 14:38:23 -0600 (MDT)
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by winfree.gag.com (Postfix) with ESMTP id 8D06BC055
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 14:38:20 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350
References: <20020920194820.GC24622@systemhalted>
	<Pine.LNX.4.44.0209201301220.20374-100000@garibaldi.apptechsys.com>
From: Bdale Garbee <bdale@gag.com>
Date: 20 Sep 2002 14:37:40 -0600
In-Reply-To: <Pine.LNX.4.44.0209201301220.20374-100000@garibaldi.apptechsys.com>
Message-ID: <87hegkv1m3.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

jeremyd@apptechsys.com (Jeremy Drake) writes:

> For me, the last kernel that didn't crash on my J5000 in smp mode while
> doing apt-get update was kernel-image-2.4.17-32-smp_23.1_hppa.deb

I've had good luck with the 2.4.19 kernel images I've uploaded to unstable,
which are built and running on my J5000 in 64-bit SMP mode.  I don't promise
they're "stable", but the apt-get update problem is gone.

Bdale
