Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gate450.dyndns.org (pD955D5F1.dip.t-dialin.net [217.85.213.241])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4676484D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 18:02:34 -0600 (MDT)
Received: from athlon.heylan (athlon.heylan [192.168.0.11])
	by gate450.dyndns.org (8.11.2/8.11.2/SuSE Linux 8.11.1-0.5) with ESMTP id g6C02VZ10210
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Jul 2002 02:02:32 +0200
Received: (from andreas@localhost)
	by athlon.heylan (8.11.2/8.11.2/SuSE Linux 8.11.1-0.5) id g6C02M324534
	for parisc-linux@lists.parisc-linux.org; Fri, 12 Jul 2002 02:02:22 +0200
Date: Fri, 12 Jul 2002 02:02:22 +0200
From: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] x windows keybord problem on 715/33
Message-ID: <20020712000222.GC20431@gate450.dyndns.org>
References: <Pine.LNX.4.44.0207111849360.32161-100000@tassadar.physics.auth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0207111849360.32161-100000@tassadar.physics.auth.gr>
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

Hallo Dimitris,
	
* Dimitris Zilaskos <dzila@tassadar.physics.auth.gr> [2002-07-11 17:51]:
> I am trying to setup X windows in an 715/33 . I can start various Windows
> managers like wdm and xdm , but i cant get keys 'i' and 'o' to work (
> they work ok in console ).All other keys work ok .

I had the same symptoms with a german ps2 keyboard on a 712, just with other
keys beeing dead (<, > and |).

xev showed that X is getting keycodes from those keys, but they were
not alligned.
I changed the keycodes in /etc/X11/xkb/keycodes/xfree86 according to the
ones xev reported. I guess in your case you would have to change them to:

<AD08> = code reported for i
<AD09> = code reported for o

Could also be that the cause for your dead keys is another 
and this hint totally useless.

regards,
	andreas
