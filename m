Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D8B948C6
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 13:23:25 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3h8d-0000mj-Aq; Sun, 28 Sep 2003 20:23:23 +0100
Date: Sun, 28 Sep 2003 20:23:23 +0100
From: Matthew Wilcox <willy@debian.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 willy
Message-ID: <20030928192323.GL24824@parcelfarce.linux.theplanet.co.uk>
References: <20030927072449.5AF0F494058@palinux.hppa> <20030928165631.GS5759@sleepie.demon.co.uk> <1064769945.10841.1.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1064769945.10841.1.camel@mulgrave>
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

On Sun, Sep 28, 2003 at 12:24:26PM -0500, James Bottomley wrote:
> Actually, the 720 is bust in silicon.  The 770 has a properly working
> intfly, but the 720's doesnt work reliably.  Actually, the Q720 board
> this driver also drives is wired to have a special "intfly" from a board
> register to get around the problem.

Mmm, OK.  Did you want me to put the SIMULATED_INTFLY conditionals
back in?  It wasn't much code; I've just been focused on ripping out
all the 8xx support, and I completely forgot about the 770.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
