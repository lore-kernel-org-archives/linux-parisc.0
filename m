Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from phnxpop3.phnx.uswest.net (phnxpop3.phnx.uswest.net [206.80.192.3])
	by dsl2.external.hp.com (Postfix) with SMTP id 498BC4A19
	for <parisc-linux@parisc-linux.org>; Sun, 11 Mar 2001 09:51:12 -0700 (MST)
Date: Sun, 11 Mar 2001 09:49:21 -0700
Message-ID: <20010311094921.V18113@tausq.org>
From: "Randolph Chung" <randolph@tausq.org>
To: "Matthew Wilcox" <matthew@wil.cx>
Cc: "Alan Modra" <alan@linuxcare.com.au>,
	"Matt Taggart" <taggart@fc.hp.com>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] segfaults with new binutils
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.LNX.4.21.0103111254230.23407-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0103111420410.23407-100000@front.linuxcare.com.au> <20010311125007.A21169@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010311125007.A21169@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sun, Mar 11, 2001 at 12:50:07PM +0000
List-ID: <linux-parisc.vger.kernel.org>

In reference to a message from Matthew Wilcox, dated Mar 11:
> On Sun, Mar 11, 2001 at 02:31:26PM +1100, Alan Modra wrote:
> > Incidentally, I'm not actively updating binutils CVS on pehc any longer.
> > If you want the latest code, get it from sourceware.cygnus.com CVS, either
> > the 2.11 branch, or trunk for bleeding edge code.  At the moment, there's
> > no particular reason to not use pehc for hppa-linux binutils, as it's not
> > too far behind, but that will no doubt change in the future...
> 
> Is there any point in keeping this CVS module then?  Shall we just delete it?

i'm not sure what taggart did to build the deb on pehc, but i've been
building from Debian's source package. If we are at a point where we can
rely on the Debian maintainer to get the sources from upstream that we
need I think we'll be much better off.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
