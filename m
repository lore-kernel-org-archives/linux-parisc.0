Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id B19AA482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 07:03:01 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h5JD2vI14147;
	Thu, 19 Jun 2003 09:02:57 -0400
Subject: Re: [parisc-linux] Some 2.5-testing
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: =?ISO-8859-1?Q?R=FCdiger?= Scholz <r.scholz@bluehash.de>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030619114009.GA24357@parcelfarce.linux.theplanet.co.uk>
References: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca>
	<3EF1353C.8030705@bluehash.de>
	<20030619114009.GA24357@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 19 Jun 2003 08:02:56 -0500
Message-Id: <1056027778.2014.1.camel@mulgrave>
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

On Thu, 2003-06-19 at 06:40, Matthew Wilcox wrote:
> So... what's going on here is that someone's enabling softirqs with hard
> interrupts disabled.  This is not a smart thing to do.  Unfortunately,
> something is messing up the stack backtrace, so it's hard tosee what's
> going on.  Could you turn on CONFIG_KALLSYMS so the kernel prints out
> its symbols?  The messages may still be corrupt, but we should have more
> information to help us figure out what's going on.

This was a known problem in the HIL keyboard/mouse drivers around
2.5.70.  I think Helge already submitted a fix for this, could you try a
later version of the parisc kernel?

Thanks,

James
