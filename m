Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87558487A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 07:31:45 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17RYcC-0008Mq-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 08 Jul 2002 14:31:44 +0100
Date: Mon, 8 Jul 2002 14:31:44 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing on C110
Message-ID: <20020708133143.GE815@tykepenguin.com>
References: <3D254C22.7645EDE3@ruhr-west.de> <HMEKIKEAKEFFMJJOEAJNOEDHFJAA.maudette@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <HMEKIKEAKEFFMJJOEAJNOEDHFJAA.maudette@synopsys.com>
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

On Mon, Jul 08, 2002 at 09:16:00AM -0400, Michael Audette wrote:
> I have the same problem with the RTC on my C110.  I replaced the
> battery...and the real-time clock does work.  Even after a reboot.  But upon
> a kernel panic the RTC gets nuked.  I can panic the 0.93 kernel by 'cat
> /etc/passwd > /dev/audio' without the harmony driver installed (I have not
> gotten around to recompiling my kernel as of yet).  Try setting it upon boot
> then rebooting.  If this works then your RTC is more than likely ok.


That probably explains why mine seems to work sometimes and not others :-)
I just installed ntpdate and ignored the problem.

Patrick
