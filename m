Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA841486F
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 29 Mar 2004 09:17:26 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i2TGHPa04887; Mon, 29 Mar 2004 11:17:25 -0500
Subject: Re: [parisc-linux] init_idle and local_irq_save
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20040329160357.GA31448@colo.lackof.org>
References: <20040329160357.GA31448@colo.lackof.org>
Content-Type: text/plain
Date: 29 Mar 2004 11:17:19 -0500
Message-Id: <1080577040.1804.9.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 2004-03-29 at 11:03, Grant Grundler wrote:
> o local_irq_save()/local_irq_restore are called without an
>   obvious local_irq_disable() call in between. Is this really
>   needed for some other reason or is the local_irq_disable() missing?

local_irq_save() does do an irq disable.  You're thinking of
local_save_flags() which only saves the flags but doesn't disable
interrupts.

> o double_rq_lock() acquires the locks with lowest address first.
>   double_rq_unlock() does not release those in the inverse order.
>   Is that a problem?
>   I'm just nervous since I didn't see the local_irq_disable()
>   in init_idle() which would guarantee both unlock's happen atomically.

No.  The deadlock potential comes only from lock acquisition order, not
lock release order:  nothing can block a lock release from proceeding.

James
