Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail005.syd.optusnet.com.au (mail005.syd.optusnet.com.au [210.49.20.136])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D7014829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Oct 2002 09:42:18 -0600 (MDT)
Received: from dylan1 (c17264.frank1.vic.optusnet.com.au [210.49.208.124])
	by mail005.syd.optusnet.com.au (8.11.1/8.11.1) with SMTP id g9HFgFc09446
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Oct 2002 01:42:15 +1000
Message-ID: <000f01c275f3$c826bd80$0100a8c0@dylan1>
From: "Crazy Ape" <crazyape@optusnet.com.au>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 18 Oct 2002 01:42:21 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] C160 curious network problem
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

Hello folks,
I just picked up an old C160 at auction, and while I'm no stranger to linux,
I've never dealt with anything quite like this.

The following info may be of use to people having some trouble with similar
setups. The machine has the following specs:

128MB RAM (as is standard)
A4071B graphics card (24 bit)
J3516A 10/100 network card (this is a dual channel card)
Firmware is 6.1 (though I had the same quirk with 5.0)

I've tested the debian 3.0 release and several of the recent netboot images
(kernel 2.4.19) and the quirk persists.

When I try to install any parisc-linux image I get so far as the network
configuration then the machine hangs, heartbeat stops and some diagnostic
pattern is repeated on the front panel LED's. (does anyone have a list of
these diagnostic patterns?)

This only happens if I have no network connected to the onboard LAN
connector (or perhaps it's because I DO have the cable plugged into the
addon card). Even dropping to a shell at the earliest time and typing
"ifconfig  eth0 192.168.0.8" will cause the hang. I'm pretty sure the same
happens with the other interfaces as well because I tried them during normal
setup and it hung.

If I connect the network cable to the built in LAN socket I don't have the
problem, I can switch to the addon card directly after the network setup is
done, and continue to install packages via the internet. Of course it's a
pain because I's rather keep the cable in a 100 Mbit capable port all the
time, not have to stuff about at boot time.

Is it something to do with the order the ports are assigned in by linux?
eth0 - J3516A port 1
eth1 - J3516A port 2
eth2 - onboard

The other thing, which may have been discussed already in the list (though I
did have a bit of a look fo it) is that the system seems to hang for 10-15
minutes during install and during normal boot after installation. During
this time the heartbeat slows to a crawl, the usual pulse-pulse pattern
slows to about 1 second for each of the two pulses, with the time in between
beats being an agonizing wait. After 10-15 mins, it all comes back to life
and continues booting! Has anyone encountered this or even solved it.

Cheers,
Dylan
