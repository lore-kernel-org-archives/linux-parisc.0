Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DD2E482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 May 2003 16:59:54 -0600 (MDT)
Message-Id: <200305122259.h4CMxqqS003603@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc and -march=2.0 flag bug
To: gmsoft@gentoo.org (Guy Martin)
Date: Mon, 12 May 2003 18:59:52 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200305122351.57449.gmsoft@gentoo.org> from "Guy Martin" at May 12, 2003 11:51:57 pm
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

> In case of a bug, what do you need to debug it.

See <http:/gcc.gnu.org/bugs.html>.  A GCC PR should be submitted
if you believe the problem is a compiler bug.

Versions earlier than 3.3 are effectively dead, so I would recommend
testing with a 3.3 snapshot.  3.3 will be released very soon, probably
this week.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
