Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D20714829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  3 Nov 2002 16:18:53 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 188U13-0001yy-00; Sun, 03 Nov 2002 23:18:49 +0000
Date: Sun, 3 Nov 2002 23:18:49 +0000
From: Matthew Wilcox <willy@debian.org>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org, willy@debian.org
Subject: Re: [parisc-linux] Placement of hil drivers
Message-ID: <20021103231849.D20749@parcelfarce.linux.theplanet.co.uk>
References: <20021102155723.I20749@parcelfarce.linux.theplanet.co.uk> <20021103223132.7d57ffff.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021103223132.7d57ffff.varenet@esiee.fr>; from varenet@esiee.fr on Sun, Nov 03, 2002 at 10:31:32PM +0100
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

On Sun, Nov 03, 2002 at 10:31:32PM +0100, Thibaut VARENE wrote:
> That's not true, I've worked hard enough on 2.5 config system, and
> especially on HIL, to deny such statement ;^)

OK, it's nowhere to be found in 2.5.45 ;-)  I guess this change got lost
during the Kconfig transition.

> AFAICR, I already have said when we merged 2.4 config files into 2.5 that
> HIL driver files and config may need review.
> 
> It looks like time has come for such review.

Certainly, that was what i was starting to do when i noticed nothing was
including the Kconfig stuff in drivers/hil ... and that no Makefile was
linking drivers/hil.  So it's not _just_ the Kconfig changes that broke
this.

> I would like to hear from Helge Deller too.

Yep, and Brian Julin... at least to hear that they don't care where
these drivers are put.

-- 
Revolutions do not require corporate support.
