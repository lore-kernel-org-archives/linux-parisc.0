Return-Path: <joey@infodrom.org>
Received: from luonnotar.infodrom.org (luonnotar.infodrom.org [195.124.48.78])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA2224857
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 08:07:51 -0700 (MST)
Received: at Infodrom Oldenburg (/\##/\ Smail-3.2.0.102 1998-Aug-2 #2)
	from infodrom.org by finlandia.Infodrom.North.DE via smail from stdin
	id <m1B2teu-000ojYC@finlandia.Infodrom.North.DE>
	for parisc-linux@lists.parisc-linux.org;
	Mon, 15 Mar 2004 16:05:40 +0100 (CET)
Date: Mon, 15 Mar 2004 16:05:40 +0100
From: Martin Schulze <joey@infodrom.org>
To: PA-RISC Linux Hacker <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
Message-ID: <20040315150539.GA20698@finlandia.infodrom.north.de>
References: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
	<200403091103.29310.deller@gmx.de>
	<20040314073706.GA28440@finlandia.infodrom.north.de>
	<200403142048.27506.deller@gmx.de>
	<20040314204959.GA32470@finlandia.infodrom.north.de>
	<20040315003127.GA11856@colo.lackof.org>
	<20040315084247.GJ9104@finlandia.infodrom.north.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20040315084247.GJ9104@finlandia.infodrom.north.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Martin Schulze wrote:
> Grant Grundler wrote:
> > > Well, if you *know* that it's a PS/2 mouse and PS/2 keyboard, you're
> > > correct.  However, does everybody know that who gets hold of a PARISC
> > > machine fully equipped with HIL hub and stuff?  Maybe it's just me
> > > who hasn't expected that since the old (really old) machines didn't
> > > use pc standard equipment and since PA machines usually use different
> > > parts.  You choose since you're more familiar with the port.
> > 
> > Well, maybe it would be better to make this a FAQ on the parisc-linux
> > web site?
> 
> Aye!

Maybe this one is better since CONFIG_KEYBOARD_HIL and CONFIG_HIL_MLC
aren't required.  I'm not sure about the mouse part since mine doesn't
yet work again.

--- /tmp/work/faq.html.orig	2004-03-15 09:36:25.000000000 +0100
+++ /tmp/work/faq.html	2004-03-15 10:44:59.000000000 +0100
@@ -8,6 +8,27 @@
   <li>First of all, your kernel has to be 2.4.18-pa45 or higher.<br>
       Earlier kernel versions will not work !
   </li>
+
+  <li>In the latest 2.6 kernel series, we switched from a PA-RISC-only
+      PS/2 mouse/keyboard driver to the standard Linux kernel PS/2
+      mouse and keyboard drivers.  Hence, in order to get your PS/2
+      mouse/keyboard connected via HIL work you'll have to enable
+      <ul>
+      <li> CONFIG_KEYBOARD_ATKBD
+      <li> CONFIG_MOUSE_PS2
+      </ul>
+      in addition to
+      <ul>
+      <li> CONFIG_INPUT_KEYBOARD
+      <li> CONFIG_INPUT_MOUSE
+      <li> CONFIG_MOUSE_HIL
+      </ul>
+      You don't need these options anymore:
+      <ul>
+      <li> CONFIG_KEYBOARD_HIL
+      <li> CONFIG_HIL_MLC
+      </ul>
+  </li>
   <li>On the bash prompt enter as root the following comand:<br>
       <code>cd /dev && ./MAKEDEV input</code><br>
       This command creates the standard input device nodes in the /dev/input/


Regards,

	Joey

-- 
Whenever you meet yourself you're in a time loop or in front of a mirror.

Please always Cc to me when replying to me on the lists.
