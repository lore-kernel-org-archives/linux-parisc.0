Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (p035.sw02.auto.usertools.net [202.154.81.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0EA74829
	for <parisc-linux@parisc-linux.org>; Fri, 17 Jan 2003 02:35:53 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id SAA00275
	for parisc-linux@parisc-linux.org; Fri, 17 Jan 2003 18:46:27 +0800
Date: Fri, 17 Jan 2003 18:46:25 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] CVS checkouts on ftp server
Message-ID: <20030117184623.C23928@neep.com.au>
References: <20030115122121.C799@neep.com.au> <20030115131651.F26554@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030115131651.F26554@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Jan 15, 2003 at 01:16:51PM +0000
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
> On Wed, Jan 15, 2003 at 12:21:23PM +0800, Andrew Shugg wrote:
> > I was trawling through ftp.parisc-linux.org/cvs looking for a tarball of
> > the linux-2.5 tree and couldn't see anything, apart from a /cvs/2.5
> > directory (which is currently empty).
> 
> Those aren't currently being generated (AFAIK).  What _is_ being generated
> are the patches against upstream: http://ftp.parisc-linux.org/2.5/kernel-src/

Ah yes, I saw those.  But then I'll need to make a vanilla Linus tree,
and I am lazy.  I mean, streamlined and efficient.  =)

> > Is there enough disk space to do a linux-2.5 tarball for the FTP server?
> 
> Yes, certainly.  Do you still want that, given the existance of these
> patches?

It'd be nice.  Yes, I'd like it, if it's not a problem for anyone.
Otherwise I'll try the above method, or slowly drag it out of CVS.  I'm
assuming that occasional linux-2.5 tarballs might be useful for people
other than me of course ...

> > Also the /cvs directory contains a few files that look like stuff-ups
> > from the CVS tarball roller: linux-.tar.gz and patch-.diff.gz ...
> 
> I can see them... but I can also see the CVS scripts are still running.
> Possibly they'll be renamed later.

Doesn't seem to be; they're empty files (though > 0 bytes from gzip).  I
think the checkout script is using an empty variable, eg linux-$i.tar.gz
or whatever.  The 'latest' softlinks are to these empty files.  I can't
see any likely-looking tarball-rolling scripts in CVSROOT/ so I'm unable
to investigate further.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
