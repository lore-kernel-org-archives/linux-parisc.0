Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA09925
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 02:59:05 -0700
Sender: marteaut@esiee.fr
Message-ID: <3A2E0F6B.F03B2BA@esiee.fr>
Date: Wed, 06 Dec 2000 11:05:31 +0100
From: Thomas Marteaut <marteaut@esiee.fr>
MIME-Version: 1.0
To: Puffin Group <parisc-linux@thepuffingroup.com>,
        ESIEE Puffin <puffin@esiee.fr>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Sorry
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	I am sorry for the last message. It should have been an internal mail
(That's why it's in French). I am also sorry
for the attached files. Nevertheless, we are dealing with the new source
and we are looking at how do B132 and 712 boot.
So,

sti+frame shows the dmesg of 712 for our kernel that supports STI
console and framebuffer. That's why we have two searches for sti memory
space but they are different!
Helge, you can notice that now, on our 712, led DISPLAY is at
0x00000000! 

sti+frame_B132 shows the dmesg for the same kernel but with a B132+
workstation.

And the RTC does print Cannot access the Hardware Clock via any method
on both machines!

	Again, I am sincerely sorry for the message but I hope this one will
help...

Bye, Thomas
ESIEE Team
