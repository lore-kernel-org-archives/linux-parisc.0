Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33E944829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 21 Oct 2002 10:39:22 -0600 (MDT)
Date: Mon, 21 Oct 2002 09:42:54 -0700
From: Randolph Chung <randolph@tausq.org>
To: jsoe0708@tiscali.be
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	Joel Soete <joel.soete@freebel.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] jfs-1.0.23 as well xfs-cvs break fb console on k-2.4.19-pa22
Message-ID: <20021021164254.GW5602@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021020034403.AF4F14829@dsl2.external.hp.com> <3DA56CAE00003DB5@ocpmta8.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DA56CAE00003DB5@ocpmta8.be.tiscali.com>
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

> it sounds like a gcc bug:
> 
> simply adding "printk("VC: %s: %d\n", __FUNCTION__, __LINE__);" some where
> in the middle of take_over_console (to check the way) and the problem is
> solved???

unlikely a gcc bug, more likely is that the code has some timing
dependencies and adding printk changed the timing.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
