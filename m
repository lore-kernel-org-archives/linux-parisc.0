Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D7FC4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 01:13:29 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0Q8RiT02652
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 00:27:44 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0Q8HVM25923
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Jan 2003 00:17:31 -0800
Date: Sun, 26 Jan 2003 00:17:31 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0301252356110.25913-100000@jordan.eng.nateng.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Ok all
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

  I would like to say thanks for everyone that replied to the questions I
asked, and apologize for my rant the other day.
  I was told by many people {don't have access to the list of who at the
moment}, that this was the list to bug with the debian problems.
Anyway that said, some quick things:

-------------------------------------------------------------------------
> Why remove the existing package?
> I overwrite existing files when I need to.

The install paths are different than the paths that were used byt the
packages.
-------------------------------------------------------------------------
> yes. The CD has a shell which will let you fix *most* things.

> You might also try booting with "init=/bin/bash" or if you are lucky,
> "init=/bin/sash". Then by hand re-install the libncurses.

Ahh, just like IRIX, thanks...
-------------------------------------------------------------------------
> uhm...what are you building that takes 4 days?
> Not even glibc or xfree86 takes that long.

On 128 Meg of ram, and 1 100Mhz pa7200, openssl, openssh, 2.4.20 kernel,
gcc 2.95.3, pine, and several other apps...  Remembering things don't
normally build the first time around, and tweaks must be made...
-------------------------------------------------------------------------

> What's more, no need to use CAPS, exclamations and other insults to ask
> questions or report problems. You won't get any result but upsetting
> guys who did a _damn good work_ to make the stuff work.

Ok, then I will give credit to everyone who got it this far, I am happy I
might be able to get the workstations here in my office off of HP/UX 10.20
and into this decade, even if I have to setup NFS-root clients to do it.

But, I really would like to emphasise, how much I really don't appreciate
the linking or curses into so many things.  I built my own dist from
scratch for the Hitachi-SuperH, and I had little to no help at the time,
since there was no one working on it yet.  I found no reason to link
libraries in that weren't needed, especially since I was building from
scratch, and it was more than I needed in the beginings....  Noteably
hppa-linux is much farther along than my dist was or is, so credit
to the folks there...  But like it has been said this is the wrong
liste to rant on.

--------------------------------------------------------------------------

> Lots of lots of fun. BTW, do you know how to install a .deb file without
> the benefit of a working dpkg/dselect/apt et al?

I did not until a day after I wrote that mail.  I work in a different
state than where I live, so I copied the .debs from the cd and looked it
up when I got home.   Only to find out I could not login to use what I
read about them..  It sucked...
I know about slackware pacakges and rpms, but I have never had to use
debian as a dist until I started working trying to figure out how to get
linux on my boxes.
Thanks for your quick tutorial, now I have it written down in my email so
I can find it faster should I forget what I read.

-------------------------------------------------------------------------


So.... in closing, thanks for the answers, and not killing me for sending
the mail in the first place.

  --Sir Ace
