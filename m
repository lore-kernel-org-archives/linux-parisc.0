Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id D286D486F
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 29 Mar 2004 09:03:58 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 3A1C029803E
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 29 Mar 2004 09:03:58 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 31925-03 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 29 Mar 2004 09:03:57 -0700 (MST)
Date: Mon, 29 Mar 2004 09:03:57 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040329160357.GA31448@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] init_idle and local_irq_save
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,
I'm trying to get 2.6 SMP working on a UP box and was walking
through the init sequence. I have two questions related to init_idle()
in kernel/sched.c:

o local_irq_save()/local_irq_restore are called without an
  obvious local_irq_disable() call in between. Is this really
  needed for some other reason or is the local_irq_disable() missing?

o double_rq_lock() acquires the locks with lowest address first.
  double_rq_unlock() does not release those in the inverse order.
  Is that a problem?
  I'm just nervous since I didn't see the local_irq_disable()
  in init_idle() which would guarantee both unlock's happen atomically.

thanks,
grant
