Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (unknown [203.38.119.88])
	by dsl2.external.hp.com (Postfix) with ESMTP id 156414829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 02:58:56 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id QAA32744
	for parisc-linux@lists.parisc-linux.org; Mon, 12 Aug 2002 16:56:55 +0800
Date: Mon, 12 Aug 2002 16:56:52 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Updated parisc-linux .cvsrc
Message-ID: <20020812165650.C897@neep.com.au>
References: <1029108194.637.9.camel@beavis> <20020812155838.A897@neep.com.au> <20020812102135.6bb1cff0.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020812102135.6bb1cff0.varenet@esiee.fr>; from varenet@esiee.fr on Mon, Aug 12, 2002 at 10:21:35AM +0200
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

Thibaut VARENE said:
> > In my experience it has been more common to fix the repository.  =)
> 
> Heh, sure, but this is not actually *possible*, so to speak: Matt
> pointed out that folders can't be removed from the repository, since
> they are mandatory to keep the 'Attic' in them.
> 
> That allows anyone to grab an old version of the kernel, using cvs
> tags...

Oh I know, I'm aware of that, it was more of a joke.  Some people use
CVS in a very carefree manner (shared bitbucket) and aren't really too
worried about breaking old versions.  Why do they use CVS then?  Good
question ... because it's there, I suppose.

Of course this is one of the main weaknesses in CVS, in case anyone out
there thinks it's the best thing since sliced bread: no revision control
on directories (folders/containers/collections/whatever).  =)

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
