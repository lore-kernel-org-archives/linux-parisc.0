Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Mon, 08 Feb 1999 20:58:02 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36BF962A.5E209589@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [hppa-linux] binutils in the cvs
Resent-Message-ID: <"yFTq72.0.SA2._1xls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

As my previous message stated, binutils 2.9.1 has been checked into
the cvs with
support for hppa1.1-hp-linux.  It currently does not work as a
cross-compiler
(or as a normal compiler that is) due to a problem with linking.  The
following
error happens on a cross-compile of egcs.

/usr/hppa-linux/hppa1.1-hp-linux/bin/ld: can not size stub section: Bad
value
/usr/hppa-linux/hppa1.1-hp-linux/bin/ld: warning: cannot find entry
symbol $START$; defaulting to 00002000
libgcc1-test.o: In function `mainCRTStartup':
/home/pjlahaie/src/hppa/egcs/gcc/../../hppa-linux/egcs/gcc/libgcc1-test.c:106:
undefined reference to `$$divI'
collect2: ld returned 1 exit status

     Any help would be greatly appreciated.

								- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
