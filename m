Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 11E8A482D
	for <parisc-linux@parisc-linux.org>; Mon, 14 Jul 2003 05:58:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19c1yR-0007Py-5g; Mon, 14 Jul 2003 12:58:31 +0100
Date: Mon, 14 Jul 2003 12:58:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] fix arbitrary limits on stack size
Message-ID: <20030714115831.GE23808@parcelfarce.linux.theplanet.co.uk>
References: <1058030142.2314.23.camel@fuzzy> <3F0BEA8300001164@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F0BEA8300001164@ocpmta1.freegates.net>
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

On Mon, Jul 14, 2003 at 12:48:56PM +0200, Joel Soete wrote:
> I don' t remember the historical reason of this choice but do you think it
> is possible to back-port it into 2.4 (it will facilitate so much the merge
> with upstream?)

2.6.0-test1 is out.  IMO, all work on 2.4 should cease.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
