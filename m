Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Sun, 07 Feb 1999 19:37:50 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36BE31DE.FEA80D5C@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [hppa-linux] egcs-1.1.1 xcompile
Resent-Message-ID: <"ipcjU2.0.TM.4pals"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

After adding suppor to egcs-1.1.1 for hppa1.1-hp-linux, I 
built the x-compiler.  Everything goes fine until it tries to build
libgcc2.a

  At this point, there is some code (I assume from libgcc2.c) which
puts "opcode arg,arg,arg    ; comment" style comments which confuses
as (it thinks "; comment" is an opcode).  I'm gonna go look to see
if I can do a quick patch to fix this.  Other than that, the
compiler seems to work fine with little or no patchings (beyond
support for hppa1.1-hp-linux)

					- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
