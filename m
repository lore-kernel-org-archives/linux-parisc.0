Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp008pub.verizon.net (smtp008pub.verizon.net [206.46.170.187])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A295482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Nov 2001 00:02:16 -0700 (MST)
Received: from verizon.net (pool-151-201-224-254.pitt.east.verizon.net [151.201.224.254])
	by smtp008pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id fAD72DD01186
	Tue, 13 Nov 2001 01:02:13 -0600 (CST)
Message-ID: <3BF0C5D6.2040205@verizon.net>
Date: Tue, 13 Nov 2001 02:03:50 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems of instaling (booting) on a 715/75
References: <2451.011113@nikom.tagil.ru>
Content-Type: text/plain; charset=KOI8-R; format=flowed
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

I'd suggest you boot the cd image (palinux-0.9.2.iso) using the serial 
console. I have the same system and the STI console does not work with 
that cd.

As soon as you have a minimal system running, switch the kernel image in 
/boot for this one:

	ftp://ftp.parisc-linux.org/kernels/vmlinux-32-20011008

Edit the /etc/palo.conf accordingly, re-run palo and reboot. I 
experienced scsi problems with the kernel in the cd image.
-- 
      Rafael
