Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <B782283A728ED011BBA2006097780D03F29186@COMA0S04>
From: "Mandachi, Dorin \(Omaha\)" <Dorin.Mandachi@cox.com>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] Bootstrap #3 successful
Date: Wed, 10 Mar 1999 12:15:32 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Resent-Message-ID: <"6v8jy3.0.Jg1.Fggvs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Also successfully booted a 715/100 from SCSI hd. 

Dorin Mandachi



-----Original Message-----
From: Jason Eckhardt [mailto:jason@equator.com]
Sent: Wednesday, March 10, 1999 11:12 AM
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Bootstrap #3 successful



I'm happy to report that bootstrap #3 passed for everyone who reported back
thus far, thanks for taking the time to help out. Network, disk, and even
ZIP drive boots worked. I'd like to see a CD-ROM test if someone has a
CDR drive available.

1) 780/C160       (disk)
2) 715/64         (BOOTP)
3) 816/E35        (disk)
4) 712/100        (disk)
5) 712/100        (SCSI ZIP drive!)
6) 715/33         (RBOOTD) 
7) 715/80         (?disk?)

This means that we now have a simple but functional bootstrap. We are ready
to load a real kernel instead of a dummy one!

Phil Schwan is helping to solve the ftp problems and I will be uploading
the latest working boot sources. I've also added GPL license stubs to
each source file, a mildly detailed README, etc.

Regards,
Jason Eckhardt.

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
