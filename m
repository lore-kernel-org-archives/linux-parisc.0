Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 783774845
	for <parisc-linux@parisc-linux.org>; Mon, 25 Feb 2002 20:53:50 -0700 (MST)
Received: from eiger.apptechsys.com (ats198.apptechsys.com [207.14.35.198])
	by mail.apptechsys.com (Postfix) with ESMTP id D77BF7BC4B
	for <parisc-linux@parisc-linux.org>; Mon, 25 Feb 2002 19:53:40 -0800 (PST)
Date: Mon, 25 Feb 2002 19:53:40 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33L2.0202251907560.6941-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc (g++) problem
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

As you may remember from my last question, I'm having some problems
building some code on parisc-linux.  I have been able to reproduce the
problem using a more simple program.

Here's the problem.  This program segfaults when compiled with -fPIC, as
required to build a .so.  It is fine when compiled without -fPIC.  It is
also fine on intel platform with both.  Is there something wrong with the
code that I'm not seeing, or is this a compiler bug?  I have tried this
with gcc-3 on an intel box, and it is fine, so I assume it is this port?

Thanks for your help...

g++ -g -o test -fPIC test.cpp

---- test.cpp ----
#include <stdio.h>

class Foo
{
public:
	Foo(const char * const blah);
	unsigned char* text;
};
Foo::Foo(const char * const blah)
{
	text=(unsigned char *)blah;
}

const Foo test("Blah");
int main()
{
	printf("%s\n", test.text);
	return 0;
}



-- 
Advertisements contain the only truths to be relied on in a newspaper.
		-- Thomas Jefferson
