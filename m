Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D071483E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Sep 2003 14:06:04 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3LKM-0007Bb-SI; Sat, 27 Sep 2003 21:06:02 +0100
Date: Sat, 27 Sep 2003 21:06:02 +0100
From: Matthew Wilcox <willy@debian.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Ryan Bradetich <rbradetich@uswest.net>,
	SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Message-ID: <20030927200602.GU24824@parcelfarce.linux.theplanet.co.uk>
References: <1064634188.641.27.camel@laptop.bradetich.net> <1064677551.2002.20.camel@mulgrave> <20030927183756.GT24824@parcelfarce.linux.theplanet.co.uk> <1064689088.2002.188.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1064689088.2002.188.camel@mulgrave>
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
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

On Sat, Sep 27, 2003 at 01:58:06PM -0500, James Bottomley wrote:
> No, I fixed that...that was changed to goto out; in my patch, and out
> was just before the return (i.e. no longer do the release).

Oops, I didn't scroll all the way down.  Anyway, we have a tradition
of allowing, eg, kfree(NULL) to succeed, so it's a little more robust.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
