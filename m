Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F381E4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Apr 2003 07:24:13 -0600 (MDT)
Message-Id: <200304171324.h3HDO5AY029238@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: c++/10235: [3.3 regression] [HPPA] internal compiler error: in final_scan_insn, at final.c:2099
To: tausq@debian.org
Date: Thu, 17 Apr 2003 09:24:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: doko@gcc.gnu.org, debian-gcc@lists.debian.org,
	gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org, nobody@gcc.gnu.org,
	parisc-linux@lists.parisc-linux.org, gcc-gnats@gcc.gnu.org,
	danglin@gcc.gnu.org
In-Reply-To: <20030417061958.GU25257@tausq.org> from "Randolph Chung" at Apr 16, 2003 11:19:58 pm
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

> Maybe the test case needs fixing :) Dave, I'll put a preprocessed file
> in gsyprf11:~tausq/f_nurbs.ii.gz. It's >100k so i won't post it here 
> for now.  :)

Both the testcase and f_nurbs.ii compiled successfully using the following
command:

/home/dave/opt/gnu/gcc/gcc-3.3/bin/g++ -O2 -g -c -fPIC -fno-implicit-templates f_nurbs.ii

The above version of g++ has the sibcall argument fix installed yesterday.
However, I doubt that this fixed the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
