Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Mon, 08 Feb 1999 23:19:45 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36BFB761.95F3F9D2@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [hppa-linux] egcs / binutils problems
Resent-Message-ID: <"mdpb23.0.pD2.65zls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

I've further narrowed down the problem of egcs / binutils.  It seems
like the x-compiler of egcs is not building libgcc1.a
(which also seems to infer it being built seperately anyhow).  After
building this file by hand, I no longer get the $$divI 
unresolved reference but I do get a:

$global$ unresolved reference.  Does anyone know where this symbol is
made?  Is it an egcs/ld/gas thing?  Someone mentioned earlier that it
might be a SOM convention, but the elf code makes use of it for some
reason.

									- Paul

PS:  Someone mentioned that the divI, etc.. stuff is from libmilli.a on
HP-UX/MkLinux, the egcs build makes it look like a libgcc1.a, where
should this stuff be put?

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
