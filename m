Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4AE004831
	for <parisc-linux@parisc-linux.org>; Sun, 21 Apr 2002 11:05:20 -0600 (MDT)
Message-Id: <200204211705.g3LH5HMn023230@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unofficial gdb deb on ftp site
To: tausq@debian.org
Date: Sun, 21 Apr 2002 13:05:17 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020421035952.GI7563@tausq.org> from "Randolph Chung" at Apr 20, 2002 08:59:52 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I see that Dave has changed hppa-gcc from using stabs to using dwarf2 in
> gcc 3.2, so things might be quite different once we move to gcc 3.2...

That wasn't me.  I believe it was Alan.  This is also the case for 3.1.
What I did was fix the generation of frame notes in the prologue so that
the dwarf2 EH code works.  this is mainly for C++.  I'm not sure whether
gdb uses this information although it could.  You can always use "-gstabs"
to get stabs debugging information.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
