Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (i106-182.nv.iinet.net.au [203.59.106.182])
	by dsl2.external.hp.com (Postfix) with ESMTP id 658824829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 May 2003 20:41:41 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id KAA05628
	for parisc-linux@lists.parisc-linux.org; Fri, 9 May 2003 10:37:51 +0800
Date: Fri, 9 May 2003 10:37:47 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
Message-ID: <20030509103745.H20047@neep.com.au>
References: <20030507154817.GH27494@lug-owl.de> <3EB772D800000C9F@ocpmta2.freegates.net> <20030507171734.GG23465@tausq.org> <20030507175155.GJ27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030507175155.GJ27494@lug-owl.de>; from jbglaw@lug-owl.de on Wed, May 07, 2003 at 07:51:55PM +0200
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

Jan-Benedict Glaw said:
> Thanks. This reminds me that I'd still *love* to see the CVS repository
> rsync'able. That'd really help me. However, it's at least nice to be
> basically able to rsync the checked-out source trees.
> 
> Any chances for a rsync for the CVS repo?
> 
> MfG, JBG

I'm not sure why you'd want to be able to rsync the entire repository,
unless you want to be able to track multiple branches of a module
without having to have a full checkout of each one?  That would make
more sense I guess, if you live in a world where the Internet is slow
and bandwidth is not free (I live there too, small world!).

There is already an rsync server running on ftp.parisc-linux.org, but I
don't believe it's widely advertised.

I just ran an 'rsync -va ftp.parisc-linux.org.au::pub' (the only rsync
'module' available) and the output was 14M!  Presumably this caused a
fair bit of thrashing at f.p-l.o's end as well ...

If you'd like to see what's available by rsync, I've compressed that
listing and uploaded it here.

ftp://ftp.neep.com.au/pub/parisc-linux/ftp.parisc-linux.org-rsync.txt.bz2

I'll have a trundle through it myself today, to see if I can write a
helpful motd for rsyncd and suggest how the ::pub module can be split up
into more useful bits.  (Bame, may I assume that you're still nominally
in charge of the rsyncd server?)

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
