Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BC50482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 06:57:06 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel2.hp.com (Postfix) with ESMTP id 6CE53AFB
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 08:57:05 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id GAA23109
	for parisc-linux@lists.parisc-linux.org; Wed, 5 Sep 2001 06:57:04 -0600 (MDT)
Date: Wed, 5 Sep 2001 06:57:04 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200109051257.GAA23109@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: Kernel panics on 715/80
List-ID: <linux-parisc.vger.kernel.org>

> Sorry it took so long to do further debugging... Anyway the System.map
> says:
>
> 102ee3a0 ? parisc_hardware_description
> 1010ae98 T alloc_pa_dev
>

Oops. I found this bug last week, but forgot to commit a patch for it.
I just did that.

John
