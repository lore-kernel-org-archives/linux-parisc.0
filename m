Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B7E8482A
	for <parisc-linux@parisc-linux.org>; Thu, 19 Apr 2001 22:19:17 -0600 (MDT)
Date: Thu, 19 Apr 2001 22:19:16 -0600
To: james rich <james.rich@m.cc.utah.edu>
Cc: Matthew Wilcox <willy@ldl.fc.hp.com>,
	"Eric S. Raymond" <esr@thyrsus.com>, linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
Message-ID: <20010419221916.K4217@zumpano.fc.hp.com>
References: <20010419211749.I4217@zumpano.fc.hp.com> <Pine.GSO.4.05.10104192201330.8316-100000@pipt.oz.cc.utah.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.4.05.10104192201330.8316-100000@pipt.oz.cc.utah.edu>; from james.rich@m.cc.utah.edu on Thu, Apr 19, 2001 at 10:07:22PM -0600
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Apr 19, 2001 at 10:07:22PM -0600, james rich wrote:
> Doesn't this seem a little like the problems occurring with lvm right now?
> A separate tree maintained with the maintainers not wanting others
> submitting patches that conflict with their particular tree?  It seems
> that any project should be able to submit any patch against The One True
> Tree: Linus' tree.

every single architecture has their own development tree.  the pa project
has not been running as long as the other ports, and has a large amount of
development going on.  i count 28 commits for april (so far), 75 commits
for march, 187 for february and 112 for january (to the kernel tree, other
parts of the port also have commit messages).  linus would go insane if
we sent him every single one of those patches individually.  and we'd
go insane trying to keep up with what he'd taken and what he'd dropped.

until you've actually tried doing this, please don't attempt to criticise.
