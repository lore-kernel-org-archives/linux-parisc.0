Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7821F4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Dec 2002 21:53:46 -0700 (MST)
Date: Mon, 2 Dec 2002 20:56:57 -0800
From: Randolph Chung <randolph@tausq.org>
To: Larry McVoy <lm@bitmover.com>
Cc: parisc-linux@lists.parisc-linux.org, phi@hpfrcu81.france.hp.com,
	dev@bitmover.com
Subject: Re: [parisc-linux] rlogin: connection closed (SOLUTION)
Message-ID: <20021203045657.GU21187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200212022154.gB2LsPc31908@work.bitmover.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212022154.gB2LsPc31908@work.bitmover.com>
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

In reference to a message from Larry McVoy, dated Dec 02:
> This fixes it.  Looks like a race, I wasn't inclined to dig further, this
> got me past the problem.  I suspect that parisc fork() runs parent/child
> in the opposite order from every other Unix and that causes a race but
> I have not looked.

Nah, this is not it. It's the problem with EAGAIN != EWOULDBLOCK on 
hppa-linux.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
