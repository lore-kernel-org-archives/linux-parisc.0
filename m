Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98F404829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 10:08:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18X2dh-0007fk-00; Fri, 10 Jan 2003 17:08:13 +0000
Date: Fri, 10 Jan 2003 17:08:13 +0000
From: Matthew Wilcox <willy@debian.org>
To: jsoe0708@tiscali.be
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-ID: <20030110170813.X26554@parcelfarce.linux.theplanet.co.uk>
References: <20030110073659.GC31470@tausq.org> <3E1AA8D500000902@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E1AA8D500000902@ocpmta8.freegates.net>; from jsoe0708@tiscali.be on Fri, Jan 10, 2003 at 11:51:41AM +0100
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

On Fri, Jan 10, 2003 at 11:51:41AM +0100, jsoe0708@tiscali.be wrote:
> PS:  with ext3 (which I use) problem I hesitate to install 2.4.20 and waiting
> for 2.4.21 and evms, jfs, xfs support for this system)

um, you use the data=ordered mount option (or whatever it was)?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
