Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA08390
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 13:17:05 -0700
Message-Id: <199911162018.NAA15083@debian.fc.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Today's boot experience on a 735 
In-reply-to: Your message of "Tue, 16 Nov 1999 14:58:07 EST."
             <199911161958.OAA01327@hiauly1.hia.nrc.ca>
Date: Tue, 16 Nov 1999 13:18:20 -0700
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= This is a transcript of the boot messages on a 735 using the default
= CVS config:
= 
= kernel(0x0000001), 0x04DFF870, 0x04DFF900, 0x00016A70)
= Clear BSS 0x00118470-->0x0012FA80
= Boot loader: HP-UX ISL
= Warning realmode_setup.c *guessing* where free mem starts!
= realmode_setup exiting.
= 
= This is better than yesterday when there was no output.  The BSS
= region looks ok.  HP-UX ISL is correct.  The address of _end in the
= vmlinux object looks reasonable:
= 
= _end                |0xc012fa80|extern|data   |$DLT$
= 
= Why does realmode_setup have to guess where free mem starts?

The _end symbol is not a reliable indicator of where
the kernel's memory ends.  And the hpux
bootloader doesn't provide the SOM header from whence this could
theoretically be calculated.  I haven't tried out the _end trick
posted last week, but it looks like it'll work (don't call the symbol
_end if you try it).  As long as your kernel links, the guess is
probably OK for now.

	-P
