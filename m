Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D2D84848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 08:12:42 -0600 (MDT)
Received: from redsea.india.hp.com (redsea.india.hp.com [15.76.97.3])
	by atlrel6.hp.com (Postfix) with ESMTP id C2BA41C01B15
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 10:12:40 -0400 (EDT)
Received: from india.hp.com (eb9856.india.hp.com [15.76.98.56])
	by redsea.india.hp.com (8.9.3 (PHNE_28761)/8.9.3 SMKit7.02) with ESMTP id TAA14928
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 19:49:53 +0530 (IST)
Message-ID: <3F3B98D6.84D2464F@india.hp.com>
Date: Thu, 14 Aug 2003 19:42:38 +0530
From: Naresh <knaresh@india.hp.com>
Reply-To: knaresh@india.hp.com
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Discontig memory.
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

Hi,
What exactly are the implications of turning on CONFIG_DISCONTIGMEM?
Does this lead to serious system degradation? I do see a message being
printed on the console during bootup, stating that heavy swapping could
take place, and it is a mistake to turn on this option. I also see a
comment in the code saying that this option is not implemented well. How
seriously will it affect a system thats not running too many processes?
Regards,
Naresh.
