Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnmg1.net.external.hp.com (bbnnmg1.net.external.hp.com [155.208.254.184])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7D29482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Jun 2001 17:14:53 -0600 (MDT)
Received: from isoit213.bbn.hp.com (isoit213.bbn.hp.com [15.136.193.32])
	by bbnmg1.net.external.hp.com (Postfix) with ESMTP id 64AD89B6
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Jun 2001 01:14:52 +0200 (METDST)
Received: from aare.GVA.HP.COM (aare.gva.hp.com [15.152.18.77])
	by isoit213.bbn.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit6.0.6 OpenMail) with SMTP id BAA11855
	for <parisc-linux@lists.parisc-linux.org>; Fri, 8 Jun 2001 01:14:44 +0200 (METDST)
Message-ID: <733CA39D4982D411AD080090278CBE390CD8D2@shalom.israel.hp.com>
From: "KIMHI,YEHOSHUA (HP-Israel,ex1)" <yehoshua_kimhi@hp.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 8 Jun 2001 01:14:43 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Installation of palinux-0.9-32serial.iso
List-ID: <linux-parisc.vger.kernel.org>


-----Original Message-----
From: parisc-linux-announce-admin@lists.parisc-linux.org
[mailto:parisc-linux-announce-admin@lists.parisc-linux.org]
Sent: Thursday, June 07, 2001 6:20 PM
To: yehoshua_kimhi@hp.com
Subject: parisc-linux-announce request rejected


Your request to the parisc-linux-announce mailing list:




Hi there,

I am trying to install the palinux-0.9-32serial.iso 715/G machine with
serial console.
The machine boot from the CD but at the stage of the packages installation
it fail 
It claim that the packages are corrupted.
I tried to use the shell and mount the file system /dev/sda3. Then I copied
the whole CDROM to this file system.
Then I tried to install the base from this mountable file system.
It fail on the first package claiming that it can't download 'adduser'
package.
I don't have any other linux machine around so I can't use the NFSROOT
option (I mean follows the NFS-root-howto and compilation of new kernel with
the IP of NFS server etc..)
I do have around hp-ux machines, Is there a way to compile kernels on hp-ux?
Is there a way to continue from this stage??
Maybe install in some way the NFS and then mount file system which contain a
tarball of nfsroot??
Any other suggestion workarounds etc.. will be most helpful.

Regards,

shuki
**********************************************
Yehoshua Kimhi
ERC
Hewlett-Packard Israel
Email: yehoshua_kimhi@hp.com Telnet: 7810-527
Tel.: +972-3-5380527 Fax: +972-3-5380515 
**********************************************
