Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-06.iinet.net.au [203.59.3.38])
	by dsl2.external.hp.com (Postfix) with SMTP id 66CEC4831
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 06:57:00 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id VAA12951
	for parisc-linux@lists.parisc-linux.org; Mon, 19 Nov 2001 21:56:49 +0800
Date: Mon, 19 Nov 2001 21:56:46 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: rsync for CVS repository
Message-ID: <20011119215644.G10112@neep.com.au>
References: <jbglaw@lug-owl.de> <200111150105.SAA09926@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200111150105.SAA09926@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, Nov 14, 2001 at 06:05:07PM -0700
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

Quoth Grant Grundler:
> Jan-Benedict Glaw wrote:
> > ...which remembers me that I emailed with Grant these days about
> > making the CVS repository available via rsync. He also thought that
> > that would be a nice thing to have... I volunteered to do the setup
> > if time is all off. How about that?
> 
> I've heard nothing back about this.  Sorry - I can't autonomously give
> out logins to the cvs machine or I would have already.
> Do you have a URL for a short how-to?
> I might take a crack at it if no one else with access speaks up.
> 
> grant

I've not responded individually to the comments in the thread following
this post, but I think there's a bit of confusion.

There's not much point in setting rsync access to the CVS repository,
except for mirroring purposes.  (And even then, you probably would only
want it to be rsync in one direction; maintaining two or more live CVS
repositories and attempting to keep them synchronised with rsync would
be an exercise in hard work.)

What is useful though, and what is being done by several projects, is to
maintain one or more checked-out trees from their CVS repository and
have these trees available by anonymous rsync.  Most popular CVS
projects don't branch, and so this is very easy: a regular cron job
keeps a CVS HEAD checkout fresh, and the tree is served by rsync or some
other server of choice (ftp/http).

The usefulness of this - as it is not replacing cvs in any way - is that
a user may easily bring their tree in sync with HEAD (or whichever
branch is being tracked) and then still be able to perform the usual cvs
operations on it (eg diff, log etc).

I know that I would make use of an anonymous rsync service if it were
available.  I do agree with the point made by some others though, that
if advertised there are likely to be people who will try it just for fun
and then generate a lot of list noise when they have problems.  On the
other hand, this is a risk you also take by putting up a CVS server, or
running a mailing list.  There's a balance there somewhere.  =)

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
