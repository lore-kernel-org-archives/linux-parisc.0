Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (unknown [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE0EA482C
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 May 2002 10:21:35 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id aercnaaa for parisc-linux@lists.parisc-linux.org; Sat, 4 May 2002 09:20:24 -0700
Date: Sat, 4 May 2002 09:57:40 -0700
From: Randolph Chung <tausq@debian.org>
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
Message-ID: <20020504165740.GN30370@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <15571.50195.280071.792305@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <15571.50195.280071.792305@gargle.gargle.HOWL>
Subject: [parisc-linux] Re: gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
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

> a) 3.1 as to be released (without dwarf2 support)
> b) 3.1 + dwarf2 support
> c) 3.2 CVS 20020429 plus/minus patches

for woody+1, is it an option to skip 3.1 altogether and go directly to
3.2? from what i understand gcc-3.2 is supposed to be officially 
released in the fall...  (i.e. likely before the next release)

i am concerned that between gcc versions, there are often changes in the
C++ (and maybe others) ABI, and moving all of our packages to the new 
version is likely going to be a painful process. If the g++-3.2 ABI is
already frozen (?) and we move directly to it then we may save ourselves
some trouble with doing the repackaging multiple times.

of course there is also the concern that we want to remain at least
somewhat binary compatible with other distributions...

IMHO, for hppa I think a pure option (a) is not feasible for woody+1. 
The long branch problem by itself is something that I feel needs to 
be addressed as soon as possible. Also I'm eager to have working
exceptions support for c++ :-)

Oh, by the way, when we move woody to gcc-3.[12] as the default, will we
still have gcc-3.0 packages available?

randolph
