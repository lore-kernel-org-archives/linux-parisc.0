Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BB80482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 11:17:36 -0600 (MDT)
Date: Fri, 13 Sep 2002 10:21:25 -0700
From: Randolph Chung <randolph@tausq.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] misaligned handler failing...
Message-ID: <20020913172125.GX17893@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020913170351.1D5414829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020913170351.1D5414829@dsl2.external.hp.com>
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

> xlock(16254): unaligned access to 0x4071402c at ip=0x400ea63f
> Not-handled unaligned insn 0x2fe81205
> Unaligned handler failed, ret = -1
> xlock (pid 16254): Unaligned data reference (code 28)

that insn is fstd fr5,4(sr0,r31) ... and indeed the unaligned handler
doesn't do anything with the floating point instructions.

we probably should try to hunt down the broken code in xlock (or the lib
that contains the insn) and fix it...

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
