Return-Path: <hppa-linux@thepuffingroup.com>
Date: Wed, 10 Mar 1999 11:11:41 -0600
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903101711.LAA30694@equator.com>
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Bootstrap #3 successful
Resent-Message-ID: <"AiPys1.0.uY1.zRgvs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org


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
