Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.sporbeck-family.de (pD9E1DC06.dip.t-dialin.net [217.225.220.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3975F482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Jul 2003 09:18:04 -0600 (MDT)
Received: from [192.168.100.101] (helo=sporbeck-family.de)
	by mailhost.sporbeck-family.de with esmtp (Exim 4.14)
	id 19bMAQ-0000Yf-VN
	for parisc-linux@lists.parisc-linux.org; Sat, 12 Jul 2003 17:20:06 +0200
Message-ID: <3F102709.10403@sporbeck-family.de>
Date: Sat, 12 Jul 2003 17:19:37 +0200
From: Jan Sporbeck <jan_lists@sporbeck-family.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] eisa configuration howto?
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

Hello,
Iam trying to get an additional esia scsi controller to work on my 
9000/801/d200.

But i am stuck with the eisa configuration.
Where do I register eisa cards?
-Ive only done that on intel before, there was an userspace programm..


while booting, I get:

EISA slot 1: HWP0C80 EISA IRQ 3 memory fc0d8000-fc0e0000
EISA slot 2 id mis-match: got ADP7771 expected ___FFFF

the controler is in slot 2.

Is there any linux/ parisc eisa howto?

what am I missing?


thanks,
jan.
