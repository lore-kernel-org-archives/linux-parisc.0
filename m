Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65A46482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 13:16:51 -0600 (MDT)
Message-Id: <200305131916.h4DJGnpg007743@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.3 and c++
To: randolph@tausq.org
Date: Tue, 13 May 2003 15:16:49 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030513181805.GF548@tausq.org> from "Randolph Chung" at May 13, 2003 11:18:05 am
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

> > As I mentioned, the 3.2 branch is closed for bug fixes.  The failure
> > doesn't occur with 3.3.  It has a number of -march=2.0 fixes.  The
> > problem could be C++ related as well.  There are a huge number of C++
> > fixes in 3.3 relative to 3.3.
> 
> Reading this inspired us to try compiling the 'menu' debian package 
> with g++-3.3. Historically this package has been very problematic on
> hppa because of its use of exceptions. It's been broken for a very long
> time (couple years?).... but with latest g++-3.3 it actually compiles 
> and works!!

I should also add that I've built lyx, another large C++ app, under
hpux and it seems to work.  I've also built it under linux but I
haven't tested it (no X).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
