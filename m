Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tassadar.physics.auth.gr (tassadar.physics.auth.gr [155.207.123.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id C96CD484B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 09:50:42 -0600 (MDT)
Received: from localhost (dzila@localhost)
	by tassadar.physics.auth.gr (8.11.6/8.11.6) with ESMTP id g6BFoeP32197
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 18:50:40 +0300
Date: Thu, 11 Jul 2002 18:50:40 +0300 (EEST)
From: Dimitris Zilaskos <dzila@tassadar.physics.auth.gr>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0207111849360.32161-100000@tassadar.physics.auth.gr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] x windows keybord problem on 715/33
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

 Hello ,

I am trying to setup X windows in an 715/33 . I can start various Windows
managers like wdm and xdm , but i cant get keys 'i' and 'o' to work (
they work ok in console ).All other keys work ok .

 I have the following lines in the XF86Config

   Option "XkbdRules" "xfree86"
   Option "XkbModel" "hphil"


 and in my  /etc/X11/xkb/rules/xfree86:
     hp = xfree86 pc(pc104)
     hphil = hp(hil) hp(hil)

 I am running 2.4.18-pa41 . Newer kernels till 54 either freeze my
keyboard or have ksoftirqd consume 100% cpu ( or both) . I am using a
serial  mouse for X . It works  most of the time but sometines the pointer
stops moving untill I press a key . Work ok under console though .

 Any advice how to make 'o' and 'i'  work ?

 Regards ,
--
=============================================================================

Dimitris Zilaskos

Department of Physics @ Aristotle Univercity of Thessaloniki , Greece
=============================================================================
