From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: 3.4.1 fails to boot on Apollo 705 in paging_init
Date: Wed, 13 Jun 2012 23:27:53 +0200
Message-ID: <e97c79d800b0513ab9a624af328407a7.squirrel@webmail.sf-mail.de>
References: <e69c1188b0a31ea587fa1faaeb72c712.squirrel@webmail.sf-mail.de>
    <4FD90286.5040301@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FD90286.5040301@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge Deller wrote:

> Did the machine worked with the old debian kernels?

I have no idea, I'm running Gentoo. Current system is this:

Linux apollo 2.6.38.8 #2 Wed Feb 15 17:42:42 CET 2012 parisc PA7000
(PCX-S) 9000/705 GNU/Linux

> According to http://hwdb.parisc-linux.org/view.php?type=machine&name=705
> it has a PA7000 (PCX-S)) CPU, which is PA1.1a generation.
> Probably we still use some assembly which is not supported on PA1.1a yet.
> My "oldest" testmachine was a 715/64 which is PA7100LC aka PA 1.1d
> generation...
>
> I can try to look into this, but this will take some time since I'll
> leave for two-week vacation shortly...

I've reported the breakage in 2.6.39 in the cache code here a while ago
(that's the stuff that recently got some work), afterwards I found no
kernel that was working.

Eike
