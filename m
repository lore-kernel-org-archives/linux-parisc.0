Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F4EE482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 05:29:06 -0700 (MST)
Date: Thu, 22 Nov 2001 13:29:04 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011122132903.E23305@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 'apt-get upgrade' now okay?
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

Hi!

I've tested a bit:

	apt-get update
	apt-get --download-only dist-upgrade
	mkdir /root/CHROOT
	cd /var/cache/apt/archives
	for i in *.deb; do
		dpkg -X ${i} /root/CHROOT
	done

(Yes, I know, this will not result in a sanely installed chroot
environment...)

However, this chroot environment (including shiny new libc6-2.2.4-6)
seems to be okay. So, is it okay now to also update the whole
system?

MfG, JBG
	
-- 
Jan-Benedict Glaw   .   jbglaw@lug-owl.de   .   +49-172-7608481
	http://lug-owl.de/~jbglaw/software/snapshot2cvs/
