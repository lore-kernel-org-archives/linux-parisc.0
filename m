Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.it (mail-1.tiscalinet.it [195.130.225.147])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18A384869
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Jul 2002 06:21:06 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: ste <stemelchior@inwind.it>
Date: Fri, 5 Jul 2002 14:12:21 +0200
Cc: <dlorin@univ-rennes1.fr>,
	"Erling A. Jacobsen" <linuxcub@email.dk>,
	Jan Heumann <jheumann@fonts.de>,
	Paolo Ambrosio <blues@iglu.cc.uniud.it>,
	Roberto Checcozzo <r.checcozzo@libero.it>,
	<debian-hppa@lists.debian.org>, <parisc-linux@lists.parisc-linux.org>
References: <200207031737.TAA09556@mailimailo.univ-rennes1.fr> <02070410352000.0 
MIME-Version: 1.0
Message-Id: <02070514115600.00684@www>
To: Bengen <bengen@vdst-ka.inka.de>
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

Well, the first error I made (why didn't I read the manual, always RTFM, i.e. 
ReadThatF**ingManual) was that I didn't partitioned the HDD in the right 
ways: so I did the second time I tried to install the Workstation. Imean you 
must divide the HDD in at least 3 partition (for istance, /dev/sda1 for 
primary where to put OS, /dev/sda5 swap and finally /dev/sda2 where you MUST 
set the type to "F0", the PALO's dedicated partition).
When I reboot the system after the first try I red on the monitor: "Hard 
booted" and it hanged. When I correctly partitioned the HDD, install the base 
and rebooted the system, it finally booted up and everything went well!
Did you do the correct steps to partition the HDD, set the partition types 
and so on?
Then did you skip the keyboard configuration during the base installation, as 
mentioned in the previous mals on this ML?
Ste

> I went to the Linux Porters' booth at LinuxTag 2002 in Karlsruhe with
> a 710, but we were not able to install the system. The installer
> booted fine, but it hung when it tried to access the hard drive.
>
> -Hilko
