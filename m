Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A5D4488C
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 11:53:00 -0600 (MDT)
Message-Id: <200207121752.g6CHqvRY018027@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem building gcc-3.2 (cvs head) on hppa-linux
To: randolph@tausq.org
Date: Fri, 12 Jul 2002 13:52:56 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: gcc@gcc.gnu.org, parisc-linux@parisc-linux.org
In-Reply-To: <20020712165616.GA8724@tausq.org> from "Randolph Chung" at Jul 12, 2002 09:56:16 am
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

> > Yes.  This is one of the manifestations of the the long call bug
> > in 3.0.4.  You need to use "-O2" in STAGE1_CFLAGS to work around
> > it or use gcc 3.1 later as a bootstrap compiler.  You will have
> > the same problem if you try to rebuild 3.0.x.  There is a silent
> > miscompilation of expr.c if I remember correctly.
> 
> with gcc-3.1 as bootstrapping compiler:

Oops, only 3.2 has the long jump fix.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
