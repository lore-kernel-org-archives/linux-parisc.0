Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from out005pub.verizon.net (out005pub.verizon.net [206.46.170.105])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A01E482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 08:54:52 -0700 (MST)
Message-ID: <3C3F0ADA.3060504@verizon.net>
Date: Fri, 11 Jan 2002 10:55:06 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Cc: deb@thepuffingroup.com, marteaut@esiee.fr
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Correction for the PA-RISC/Linux Boot HOWTO at ESIEE's web site.
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

I'm booting a 715/80 workstation using a PC with SuSE 7.2. Trying to 
follow the examples to configure bootp/tftp at

http://mkhppa1.esiee.fr/parisc-linux-boot/parisc-linux-boot/preparation.html

I could not get it to boot.

This distribution sets the daemons as follows:

tftp    dgram  udp  wait  root  /usr/sbin/tcpd  in.tftpd -s /tftpboot
bootps  dgram  udp  wait  root  /usr/sbin/bootpd  bootpd -c /tftpboot

This a chroot setup, so the example /etc/bootptab in the web page will 
not work.

The configuration that worked for me is the following:

parisc:hd=/:\
                 :ht=ethernet:\
                 :ha=0800093BF206:\
                 :ip=192.168.0.8:\
                 :bf=lifimage:\
                 :sm=255.255.0.0:\
                 :to=7200:

Where the bootable kernel image was the lifimage created using "make 
palo" (The web page description is ambiguous as to what image to use: 
vmlinux or lifimage)

Also the purpose of the parameter "rp" in the example bootptab is not 
clear in the example. Its purpose is to specify a root filesystem to 
mount, but the lifimage has that parameter set from palo Makefile.

-- 
      Rafael
