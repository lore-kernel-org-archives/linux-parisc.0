Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.riverrock.org (rrc.dsl.frii.net [216.17.137.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id A22B7485E
	for <parisc-linux@parisc-linux.org>; Tue,  2 Oct 2001 08:38:39 -0600 (MDT)
Received: from bame.riverrock.org (bame.riverrock.org [199.254.238.240])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id IAA29698
	for <parisc-linux@parisc-linux.org>; Tue, 2 Oct 2001 08:38:38 -0600
Received: from riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15oQgw-000P0fC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <parisc-linux@parisc-linux.org>; Tue, 2 Oct 2001 08:38:38 -0600 (MDT)
Message-Id: <m15oQgw-000P0fC@bame.riverrock.org>
To: parisc-linux@parisc-linux.org
Date: Tue, 02 Oct 2001 08:38:38 -0600
From: Paul Bame <bame@riverrock.org>
Subject: [parisc-linux] Bug#114145: needed for CD building, but lower Priority to normal (fwd)
List-ID: <linux-parisc.vger.kernel.org>

More info on the palo thing

------- Forwarded Message

Return-Path: debbugs@master.debian.org
Delivery-Date: Tue Oct  2 02:30:16 2001
Return-Path: <debbugs@master.debian.org>
Received: from localhost (really [127.0.0.1]) by bame.riverrock.org
	via smail with esmtp
	id <m15oKwQ-000P0dC@bame.riverrock.org> (Debian Smail3.2.0.111)
	for <bame@localhost>; Tue, 2 Oct 2001 02:30:14 -0600 (MDT) 
Received: from mail.riverrock.org [199.254.238.2]
	by localhost with IMAP (fetchmail-5.9.0)
	for bame@localhost (single-drop); Tue, 02 Oct 2001 02:30:14 -0600 (MDT)
Received: from master.debian.org (mail@master.debian.org [216.234.231.130])
	by www.riverrock.org (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id CAA15523
	for <bame@riverrock.org>; Tue, 2 Oct 2001 02:28:05 -0600
Received: from debbugs by master.debian.org with local (Exim 3.12 1 (Debian))
	id 15oKkf-0008Lq-00; Tue, 02 Oct 2001 03:18:05 -0500
Subject: Bug#114145: needed for CD building, but lower Priority to normal
Reply-To: Gerfried Fuchs <alfie@ist.org>, 114145@bugs.debian.org
Resent-From: Gerfried Fuchs <alfie@ist.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: Paul Bame <bame@debian.org>
Resent-Date: Tue, 02 Oct 2001 08:18:05 GMT
Resent-Message-ID: <handler.114145.B114145.100201020831617@bugs.debian.org>
X-Debian-PR-Message: report 114145
X-Debian-PR-Package: palo
X-Debian-PR-Keywords: 
X-Loop: owner@bugs.debian.org
Received: via spool by 114145-submit@bugs.debian.org id=B114145.100201020831617
          (code B ref 114145); Tue, 02 Oct 2001 08:18:05 GMT
Date: Tue, 2 Oct 2001 10:09:54 +0200
From: Gerfried Fuchs <alfie@ist.org>
To: 114145@bugs.debian.org
Message-ID: <20011002100954.A6116@asgard.priv.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.3.22i
Mail-Copies-To: nobody
X-Editor: Vi Improved <http://www.vim.org/>
X-Signature-Color: cyan
X-Signature-Prg: sigd/0.8.2 (Perl) <http://alfie.ist.org/sigd/>
Delivered-To: 114145@bugs.debian.org
Resent-Sender: Debian BTS <debbugs@master.debian.org>

        Hi!

 palo is needed for building the official CD set to be installable for
parsic/hppa.  That's why it is needed on i386.  Only thing that should
be changed is the Priority:  important there makes it install on
default - but on the other hand one installing parsic/hppa would have it
installed from the CD nevertheless - and one having an other
architecture shouldn't be bothered with it nevertheless.

 Mabe a trim in the Architecture string to include just the needed ones
should be thought of, too.  Is there need to have it on sparc, powerpc,
s390 and so on?  I don't think so, but you (the maintainer, not the bug
reporter ;) might know reasons.

 Thanks for the attention,
Alfie
- -- 
 You never learn anything  |   /"""""\                   ,'~~.
   by doing it right.      |  / chaos \  alfie.ist.org   |o ?~\
           -- unknown      |  \inside!/  alfie@ist.org  /_   ~<\
                           |   \_____/                   \__,~ \>

------- End of Forwarded Message
