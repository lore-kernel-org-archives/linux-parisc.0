Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 80A5D482D
	for <parisc-linux@parisc-linux.org>; Wed, 16 Jul 2003 11:36:23 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19cqCT-0005mf-SC; Wed, 16 Jul 2003 18:36:21 +0100
Date: Wed, 16 Jul 2003 18:36:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] fix arbitrary limits on stack size
Message-ID: <20030716173621.GM23808@parcelfarce.linux.theplanet.co.uk>
References: <1058212036.2966.13.camel@mulgrave> <3F0C24F800000FDD@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F0C24F800000FDD@ocpmta8.freegates.net>
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

On Wed, Jul 16, 2003 at 07:30:29PM +0200, Joel Soete wrote:
> Ok Jame, Now I have a 32bits 2.6.0-test1-pa1 running so I come back to you.
> 
> No problem to apply it :) , so I can launch the compile.
> 
> Just a question in the mean time: it doesn't seens that your patch take care
> of CONFIG_STACK_GROWSUP in related files?

um, the stack continues to grow up.  it's just a question of where the
stack starts at.  before, it was at top of memory - stack limit, now it's
at task_unmapped_base and mmaps grow down from the top of memory.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
