Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Mon, 08 Feb 1999 20:02:26 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Sender: pjlahaie@sims-ha.videotron.net
To: "hppa-linux@puffingroup.com" <hppa-linux@puffingroup.com>
Message-id: <36BF8922.9A45A67B@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [hppa-linux] egcs-1.1.1 cvs
Resent-Message-ID: <"RDoB82.0.B62.MCwls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

I've put egcs 1.1.1 in the tree (w/ egcs hppa1.1 patch).
You can do a checkout as follows:

cvs -d :pserver:anonymous@burrow.puffingroup.com:/home/cvs/cvsroot
checkout hppa-linux/egcs

(You'll have to login first with a blank password)

   I haven't managed to get a full build since I'm having problem with
gas and gld.  I'll be putting them in
the cvs next under hppa-linux/binutils.

   I'll post a status report shortly with the current egcs/gld/gas
problem.

								- Paul

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
