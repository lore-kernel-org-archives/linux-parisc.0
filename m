Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3ABB482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 12:21:09 -0600 (MDT)
Date: Fri, 21 Sep 2001 12:21:07 -0600
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Additional Address cleanup
Message-ID: <20010921122107.A2168@beavis.ybsoft.com>
References: <20010921104838.A2049@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010921104838.A2049@beavis.ybsoft.com>
From: rbradetich@uswest.net (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc-linux hackers,

Rereading the patch, I spotted a bug in the kmalloc *sigh*.

> +	dev->addr = kmalloc(sizeof(unsigned long), num_addrs);

The kmalloc should look like this (I think).
	dev->addr = kmalloc(num_addrs * sizeof(unsigned long), GFP_KERNEL);

- Ryan
