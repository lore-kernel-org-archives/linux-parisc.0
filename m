Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7E40482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Nov 2002 22:16:35 -0700 (MST)
Subject: Re: [parisc-linux] long bus walk times on boot up
From: Ryan Bradetich <rbradetich@uswest.net>
To: Matthew Wilcox <willy@debian.org>,
	Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021120154011.G12656@parcelfarce.linux.theplanet.co.uk>
References: <000701c28f4e$081aa460$2cb032d2@home>
	<20021120153041.6264.qmail@web12508.mail.yahoo.com>
	<20021120154011.G12656@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 20 Nov 2002 22:16:31 -0700
Message-Id: <1037855791.5976.11.camel@beavis>
Mime-Version: 1.0
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

Derek or anyone else experience this problem,

Feel free to test out this patch.  This impliments Willy's idea and
seems to work find on linux-2.5.  I can not test this against cvs head
on linux-2.4 since my C200 HPMCs in cpu_idle().

I do not have time to track down the linux-2.4 boot issue right now, but
I will commit this patch once I get C200 to boot cvs head and if
feedback from the patch is good.

Thanks,

- Ryan

On Wed, 2002-11-20 at 08:40, Matthew Wilcox wrote:
> On Wed, Nov 20, 2002 at 07:30:41AM -0800, Derek Engelhaupt wrote:
> > 
> > Well, my C180 is gone to a new home and my C360 is well on it's
> > way, but I had a question about the new netinstall ISO's out there.
> > I had been running the 2.4.19-pa19-20020922-netinst.iso on the C180 and
> > it didn't have the bus walk issues that cause the long boot up times.
> > I really would like to avoid having my C360 take 20+ minutes to boot up.
> > Are there any real huge issues with running this older kernal on my C360
> > or are there any immediate plans to fix the issues of having to walk
> > the entire bus?  I'm still a little weary of compiling my own kernal
> > (only done this through SAM on HP-UX), but if I was forced to I could
> > probably figure it out using the HOWTO's.  Is there a kernal parameter
> > I could tweak that could resolve the long bus walk times?  Or am I just
> > totally off base?  :)
> 
> 2.4.19-pa19 should run fine on a C360.  the long bus walk problem
> isn't yet fixed in the 2.4 CVS (but should be fixed in the 2.5 tree).
> this isn't a ploy to persuade more people to use 2.5; it's just ryan
> didn't get around to it yet ;-)
> 
> -- 
> Revolutions do not require corporate support.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
