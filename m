Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web5501.mail.yahoo.com (web5501.mail.yahoo.com [216.115.106.184])
	by dsl2.external.hp.com (Postfix) with SMTP id 786CA4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Mar 2001 08:35:27 -0700 (MST)
Message-ID: <20010319153526.9499.qmail@web5501.mail.yahoo.com>
Date: Mon, 19 Mar 2001 07:35:26 -0800 (PST)
From: Robert Liesenfeld <xunil96@yahoo.com>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 735/125 Install Woes
List-ID: <linux-parisc.vger.kernel.org>

Greetings-

I'm trying to get palinux installed on my 735/125.  I've got serial console on it (laptop + serial
cable + minicom), a 4GB SCSI disk installed.  This machine has previously run HP-UX 10.20 just
fine.  When I try to boot either the lifimage I found on the FTP site, or the CD (palinux-0.5 ISO
from the FTP server), I get the following:

High Priority Machine Check (HPMC): Code=1 regs=c0266080 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
... etc ...

I can paste the remainder of the output if it is relevant, but I was hoping there was a simple
explanation for this, even if it is "it won't work, forget it."  :)

As a side note, is there anyone in the palinux community that is successfully running on a 735?

Thanks,

-R

__________________________________________________
Do You Yahoo!?
Get email at your own domain with Yahoo! Mail. 
http://personal.mail.yahoo.com/
