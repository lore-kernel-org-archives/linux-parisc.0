Return-Path: <Jens_Konrad/Linotype/DE@linotype.com>
Received: from mail.linotype.com (www.typomedia.com [213.61.7.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8002B4830
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 15 Apr 2004 13:06:14 -0600 (MDT)
Received: from www.fonts.de (ldap.linotype.com [193.103.125.42])
	by mail.linotype.com (Linotype Mail System) with ESMTP id 4ECDAB417B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 15 Apr 2004 21:06:13 +0200 (CEST)
Received: from domino001.fonts.de (webmail.linotype.com [193.103.125.36])
	by www.fonts.de (Linotype Mail System) with ESMTP id 4F4CB4C0AC
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 15 Apr 2004 21:06:04 +0200 (CEST)
To: parisc-linux@lists.parisc-linux.org
From: Jens_Konrad/Linotype/DE@linotype.com
MIME-Version: 1.0
Date: Thu, 15 Apr 2004 21:04:59 +0200
Message-ID: <OF18825705.F1E7C8A9-ONC1256E77.0068D1BD-C1256E77.0068D3C8@fonts.de>
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problem with SCSI in K-Class
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Hi guys,

I got my K-Class 200 working in single kernel mode, it is booting from high voltage scsi - on the normal scsi I got a CD-Rom and a Streamer.

Now I took away the streamer and replaced it with a 50GB SCSI and booted the machine. During boot he can see the HD without any problems (it is a Seagate), and I can also address it via fdisk (it is
sde).

But when I try to partition it, it comes as far as writing superblocks - and then I get a stack dump and the kernel panics, the machine freezes - and that was it.

My guess is that the low voltage scsi-controller cannot handle the size of the HD - could that be?? Anyone have an idea how I could get the disk to work?? I would really love to use it, since I wanted
to use the K-Class 200 as a file server.

Yours,

Jay
