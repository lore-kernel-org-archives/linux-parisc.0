Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailrelay1.inwind.it (unknown [212.141.54.101])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C0C8482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Jun 2001 03:25:02 -0600 (MDT)
Received: from mail.inwind.it (62.98.87.81) by mailrelay1.inwind.it (5.5.029)
        id 3B16682000300F86 for parisc-linux@lists.parisc-linux.org; Tue, 19 Jun 2001 11:25:00 +0200
Date: Tue, 19 Jun 2001 11:26:43 +0200
From: "E . Pavletic" <Enzo.Pavletic@guest.arnes.si>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010619112643.A853@gorica.go.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] palinux-0.9-32serial.iso install problems on a 753/99
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I'm trying to install the palinux-0.9-32serial.iso image from cdrom on my
735, but I run into troubles when the process reaches the point of the
installation of the base system: it hangs. If I try to run the command
"debootstrap sid /target file:/instmnt/debian" manually, I receive the
following messages:

..
I: Retrieving file:/instmnt/debian/dists/unstable/main/binary-hppa/base/util-linux_2.11b-5_hppa.deb
I: Retrieving file:/instmnt/debian/dists/unstable/main/binary-hppa/base/whiptail_0.50.17-6_hppa.deb
I: Extracting required packages
tar: ./usr/share/doc/libperl5.6: Cannot create symlink to 'perl-base':
Input/output error
tar: Error exit delayed from previous errors

Can anyone help me?
enzo
