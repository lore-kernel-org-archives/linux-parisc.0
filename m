Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rover.gag.com (rover.gag.com [192.133.104.32])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9FB9482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 10:42:41 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: sid vs woody (was 715/50)
References: <20020113220723.673A7482A@dsl2.external.hp.com>
	<Pine.NEB.4.40.0201141140140.29083-100000@io.fachschaften.tu-muenchen.de>
From: Bdale Garbee <bdale@gag.com>
Date: 14 Jan 2002 10:42:10 -0700
In-Reply-To: <Pine.NEB.4.40.0201141140140.29083-100000@io.fachschaften.tu-muenchen.de>
Message-ID: <871ygsu8wd.fsf@rover.gag.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

aderesch@fs.tum.de (Andreas Deresch) writes:

> > deb http://http.us.debian.org/debian sid main contrib non-free
> > deb http://non-us.debian.org/debian-non-US sid/non-US main contrib non-free
> Shouldn't one use stable, testing and unstable, which are of course at the
> moment linked to potato, woody and sid respectively? Otherwise you will stay
> with sid even when it is declared stable (or unavailable) - and you don't
> want that, do you?  ;-)

"It depends."

First of all, sid won't ever be stable.  Sid was the kid in the Toy Story
movie who was sort of scary and should never be let out of the house... (well,
actually he's the character I most identified with in the movie, but we won't
go there... :-) and it's the *permanent* codename for Debian unstable.  In 
our new pool-based scheme, new names get declared for the 'testing' release 
and become stable with time.  So, 'woody' is now the same as 'testing' and 
will be the same as 'stable' when it is released... at which point a new name
will be assigned for the new testing release, and so on.

Sometimes it makes sense to use the release tokens.  You may want to always
run 'stable' on a machine to get the latest stable release, for example.  In
other cases, it makes much more sense to track a particular named release and
have conscious control over when you hop from one release to another.  If you
want to track unstable, either 'sid' or 'unstable' is fine.  If you want to
start with woody now and stay with it when it goes stable, 'woody' might be
better than 'testing' to use in the sources.list file.

Hope that helps.  For what it's worth, I always use the code names and exert
explicit control over when I hop from one release to another... but I've helped
configure production servers with files that say 'stable' and also include
entries for the security.debian.org updates (crucial if tracking stable!).

Bdale
