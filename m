Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F780482F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 09:08:36 -0700 (MST)
Message-Id: <200203121608.g2CG8US7009844@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] dynamic loader problem
To: randolph@tausq.org
Date: Tue, 12 Mar 2002 11:08:29 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020312060134.GH730@tausq.org> from "Randolph Chung" at Mar 11, 2002 10:01:34 pm
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

> Dave, FYI I upgraded a bunch of stuff on gsyprf11.... let me know if you
> see any new breakage. In particular I think bash should be in better
> shape now.

The biggest issue on gsyprf11 is the filling of the log file with page
faults.  I've more or less given up running the gcc testsuite because
expect almost always seems to get into a state where it causes an
enormous number of page faults and then hangs when when the /var
file system is full.  I have noticed that various pthread test
programs in the libstdc++ testsuite also cause many page faults.
It's possible this problem is specific to 64-bit machines.

There haven't been as many random seg faults recently.

Has anybody worked on the various "dl-" routines in glibc/sysdeps/hppa
recently?  That's probably where the dynamic loader problem lies.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
