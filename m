Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63E1A4872
	for <parisc-linux@parisc-linux.org>; Mon, 24 Feb 2003 10:50:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18nMk1-0006cQ-00; Mon, 24 Feb 2003 17:50:13 +0000
Date: Mon, 24 Feb 2003 17:50:13 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
Message-ID: <20030224175013.L2938@parcelfarce.linux.theplanet.co.uk>
References: <3E5A21B500000145@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E5A21B500000145@ocpmta3.freegates.net>; from jsoe0708@tiscali.be on Mon, Feb 24, 2003 at 06:42:39PM +0100
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

On Mon, Feb 24, 2003 at 06:42:39PM +0100, Joel Soete wrote:
> sched.c:93: initializer element is not constant
> sched.c:93: (near initialization for `tasklist_lock')
> sched.c:93: initializer element is not constant
[...]
> which is precompile as:
> rwlock_t tasklist_lock __attribute__((__aligned__(64))) = (rwlock_t) { (spinlock_t)
> {1}, 0 };
> 
> What's wrong?

looks like gcc broke this again.  for the moment, you can try taking
out the casts.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
