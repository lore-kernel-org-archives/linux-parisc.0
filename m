Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4FF424829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jun 2003 08:32:37 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19Nvn9-000253-Lk; Thu, 05 Jun 2003 15:32:35 +0100
Date: Thu, 5 Jun 2003 15:32:35 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
Message-ID: <20030605143235.GM28581@parcelfarce.linux.theplanet.co.uk>
References: <3ED4C8B600002734@ocpmta1.freegates.net> <Pine.BSF.4.53.0306051406370.27036@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.53.0306051406370.27036@e0-0.zab2.int.zabbadoz.net>
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

On Thu, Jun 05, 2003 at 02:14:33PM +0000, Bjoern A. Zeeb wrote:
> I think I am missing a package for all this here where most of the
> dh_* are included ...
> 
> Me using apt-get source then debian/rules build and finally I cannot
> use fakeroot at the moment (glibc issue though downgraded).

use dpkg-buildpackage -rsudo
that'll tell you which deps are missing

or you can apt-get build-dep palo to install palo's build deps.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
