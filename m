Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from avocet.mail.pas.earthlink.net (avocet.mail.pas.earthlink.net [207.217.120.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 978054829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 21 Sep 2002 17:41:57 -0600 (MDT)
Message-ID: <3D8D0454.40706@earthlink.net>
Date: Sat, 21 Sep 2002 18:44:20 -0500
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mouse stops working when exiting KDE
References: <20020921220317.3256.qmail@web12502.mail.yahoo.com>
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
> Hey all,
> 
> Currently when my system boots up the X11 login window starts up
> automatically and I can log in and use it normally, but when I log out
> the mouse quits working.  The X11 login window appears again, but the
> mouse won't move anymore.  I'm just using a standard PS/2 HP 3 button
> mouse - nothing fancy on my C180.  Also, why is it that Konqueror won't
> do https sites?  And if it will what could possibly be the problem with
> that?  Thanks.

I assume you are running the gpm mouse daemon as well. If you tell X to 
use the gpm mouse (/dev/gpmdata), you should be okay. Personally, I just 
turn off the gpm daemon, because I don't need a mouse in console mode.

(It's not a parisc-only bug: I see this on virtually every Debian platform)

-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
