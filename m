Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp2.libero.it (smtp2.libero.it [193.70.192.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id B31B74829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Apr 2003 09:05:15 -0600 (MDT)
Message-ID: <29d101c30685$140bcac0$15472597@bagio>
From: "Giovanni Bajo" <giovannibajo@libero.it>
To: <gcc-gnats@gcc.gnu.org>, <parisc-linux@lists.parisc-linux.org>,
	<tausq@debian.org>, <gcc-bugs@gcc.gnu.org>,
	<debian-gcc@lists.debian.org>, <nobody@gcc.gnu.org>,
	<gcc-prs@gcc.gnu.org>
Cc: "Wolfgang Bangerth" <bangerth@ices.utexas.edu>
Date: Sat, 19 Apr 2003 17:05:11 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Re: c++/10438: [3.3 regression] [hppa] Segfault when building jade
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

http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&p
r=10438

Confirmed. Slightly reduced testcase:

--------------------------------
struct Foo
{
    struct Nested1
    {
        enum E
        {
            v1,v2,v3,v4,v5,v6
        } E;
    };

    struct Nested2 : public Nested1
    {};
};

--------------------------------
pr10438.cpp:12: internal compiler error: Segmentation fault
Please submit a full bug report,


It looks like a memory corruption bug, while playing with it I had the ICE
on and off simply by changing variable names. You can also see that the ICE
disappears if you remove some elements from within the enum. It seems that
the culript is the variable defined with the same name of the enum type.

It's a regression on 3.3 and 3.4 with respect to 3.2, where it compiles
fine.

Giovanni Bajo
