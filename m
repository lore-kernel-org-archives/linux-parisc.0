Return-Path: <hppa-linux@thepuffingroup.com>
Date: Thu, 11 Mar 1999 16:35:15 -0600
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199903112235.QAA05851@equator.com>
To: hppa-linux@thepuffingroup.com
Subject: [hppa-linux] Boot #4 and source on ftp site
Resent-Message-ID: <"3RIsy2.0.Ei1.XH4ws"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org


Boot test #4: This is essentially the same code as #3 but I have taken
out some delays, modified the cache flush routines, and turned
verbose (debug) mode back on. I want to make sure that not having the delays
makes no difference and that no characters get dropped when there is a lot
of text (as in debug mode). Please let me know if the test still passes
as before. Hopefully this will be the last test for a while. Kernel work
comes next.

I have uploaded the binary as well as a new source drop to the ftp site. The
source is now GPL'd and a detailed README is included which gives an overview
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
