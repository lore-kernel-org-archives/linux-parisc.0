Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rubicon.hasler.ascom.ch (rubicon.hasler.ascom.ch [139.79.129.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49012482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 02:07:52 -0700 (MST)
Received: from srvmailgate1.hasler.ascom.ch (srvmailgate1.hasler.ascom.ch [139.79.135.89])
	by rubicon.hasler.ascom.ch (8.11.4/8.11.4) with ESMTP id g1M97mQ12748
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 10:07:48 +0100 (MET)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OF0A3B134F.4AC4EE69-ONC1256B68.002AD4A9@hasler.ascom.ch>
From: "Thomas Schmid" <Thomas.Schmid@ascom.ch>
Date: Fri, 22 Feb 2002 10:07:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Problems running KDE on PARISC
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

Hi all,

I do hope this is not off-topic, but I could not find a hint to my 
problem anywhere else.

I'm running the 0.9.3 distribution on 2 PARISC machines: 
HP 712/80, 64MB RAM and HP 715/100XC, 256 MB RAM

Generally speaking KDE is slow on these machines, but
when I log in from KDM, it takes on _both_ machines about
4..5 minutes to go from KDM login screen to KDE window
manager.

Nothing fancy (wallpaper, fontaliasing, file preview) is enabled,
just a 2 color gradiant background.

What I can see from "top" is that the "kdeinit knotify" process
uses up to 90% CPU for quite a long time; it also seems to run
3 times in a row. Memory usage is neglectable.

When I finally "arrive" on the KDE desktop I get 3 SIGSEGV
(KDE crashmanager) for the 3 "knotify"s plus an error dialog
box saying: "The protocol for the file process died unexpectedly"
(I guess it means that the kio_file process died, but after all that
I have 1 kio_file process running)

After that KDE is usable.

Does anybody have similiar / better / worse experiences with
KDE ?  Any hints what to improve ? Is the KDE package in a
sub-optimal stage ?

Thanks for any input
Thomas

 
