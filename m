Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (i003-034.nv.iinet.net.au [203.59.3.34])
	by dsl2.external.hp.com (Postfix) with SMTP id 56FA0482D
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 23:25:48 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id NAA21965
	for parisc-linux@lists.parisc-linux.org; Fri, 3 Aug 2001 13:25:36 +0800
Date: Fri, 3 Aug 2001 13:25:33 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] dev-packages
Message-ID: <20010803132528.G9637@neep.com.au>
References: <20010802221905.C20250@parcelfarce.linux.theplanet.co.uk> <Pine.BSF.4.30.0108030645560.38503-100000@noc.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.30.0108030645560.38503-100000@noc.zabbadoz.net>; from bzeeb+hplinux@zabbadoz.net on Fri, Aug 03, 2001 at 06:56:08AM +0200
List-ID: <linux-parisc.vger.kernel.org>

Quoth Bjoern A. Zeeb:
> On Thu, 2 Aug 2001, Matthew Wilcox wrote:
> > They're all available in the debian archive.  I don't think we have
> > plans to produce any more CDs until the Debian Woody release (probably
> > December).
> 
> Could you point me to some URL (incl. subdir) please ?

If you've got apt configured (/etc/apt/apt.conf, /etc/apt/sources.list)
then you don't need to worry about finding things directly.  After doing
an 'apt-get update' to fetch the current Packages files and rebuild the
local package database, you can say 'apt-cache search foo' and it will
show you all the packages called foo or with foo in their description.
A simple 'apt-get install foo-dev' will download and install the foo-dev
package and any other package it may require according to its
dependencies.

For more info & discussion on actual Debian issues rather than the
actual development of the hppa-linux kernel and toolchain have a look at
the debian-hppa mailing list (on the Debian website).

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
