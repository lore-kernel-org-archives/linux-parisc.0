Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED3AC482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 06:27:04 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19aE2G-0000Y2-W1; Wed, 09 Jul 2003 13:27:00 +0100
Date: Wed, 9 Jul 2003 13:27:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: "Martin K. Petersen" <mkp@mkp.net>, Dub <dub@latnet.lv>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
Message-ID: <20030709122700.GR1939@parcelfarce.linux.theplanet.co.uk>
References: <yq1llv8dbin.fsf@wilson.mkp.net> <3F057186000008F4@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F057186000008F4@ocpmta8.freegates.net>
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

On Wed, Jul 09, 2003 at 10:29:08AM +0200, Joel Soete wrote:
> Yes read in <http://www.ibiblio.org/pub/Linux/docs/howto/other-formats/html_single/SCSI-2.4-HOWTO.html#mlproc>
> 
> that in Linux 2.4: "The SCSI subsystem does not support hot-plugging of SCSI
> devices ..."

True, it's pretty damn racy.  But if you're careful, it can work.
Let's hope we manage to make it better in 2.6 ... there's a pair of BOFs
in two weeks time at OLS (Hotplug & Linux SCSI) that should address this.

> Well I have no experience with hpux and those new 'hotplugable' devices but
> at least on Sun it doesn't mean that you can remove device(s) like this without
> taking care to power it off by software!!!

Well, no, you're always going to have to quiesce the device.  Otherwise it's
like turning the machine off without halting -- random things are cached and
simply never make it back to disc.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
