Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from portal.gmu.edu (portalknot.gmu.edu [129.174.0.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1976F4833
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Mar 2002 17:38:25 -0700 (MST)
Received: from gmu.edu (mail02.gmu.edu [129.174.0.10])
	by portal.gmu.edu (8.8.8/8.8.8) with ESMTP id TAA27687
	for <parisc-linux@lists.parisc-linux.org>; Sun, 31 Mar 2002 19:38:18 -0500 (EST)
From: <ccollet@gmu.edu>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <271520c2711900.2711900271520c@gmu.edu>
Date: Sun, 31 Mar 2002 19:38:18 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] parisc-linux semi-booting on an HP 3000 947
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

Hi,
   Just for fun I though I'd try running parisc-linux on my HP 3000 947
which is in need of an OS since I don't have MPE/iX tapes. It actually
booted off the latest CD image, but it freezes once it gets to the "If
this is the last message you see, you need to switch your console"
message. From what I've read, I assume this means that there's no
console driver written for this machine, which isn't suprising since it
isn't on the list of supported machines. Any idea if there's a way
around this, or if the NetBSD or OpenBSD ports might support it? Thanks
in advance.
   Chris.
