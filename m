Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA04635
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Nov 1999 10:03:31 -0700
Message-Id: <199911231705.KAA24125@debian.fc.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress 
In-reply-to: Your message of "Tue, 23 Nov 1999 11:33:03 EST."
             <199911231633.LAA03575@hiauly1.hia.nrc.ca>
Date: Tue, 23 Nov 1999 10:05:02 -0700
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > Unfortunately the strings are stored
= > in low-ish physical RAM which is overwritten when the our kernel is
= > loaded.  If we want the hpux command line badly enough, we'll have
= > to load the kernel at a higher physical location.  It could then
= > be copied to 0x10000 after we collect the command line.  
= 
= How much higher do you think is necessary?  Hpux seems to use 0x11000.

I seem to recall 0x21xxx was where the strings were stored but my
memory is fallable, and printfs are easy to insert into the #if-0-ed
section (#if-1 it too...).  This is probably the "free" area at the
end of the hpux boot loader.  I think the boot loader text+data size
cannot exceed 256k (0x40000), plus maybe 64k (0x10000) for BSS and
heap, plus the 64k unusable at 0, so maybe 0x60000
would be a good conservative spot?

	-P
