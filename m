Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Wed, 10 Feb 1999 22:28:07 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36C24E47.8DBE718B@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [hppa-linux] egcs code generation problem
Resent-Message-ID: <"QFyqv3.0.D-2.wXcms"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

I believe I've found the cause of problems with the $global$ symbol
problem.  Curiously, the $global$ symbol is
properly defined in the MkLinux libgcc.a which led me to try and
indentify the differences between the two systems.
egcs currently builds the libgcc.a bin as -fPIC which seems to omit a
bunch of code from the libgcc.a library.

								- Paul

PS: Thanks to Pablo@LinuxNet for giving me assembler dumps to compare
between both systems.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
