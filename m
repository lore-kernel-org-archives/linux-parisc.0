Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFE414829
	for <parisc-linux@parisc-linux.org>; Wed, 15 Jan 2003 06:16:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18YnPX-0006jn-00
	for parisc-linux@parisc-linux.org; Wed, 15 Jan 2003 13:16:51 +0000
Date: Wed, 15 Jan 2003 13:16:51 +0000
From: Matthew Wilcox <willy@debian.org>
To: Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] CVS checkouts on ftp server
Message-ID: <20030115131651.F26554@parcelfarce.linux.theplanet.co.uk>
References: <20030115122121.C799@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030115122121.C799@neep.com.au>; from andrew@neep.com.au on Wed, Jan 15, 2003 at 12:21:23PM +0800
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

On Wed, Jan 15, 2003 at 12:21:23PM +0800, Andrew Shugg wrote:
> I was trawling through ftp.parisc-linux.org/cvs looking for a tarball of
> the linux-2.5 tree and couldn't see anything, apart from a /cvs/2.5
> directory (which is currently empty).

Those aren't currently being generated (AFAIK).  What _is_ being generated
are the patches against upstream: http://ftp.parisc-linux.org/2.5/kernel-src/

> Is there enough disk space to do a linux-2.5 tarball for the FTP server?

Yes, certainly.  Do you still want that, given the existance of these
patches?

> Also the /cvs directory contains a few files that look like stuff-ups
> from the CVS tarball roller: linux-.tar.gz and patch-.diff.gz ...

I can see them... but I can also see the CVS scripts are still running.
Possibly they'll be renamed later.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
