Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx03.cluster1.charter.net (dc-mx03.cluster1.charter.net [209.225.8.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6AFAC482A
	for <parisc-linux@parisc-linux.org>; Fri,  6 Sep 2002 22:33:27 -0600 (MDT)
Message-ID: <3D79817E.201@charter.net>
Date: Sat, 07 Sep 2002 00:33:02 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Opinions on desktop environments
References: <20020907005814.6142.qmail@web12506.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Derek Engelhaupt wrote:
> Well, got KDE to work, but it just seems slow even with my 1.6MB of RAM
> and 2GB of swap on my C180.  I guess my questions would be what would
> be an alternative that might run faster and/or be better overall than
> KDE?  Gnome?  I guess I'm looking for what you guys think is the best
> desktop environment to run.  Thanks.
> 
> derek


Hehe... you should try running a 715 or 712! The C-Class machines positively
scream! I agree though, KDE is somewhat sluggish on my C200, but really not
too bad, its usable. I've heard rumors that someday the hppa c-library could
be optimized to run _much_ faster but its still a baby as far as linux is
concerned - I'm just tickled that it even works... I wanted another non-x86
machine (also have a Netwinder), but SGI's are pretty exotic (though tempting),
Alpha's seem super cool but are somewhat expensive and often in bad disrepair,
and Sun machines are either too expensive or too old. The hppa boxes provided
a nice economy and are very much contenders with any of the aforementioned
architectures. In its day a C200 running HP/UX was supposedly able to smoke
a 600MHz Alpha! Obviously there is a lot of optimization still to do...

I started off with a 715/80, got Woody running good on it, played with it for
almost a year, then sold it on Ebay for a small profit (Debian sells!) and
rolled my dough into the C200. I'm rather happy with its performance,
although it doesn't hold a candle to my super dual pentium-II 450 monster
box, still its a cool and useful machine, and very nice for making sure
that your app is portable, compiling your own hppa debs, etc. I don't run
mine 24/7 because it has pretty high power consumption, so the Netwinder
is my little server machine -> http://www.gyrodynamic.net

Well, I sent you a private email with my suggestions about E, but now that
I think about it, BlackBox isn't too bad with 8bpp color. Assuming that
somebody has fixed "update-menus" really any Debian window manager should
work with KDE, Gnome, and other X apps. The Debian menus should provide
access to all the installed packages which is all you really need.

BTW, regarding "update-menus" - the last time I tried it on hppa it worked
as root but segfaulted as a normal user.



- Doug
