Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACC15482C
	for <parisc-linux@parisc-linux.org>; Thu, 20 Mar 2003 08:21:56 -0700 (MST)
Date: Thu, 20 Mar 2003 17:21:47 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] CVSy stuff
Message-ID: <20030320152147.GA27039@marmite.its.uct.ac.za>
References: <20030318143337.GF14520@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030318143337.GF14520@parcelfarce.linux.theplanet.co.uk>
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

On Tue, Mar 18, 2003 at 02:33:37PM +0000, Matthew Wilcox wrote:
> 
> According to the folk wisdom around CVS, long-lived branches make
> operations slower.  Here's some evidence:
> 
> http://mail.gnu.org/archive/html/info-cvs/2001-08/msg00939.html
> http://sources.redhat.com/ml/gdb/2003-03/msg00091.html
> 
> >From this point of view, our CVS tree is practically pessimal.  We have
> two long-lived, regularly-updated branches (1.1.2. and 1.).  This may
> explain why CVS is taking a long time to do simple stuff that used to
> not take very long at all.
[snip]

I don't want to start an SCM flamewar, but, since Thibaut already
mentioned BK... :)  Subversion (http://subversion.tigris.org/) has cheap
branching and tagging (which are both actually just "cheap" copies.)
Subversion does not slow down depending on the lifetime of the branches
etc.

Of course Subversion is not yet 1.0, but there are at least some people
playing with importing Linux kernel trees into Subversion repositories,
and Connectiva uses Subversion for all the packages etc. in their
distribution.

See http://subversion.tigris.org/svn-repositories.html for some of the
people using it.  The biggest repository on that list is Connectiva's
> 7GB repository.

I don't know if anyone's tried Subversion on parisc Linux.

I am not involved in the Subversion project, except that I am subscribed
to the developers list.  I have not submitted any but the most trivial
of patches and don't care if you decide to use it or stick with CVS or
use something else.

-- 
Michael Wood <mwood@its.uct.ac.za>
