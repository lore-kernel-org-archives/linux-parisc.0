Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA08138
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 12:56:41 -0700
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.9.3/8.9.3) id OAA01327
	for parisc-linux@thepuffingroup.com; Tue, 16 Nov 1999 14:58:08 -0500 (EST)
Message-Id: <199911161958.OAA01327@hiauly1.hia.nrc.ca>
To: parisc-linux@thepuffingroup.com
Date: Tue, 16 Nov 1999 14:58:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Today's boot experience on a 735
List-ID: <linux-parisc.vger.kernel.org>

This is a transcript of the boot messages on a 735 using the default
CVS config:

kernel(0x0000001), 0x04DFF870, 0x04DFF900, 0x00016A70)
Clear BSS 0x00118470-->0x0012FA80
Boot loader: HP-UX ISL
Warning realmode_setup.c *guessing* where free mem starts!
realmode_setup exiting.

This is better than yesterday when there was no output.  The BSS
region looks ok.  HP-UX ISL is correct.  The address of _end in the
vmlinux object looks reasonable:

_end                |0xc012fa80|extern|data   |$DLT$

Why does realmode_setup have to guess where free mem starts?  Oh, I
think the name of realmode_setup has changed.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
