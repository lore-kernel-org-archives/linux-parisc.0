Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sources.redhat.com (sources.redhat.com [66.187.233.205])
	by dsl2.external.hp.com (Postfix) with SMTP id 2461D4879
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 21:37:25 -0700 (MST)
Date: 18 Mar 2003 04:37:24 -0000
Message-ID: <20030318043724.6836.qmail@sources.redhat.com>
To: debian-gcc@lists.debian.org, gcc-bugs@gcc.gnu.org,
	gcc-prs@gcc.gnu.org, jason@gcc.gnu.org,
	parisc-linux@lists.parisc-linux.org, tausq@debian.org
From: jason@gcc.gnu.org
Reply-To: jason@gcc.gnu.org, debian-gcc@lists.debian.org,
	gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org, jason@gcc.gnu.org,
	parisc-linux@lists.parisc-linux.org, tausq@debian.org,
	gcc-gnats@gcc.gnu.org
Subject: [parisc-linux] Re: c++/10091: [3.3 regression] [parisc] ICE in cp_expr_size, at cp/cp-lang.c:307
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

Synopsis: [3.3 regression] [parisc] ICE in cp_expr_size, at cp/cp-lang.c:307

State-Changed-From-To: analyzed->closed
State-Changed-By: jason
State-Changed-When: Tue Mar 18 04:37:24 2003
State-Changed-Why:
    OK, I was wrong; the backend does track alignment info, the
    problem was the frontend tacking on a INDIRECT_REF/NOP_EXPR/ADDR_EXPR
    sequence between the COMPONENT_REFs.  Fixed.

http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=10091
