Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snipe.mail.pas.earthlink.net (snipe.mail.pas.earthlink.net [207.217.120.62])
	by dsl2.external.hp.com (Postfix) with ESMTP id 674C64829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 15:43:22 -0600 (MDT)
Message-ID: <3D8E3A0B.5090008@earthlink.net>
Date: Sun, 22 Sep 2002 16:45:47 -0500
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: Joel Soete <joel.soete@freebel.net>
Cc: Derek Engelhaupt <derekengelhaupt@rocketmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mouse stops working when exiting KDE
References: <20020921220317.3256.qmail@web12502.mail.yahoo.com> <3D8D0454.40706@earthlink.net> <3D8DCD8D.8070300@freebel.net>
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

Joel Soete wrote:

>> I assume you are running the gpm mouse daemon as well. If you tell X 
>> to use the gpm mouse (/dev/gpmdata), you should be okay.
> 
> 
> Hmm, long time ago I test this (because that was like this I configure 
> my i386 boxe) but it did not work. Does it work now on parisc?

Last time I checked, it did. Debconf and I have a difference of opinion 
about it's overwriting XF86Config-4 after I hand-edit it. So and X 
upgrade arrives, and the config file gets overwritten. :-)

>>
> with kde ?

No, I've seen it with Gnome also, on: alpha, ppc, sparc, and i386.

> 
> Because with the same software config (gdm + xfce + xfree86-4.1) the 
> same problem occurs on my parisc (b180) and not on my i386 (on which I 
> also use /dev/psaux as mouse device)?
> 

But, IS gpm running? Both it and the X server are trying to grab events 
from /dev/psaux...

> (sorry (I would be of better help) I never have time to investigate in 
> more details this problem. And I do not remember exactly if it was 
> always there or if it appears with a new release of xfree86 or with a 
> new kernel release? Is some one can refresh my memory?)

Seen it on X 4.0, 4.1 and 4.2. So I'd say it's not kernel-related.

-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
