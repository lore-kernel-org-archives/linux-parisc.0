Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (ns1.au.network4.net [203.25.143.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1254482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Jun 2002 23:49:17 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id NAA02156
	for parisc-linux@lists.parisc-linux.org; Tue, 25 Jun 2002 13:49:20 +0800
Date: Tue, 25 Jun 2002 13:49:17 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] was: mail-man; should be hyper-mail
Message-ID: <20020625134914.A1722@neep.com.au>
References: <03273D4BC7F4D511AC440008C7E6F881542343@nlntmail2b.ats.nld.alcatel.nl> <20020620133405.T9435@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020620133405.T9435@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Jun 20, 2002 at 01:34:05PM +0100
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

Matthew Wilcox said:
> looks like out of date config.{sub,guess}.  as has been said elsewhere,
> the debian packages have been updated with these things, but maybe
> upstream hasn't.

Persons who feel the urge to build software locally rather than install
the lovely shiny Debian packages <plug /> would do well to at least
install the autotools-dev package.  Its purpose is to help developers
work around upstream sources that have out-of-date autoconf/libtool
helper files.

 autotools-dev: Update infrastructure for config.{guess,sub} files
 This package installs an up-to-date (from CVS) version of config.guess
 and config.sub, used by the automake and libtool packages.  It provides
 the canonical copy of those files for other packages as well.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
