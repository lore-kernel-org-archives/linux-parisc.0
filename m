Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 508754829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Nov 2002 08:40:16 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18EWxX-0004my-00; Wed, 20 Nov 2002 15:40:11 +0000
Date: Wed, 20 Nov 2002 15:40:11 +0000
From: Matthew Wilcox <willy@debian.org>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] long bus walk times on boot up
Message-ID: <20021120154011.G12656@parcelfarce.linux.theplanet.co.uk>
References: <000701c28f4e$081aa460$2cb032d2@home> <20021120153041.6264.qmail@web12508.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021120153041.6264.qmail@web12508.mail.yahoo.com>; from derekengelhaupt@rocketmail.com on Wed, Nov 20, 2002 at 07:30:41AM -0800
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

On Wed, Nov 20, 2002 at 07:30:41AM -0800, Derek Engelhaupt wrote:
> 
> Well, my C180 is gone to a new home and my C360 is well on it's
> way, but I had a question about the new netinstall ISO's out there.
> I had been running the 2.4.19-pa19-20020922-netinst.iso on the C180 and
> it didn't have the bus walk issues that cause the long boot up times.
> I really would like to avoid having my C360 take 20+ minutes to boot up.
> Are there any real huge issues with running this older kernal on my C360
> or are there any immediate plans to fix the issues of having to walk
> the entire bus?  I'm still a little weary of compiling my own kernal
> (only done this through SAM on HP-UX), but if I was forced to I could
> probably figure it out using the HOWTO's.  Is there a kernal parameter
> I could tweak that could resolve the long bus walk times?  Or am I just
> totally off base?  :)

2.4.19-pa19 should run fine on a C360.  the long bus walk problem
isn't yet fixed in the 2.4 CVS (but should be fixed in the 2.5 tree).
this isn't a ploy to persuade more people to use 2.5; it's just ryan
didn't get around to it yet ;-)

-- 
Revolutions do not require corporate support.
