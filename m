Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39DC04837
	for <parisc-linux@parisc-linux.org>; Thu, 17 Jul 2003 03:52:58 -0600 (MDT)
Date: Thu, 17 Jul 2003 11:52:50 +0200
Message-ID: <3F0BEA8300001F1D@ocpmta1.freegates.net>
In-Reply-To: <20030716173621.GM23808@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] fix arbitrary limits on stack size
To: "Matthew Wilcox" <willy@debian.org>
Cc: "James Bottomley" <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

> um, the stack continues to grow up.  it's just a question of where the
> stack starts at.  before, it was at top of memory - stack limit, now it's
> at task_unmapped_base and mmaps grow down from the top of memory.

Ok I missunderstood.

This said, I applied against 2.6.0-test1-pa1. It compiled well and also boot
well on my b180 of test (still have a pb with b2k and N; another story).

I also try to re-compile kernel 2.6 reboot with this last one: all seems
ok.

hth,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
