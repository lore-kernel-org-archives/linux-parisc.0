Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37DDC4868
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 09:58:46 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19aHLA-00051t-Ro; Wed, 09 Jul 2003 16:58:44 +0100
Date: Wed, 9 Jul 2003 16:58:44 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Joel Soete <jsoe0708@tiscali.be>, "Martin K. Petersen" <mkp@mkp.net>,
	Dub <dub@latnet.lv>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
Message-ID: <20030709155844.GU1939@parcelfarce.linux.theplanet.co.uk>
References: <yq1llv8dbin.fsf@wilson.mkp.net> <3F057186000008F4@ocpmta8.freegates.net> <20030709122700.GR1939@parcelfarce.linux.theplanet.co.uk> <20030709155451.GB32476@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030709155451.GB32476@dsl2.external.hp.com>
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

On Wed, Jul 09, 2003 at 09:54:51AM -0600, Grant Grundler wrote:
> On Wed, Jul 09, 2003 at 01:27:00PM +0100, Matthew Wilcox wrote:
> > Well, no, you're always going to have to quiesce the device.
> 
> Not unless the disk is part of RAID[135] set.
> I expect to be able to yank a disk and replace with a new one any time.

Indeed.  You are coming to those two BOFs, right?  ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
