Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A6C7D482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jan 2002 12:11:08 -0700 (MST)
Message-Id: <200201131911.g0DJB3b2013360@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc bug
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sun, 13 Jan 2002 14:11:03 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: phi@hpfrcu81.france.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020113173658.739E6482A@dsl2.external.hp.com> from "Grant Grundler" at Jan 13, 2002 10:36:58 am
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

> phi 4369 wrote:
> > Where should I submit this?

File it in gnats:
<http://gcc.gnu.org/cgi-bin/gnatsweb.pl>.

The more information that you can provide the better.  One of the first
things to do is generate preprocessed source, then run cc1 under a
debugger to find where the segementation fault occurred.

> > since it happen on a palinux box I dunno if the
> > gcc maitainer does have such a box?

However, I don't yet have a working palinux system and neither does
Jeff Law as far as I am aware.  If the problem is generic, then with
luck it can be fixed fairly easily.  However, the odds are that the
problem is specific to palinux.

One of the problems that we face is that the deb version of gcc has
been quite heavily hacked for parisc-linux, and thus it isn't supportable.
I hope that we can get one of the standard releases or the mainline code
working as soon as possible.  There are still problems with gdb and
binutils on palinux (eg., passing floats in dynamic calls, etc).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
