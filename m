From: <dlorin@univ-rennes1.fr>
Subject: [parisc-linux] Re: HP9000/710
Date: Wed, 03 Jul 2002 19:37:48 +0100
Message-ID: <200207031737.TAA09556__22780.9273325422$1416621461$gmane$org@mailimailo.univ-rennes1.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: <debian-hppa@lists.debian.org>,
	<parisc-linux@lists.parisc-linux.org>
To: ste <stemelchior@inwind.it>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
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
