Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C6E44837
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 May 2002 11:54:12 -0600 (MDT)
Message-Id: <200205041754.g44Hs8it027911@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
To: tausq@debian.org
Date: Sat, 4 May 2002 13:54:07 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: doko@cs.tu-berlin.de, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
In-Reply-To: <20020504165740.GN30370@tausq.org> from "Randolph Chung" at May 4, 2002 09:57:40 am
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

> i am concerned that between gcc versions, there are often changes in the
> C++ (and maybe others) ABI, and moving all of our packages to the new 
> version is likely going to be a painful process. If the g++-3.2 ABI is
> already frozen (?) and we move directly to it then we may save ourselves
> some trouble with doing the repackaging multiple times.

I know that there are some small ABI changes between libstdc++ 3.1 and
3.2.  This got mentioned in discussion of a PR that I filed concerning
the library under hpux.  Under hpux, all applications that were linked
against the 3.0 library needed to be relinked when the 3.0.1 library
was installed :-(

I still haven't figured out why libstdc++ needs to be installed prior
to running the testsuite.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
