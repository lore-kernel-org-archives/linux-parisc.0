Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA25820
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 11:35:36 -0700
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: "Steve Moret" <smoret@uci.edu>
Subject: Re: [parisc-linux] HP 9000/735-125
Date: Thu, 30 Nov 2000 19:37:46 +0100
Cc: parisc-linux@thepuffingroup.com
References: <FKEGLIIBOIACJOCCAFIMIEFGCCAA.smoret@uci.edu>
In-Reply-To: <FKEGLIIBOIACJOCCAFIMIEFGCCAA.smoret@uci.edu>
MIME-Version: 1.0
Message-Id: <00113019374604.00309@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Thursday 30 November 2000 18:50, Steve Moret wrote:
> With the BiDirectional stuff back in it dies here:
>
> Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
> POSIX conformance testing by UNIFIX
> ASP version 20 at 0xf0800000 found.
> LED (ASP-style) display at f0800020
> parport_gsc.c: initialize bidirectional-mode
>
[oops msg deleted]

Yup, that was what I thought !
I will try to come up with a clean fix in the next few hours...

>
> And it appears that the LEDs work, however I'm not familiar enough with
> them to know what they all mean or if they should or should not blink,
> glow, or cause alarming amounts of pain to those who walk by.

The current code should let your heartbeat-LED blink two times per second and 
LAN-TX, LAN-RCV and DISK-IO-LED should blink each after another...

Greetings,

	Helge
