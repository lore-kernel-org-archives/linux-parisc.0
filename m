Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from octopus.kti.ae.poznan.pl (octopus.kti.ae.poznan.pl [150.254.204.7])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47AFA483E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Sep 2003 08:32:14 -0600 (MDT)
Received: from pyxis.kti.ae.poznan.pl ([150.254.204.45] helo=localhost)
	by octopus.kti.ae.poznan.pl with esmtp (Exim 3.35 #1 (Debian))
	id 1A1oBA-0000f4-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Sep 2003 16:30:12 +0200
Date: Tue, 23 Sep 2003 16:30:01 +0200
From: Jacek Chmielewski <jchmiel@kti.ae.poznan.pl>
Reply-To: Jacek Chmielewski <jchmiel@kti.ae.poznan.pl>
Message-ID: <881138831633.20030923163001@kti.ae.poznan.pl>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PALO do not start!
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

Hi

I managed to install Debian on my HP 9000/J200 box (I used DHCP server and
netinstall lifimage). The installation procedure passed without problems. I
created three partitions:
/dev/sda1  *  1    4    16461  f0  Linux/PA-RISC boot
/dev/sda2     5   34   123690  82  Linux swap
/dev/sda3  * 35  277  1001889  83  Linux

After the reboot I get the following result:

Booting...
Boot IO Dependent Code (IODC) revision 1
HARD Booted.

... and everything nothing happens. I assume that I should see PALO
starting from the /dev/sda1 partition, but it don't want to start.

What could be possibly wrong?
Is there any solution or workaround for this problem?

Best regards
  Jacek
