Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2B9C4829
	for <parisc-linux@parisc-linux.org>; Thu, 26 Jun 2003 11:06:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19VaCa-0000iA-V5; Thu, 26 Jun 2003 18:06:28 +0100
Date: Thu, 26 Jun 2003 18:06:28 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030626170628.GO451@parcelfarce.linux.theplanet.co.uk>
References: <20030626135451.GL451@parcelfarce.linux.theplanet.co.uk> <3ED70CF10000A63F@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED70CF10000A63F@ocpmta2.freegates.net>
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

On Thu, Jun 26, 2003 at 07:03:40PM +0200, Joel Soete wrote:
> Hi Willy,
> 
> >
> > 2.4.21 allocates sysctl number 56 to something else, so i had to renumber
> > the hppa sysctls to 57 and 58.
> >
> Sorry for my ignorance but how much those number are important (as afaik
> they are named by #define)?

they're irrelevant if you use them via /proc/sys to access the feature.
they're really important if you use them via sysctl(3).

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
