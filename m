Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DB15482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 09:31:51 -0700 (MST)
Date: Wed, 18 Dec 2002 08:34:51 -0800
From: Randolph Chung <randolph@tausq.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 fix for user level page fault problems
Message-ID: <20021218163451.GB21551@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200212181620.gBIGKOJ02593@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212181620.gBIGKOJ02593@localhost.localdomain>
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

In reference to a message from James Bottomley, dated Dec 18:
> It seems that going from 2.4 to 2.5 there was an over zealous removal of the 
> check signals return path.  The problem is that if a user application takes a 
> page fault, that can result in a signal being posted (specifically SEGV for 
> illegal memory access).  If we never check the signals, the instruction is 
> retried and re-faults ad infinitum (well actually, it seems to terminate with 
> an unaligned instruction trap in this case after a few hundred faults).

thanks James. I've commited this to our 2.5 tree. We had fixed this in
2.4 a couple of weeks ago but I forgot to commit this to 2.5 too.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
