From: danglin@gcc.gnu.org
Subject: [parisc-linux] Re: target/10237: [3.2 regression] [HPPA] Internal compiler error in insn_default_length, at insn-attrtab.c:1203
Date: 12 Apr 2003 22:24:29 -0000
Message-ID: <20030412222429.8647.qmail__41711.2377159812$1416622380$gmane$org@sources.redhat.com>
Reply-To: danglin@gcc.gnu.org, danglin@gcc.gnu.org,
	debian-gcc@lists.debian.org, gcc-bugs@gcc.gnu.org,
	gcc-prs@gcc.gnu.org, nobody@gcc.gnu.org,
	parisc-linux@lists.parisc-linux.org, rbradetich@uswest.net,
	gcc-gnats@gcc.gnu.org
To: danglin@gcc.gnu.org, debian-gcc@lists.debian.org,
	gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org, nobody@gcc.gnu.org,
	parisc-linux@lists.parisc-linux.org, rbradetich@uswest.net
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Synopsis: [3.2 regression] [HPPA] Internal compiler error in insn_default_length, at insn-attrtab.c:1203

Responsible-Changed-From-To: unassigned->danglin
Responsible-Changed-By: danglin
Responsible-Changed-When: Sat Apr 12 22:24:28 2003
Responsible-Changed-Why:
    Assignment.
State-Changed-From-To: open->closed
State-Changed-By: danglin
State-Changed-When: Sat Apr 12 22:24:28 2003
State-Changed-Why:
    The code is illegal.  A return statement without an expression can only appear in a function whose return type is void.
    
    The ICE is fixed in 3.3.

http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=10237
