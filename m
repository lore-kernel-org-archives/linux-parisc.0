Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1963E48CE
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 13:25:47 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8SJPiq25899;
	Sun, 28 Sep 2003 15:25:44 -0400
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 willy
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030928192323.GL24824@parcelfarce.linux.theplanet.co.uk>
References: <20030927072449.5AF0F494058@palinux.hppa>
	<20030928165631.GS5759@sleepie.demon.co.uk>
	<1064769945.10841.1.camel@mulgrave>
	<20030928192323.GL24824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 28 Sep 2003 14:25:43 -0500
Message-Id: <1064777144.10840.17.camel@mulgrave>
Mime-Version: 1.0
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

On Sun, 2003-09-28 at 14:23, Matthew Wilcox wrote:
> On Sun, Sep 28, 2003 at 12:24:26PM -0500, James Bottomley wrote:
> > Actually, the 720 is bust in silicon.  The 770 has a properly working
> > intfly, but the 720's doesnt work reliably.  Actually, the Q720 board
> > this driver also drives is wired to have a special "intfly" from a board
> > register to get around the problem.
> 
> Mmm, OK.  Did you want me to put the SIMULATED_INTFLY conditionals
> back in?  It wasn't much code; I've just been focused on ripping out
> all the 8xx support, and I completely forgot about the 770.

Perhaps.  The way I'd envisaged going forwards was to put the Q720 code
in there...it does a memory move which causes the card to trigger and
interrupt which can be used as an INTFLY.

Unfortunately, I lost all my Q770 cards in a lab move, so I've no means
of testing them.

James
