Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1CC14843
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 11 Jan 2004 06:36:03 -0700 (MST)
Date: Sun, 11 Jan 2004 06:25:54 -0800
From: Randolph Chung <tausq@debian.org>
To: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] running gcc testsuite triggers ongoing page faults
Message-ID: <20040111142547.GG533@tausq.org>
References: <16385.5227.153358.397944@gargle.gargle.HOWL>
	<20040111100853.GF533@tausq.org>
	<16385.13815.94626.165424@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <16385.13815.94626.165424@gargle.gargle.HOWL>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Reply-To: Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> well, the last testcase logged in build/gcc/testsuite/gcc.log is 
> 
> 	gcc.c-torture/execute/931004-12.c compilation,  -O1
> 
> the next one would be
> 
> 	gcc.c-torture/execute/931004-12.c compilation,  -O2

does it always die at the same test case?

randolph
