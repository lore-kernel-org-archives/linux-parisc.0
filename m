Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33A12482E
	for <parisc-linux@parisc-linux.org>; Mon, 10 Mar 2003 12:56:11 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18sTNa-0005WI-00; Mon, 10 Mar 2003 19:56:10 +0000
Date: Mon, 10 Mar 2003 19:56:10 +0000
From: Matthew Wilcox <willy@debian.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Matthew Wilcox <willy@debian.org>, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
Message-ID: <20030310195610.GJ5278@parcelfarce.linux.theplanet.co.uk>
References: <20030310172832.GG5278@parcelfarce.linux.theplanet.co.uk> <20030310185647.GA11310@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030310185647.GA11310@atrey.karlin.mff.cuni.cz>
Subject: [parisc-linux] Re: ioctl32 cleanup -- rest of architectures
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

On Mon, Mar 10, 2003 at 07:56:47PM +0100, Pavel Machek wrote:
> So I should take arch/parisc/kernel/syscall.S and change
> ENTRY_DIFF(ioctl) into ENTRY_COMP(ioctl)? Great, thanx.

Exactly.

> [BTW have you actually tested it or are these just first obvious
> mistakes?]

I haven't tested it... no convenient 64-bit box at present.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
