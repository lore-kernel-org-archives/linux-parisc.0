Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailimailo.univ-rennes1.fr (mailimailo.univ-rennes1.fr [129.20.131.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2668483C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Jul 2002 11:37:52 -0600 (MDT)
Message-Id: <200207031737.TAA09556@mailimailo.univ-rennes1.fr>
Date: Wed, 03 Jul 2002 19:37:48 +0100
MIME-Version: 1.0
Cc: <debian-hppa@lists.debian.org>,
	<parisc-linux@lists.parisc-linux.org>
To: ste <stemelchior@inwind.it>
From: <dlorin@univ-rennes1.fr>
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] Re: HP9000/710
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

Yes, it seems to me it's a Vvv..WKP (a very very very well known problem), and the precedent answer was judicious: Skip over the keyboard's configuration during the installation.
(In fact, the Debian's Installer (see 'dbootstrap') doesn't hang completely, if you're trying to fix the keymap at this stage. But the keys get random defined)
As soon as Woody is installed on your hard drive and after the first reboot, you can configure your keyboard, running:
'kbdconfig' as root. Good Luck.
(nota: there is a lot of mails about it, in the mail-list of debian-hppa)
