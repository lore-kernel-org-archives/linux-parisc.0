Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA18382
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Dec 1999 14:32:14 -0700
Message-Id: <199912232134.OAA07313@rascal.fc.hp.com>
To: MaShaun Jones <mkj@mkj.cb.lucent.com>
Cc: Matthew Wilcox <willy@thepuffingroup.com>, bkatz@agilent.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] How to set serial console on 712 (fwd) 
In-reply-to: Your message of "Thu, 23 Dec 1999 15:19:48 MST."
             <Pine.BSF.4.10.9912231519330.638-100000@mkj.cb.lucent.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 23 Dec 1999 14:34:45 -0700
From: Matt Taggart <taggart@rascal.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


MaShaun Jones writes...

 >Is there a way to use a serial console with a 715 however?

As someone mentioned previously, just unplug the keyboard. Almost all HP-PA 
workstations will go to serial if they can't find a keyboard. The only one 
I know of that doesn't is the 712. If you want to force an HP-PA 
workstation to serial(even if a keyboard is plugged in) then set the 
console path in the firmware. It varies by machine but it's usually pretty 
easy. The "help" command should give you an example for the machine you're 
on. The 712 was purposely obfuscated so people wouldn't use serial console.

-- 
Matt Taggart
taggart@fc.hp.com
