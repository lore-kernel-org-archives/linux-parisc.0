Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <7DB180A629C1D211869F00A0C9F44A8C1805@retro-mail.fish.retrotech.com>
From: "Muench, David" <dmuen@retrotech.com>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] Boot #4 and source on ftp site
Date: Fri, 12 Mar 1999 09:23:58 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Resent-Message-ID: <"Iv8sb.0.uB5.3DIws"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org


Worked great again on my 715/80 off a scsi disk.

---
David Muench - Project System Administrator
Retrotech, Inc. - http://www.retrotech.com/



-----Original Message-----
From: Jason Eckhardt [mailto:jason@equator.com]
Sent: Thursday, March 11, 1999 5:35 PM
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Boot #4 and source on ftp site



Boot test #4: This is essentially the same code as #3 but I have taken
out some delays, modified the cache flush routines, and turned
verbose (debug) mode back on. I want to make sure that not having the delays
makes no difference and that no characters get dropped when there is a lot
of text (as in debug mode). Please let me know if the test still passes
as before. Hopefully this will be the last test for a while. Kernel work
comes next.

I have uploaded the binary as well as a new source drop to the ftp site. The
source is now GPL'd and a detailed README is included which gives an
overview
of the boot code operation. This source supersedes any previous source you
may have laying around.

ftp from sod.res.cmu.edu:/pub/parisc/hilo
  boot_rel_0.2.tar.gz        The latest source code and documentation.
  bootstrap_4.bin.gz         Bootstrap binary #4. 

Regards, 
Jason Eckhardt.

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
