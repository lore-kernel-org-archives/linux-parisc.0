Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.bitmover.com (bitmover.com [192.132.92.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39BA54829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Dec 2002 22:03:16 -0700 (MST)
Date: Mon, 2 Dec 2002 21:00:59 -0800
From: Larry McVoy <lm@bitmover.com>
To: Randolph Chung <randolph@tausq.org>
Cc: Larry McVoy <lm@bitmover.com>,
	parisc-linux@lists.parisc-linux.org, phi@hpfrcu81.france.hp.com,
	dev@bitmover.com
Subject: Re: [parisc-linux] rlogin: connection closed (SOLUTION)
Message-ID: <20021202210059.C9691@work.bitmover.com>
References: <200212022154.gB2LsPc31908@work.bitmover.com> <20021203045657.GU21187@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021203045657.GU21187@tausq.org>; from randolph@tausq.org on Mon, Dec 02, 2002 at 08:56:57PM -0800
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

On Mon, Dec 02, 2002 at 08:56:57PM -0800, Randolph Chung wrote:
> In reference to a message from Larry McVoy, dated Dec 02:
> > This fixes it.  Looks like a race, I wasn't inclined to dig further, this
> > got me past the problem.  I suspect that parisc fork() runs parent/child
> > in the opposite order from every other Unix and that causes a race but
> > I have not looked.
> 
> Nah, this is not it. It's the problem with EAGAIN != EWOULDBLOCK on 
> hppa-linux.

OK, whatever.  I just though the rlogin people would want to know.
This seems to be a long standing and annoying bug.
-- 
---
Larry McVoy            	 lm at bitmover.com           http://www.bitmover.com/lm 
