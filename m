Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9051D7B.dip.t-dialin.net [217.5.29.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 406C26126
	for <parisc-linux@parisc-linux.org>; Wed, 12 Dec 2001 15:37:08 -0700 (MST)
Date: Wed, 12 Dec 2001 23:35:05 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Paul Bame <bame@fc.hp.com>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 kernel and CVS -- opinions?
Message-ID: <20011212233505.C1998@solo.franken.de>
References: <bame@fc.hp.com> <200112120429.VAA03750@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200112120429.VAA03750@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Tue, Dec 11, 2001 at 09:29:25PM -0700
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

On Tue, Dec 11, 2001 at 09:29:25PM -0700, Grant Grundler wrote:
> Paul Bame wrote:
> > It's time to start tracking the 2.5 kernel at cvs.parisc-linux.org
> > and there are a few different ways to do it -- I'm looking for opinions.
> > My favorite option at the moment is 1A.
> 
> I'm ok with 1A as well:

I don't have a hard opinion whether having two tree makes more sense than
trunk/branch hoping. People will probably work for some time on 2.4
and switch over to 2.5, so I guess two trees are ok.

> o *someday*, I hope the CVS date-based check out will get fixed.
> o TAGs work and I'm ok with tag being used.

tags are sometimes nice, but too much tags aren't. Try a cvs log with hundreds
of tags. That's not funny. And btw. tags are (re-)movable and they don't have a
history, which makes them pretty useless for any serious build system. At
work we use seperate cvs controlled sourcelists, which lists every file with
its revision of a release. That way it's always possible to rebuild an old
release even if a dork moved/removed a tag.

> o We could TAG weekly (or monthly) and keep enough nightly
>   checkout's to cover two or three tags. Or whatever we can
>   afford for diskspace.

I don't see a point for needing that. But maybe I'm just overlooking something.

I personaly wouldn't touch 2.5 at the moment. Right now 2.5 looks to
me like an adventure park of out of control kids. That's ok but IMHO it
doesn't help Linux/PARISC development. Hunting generic bugs mixed with
architecture bugs isn't fun. Let's wait until 2.5 settles and Linus will
accept PARISC inclusion (which he won't at the moment).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
