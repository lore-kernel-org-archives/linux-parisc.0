Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sources.redhat.com (sources.redhat.com [66.187.233.205])
	by dsl2.external.hp.com (Postfix) with SMTP id 3EFA64838
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 16:34:00 -0700 (MST)
Date: 17 Mar 2003 23:33:58 -0000
Message-ID: <20030317233358.13120.qmail@sources.redhat.com>
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

State-Changed-From-To: open->analyzed
State-Changed-By: jason
State-Changed-When: Mon Mar 17 23:33:58 2003
State-Changed-Why:
    The problem is that the #pragma pack means that _GEIdx::addr
    might not have the usual alignment of an ftn_addr, so we
    can't just take the address of current.addr in order to bind
    it to a reference.  expand_expr knows this, and tries to
    make a bitwise copy and take the address of that.  But since
    ftn_addr has a copy constructor, we can't make bitwise
    copies, so we abort.
    
    Now, in your particular testcase ftn_golded_nodelist_index::current
    does in fact have enough alignment for a ftn_addr, so we'd
    be OK just using the address of current.addr (it would be
    different if either of the latter two classes began with,
    say, a char field).  But the backend doesn't currently track
    alignment info from enclosing classes, so we are conservative
    and fail.
    
    We used to err in the other direction: taking the address of
    a packed field would lose any information about it possibly
    having less alignment, and things trying to use the resulting
    pointer could get a bus error.  See g++.dg/other/packed1.C.

http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=10091
