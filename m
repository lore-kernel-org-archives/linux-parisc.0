Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <B782283A728ED011BBA2006097780D03F2911A@COMA0S04>
From: "Mandachi, Dorin \(Omaha\)" <Dorin.Mandachi@cox.com>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] Another bootstrap test
Date: Mon, 1 Mar 1999 16:26:22 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Resent-Message-ID: <"I8pj01.0.Xm3.5Pmss"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

I apologize for my ignorance, can sbdy give me a few pointers on what I need
to do to load the bootstrap on a 712/100 with no floppy?

Dorin Mandachi



-----Original Message-----
From: Jason Eckhardt [mailto:jason@equator.com]
Sent: Friday, February 26, 1999 5:52 PM
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Another bootstrap test



I would appreciate it if a few people would try out this updated bootstrap
code on their systems (same directions as last time). This is basically
complete, it loads and executes a "dummy" kernel. It has only been tested on
a C160 so far.
This is a debug version and prints a lot of noise. It would be useful if
you would capture the output and email it to me. Or at least send the
numbers 
for:
 P0_IMM_max_mem, P0_BOOTCPU_10msec, P0_COUT_class, P0_CIN_class, and
 P0_BOOTDEV_class.

If it works completely, you'll see a message from the dummy kernel image
folloed by "It is now safe to reboot." Let me know if it makes it that far
on your system.

Thanks, Jason Eckhardt.




-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
