Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sources.redhat.com (sources.redhat.com [66.187.233.205])
	by dsl2.external.hp.com (Postfix) with SMTP id 63C124829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Apr 2003 15:47:58 -0600 (MDT)
Date: 12 Apr 2003 21:47:57 -0000
Message-ID: <20030412214757.29214.qmail@sources.redhat.com>
To: danglin@gcc.gnu.org, gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org,
	nobody@gcc.gnu.org, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org
From: danglin@gcc.gnu.org
Reply-To: danglin@gcc.gnu.org, danglin@gcc.gnu.org,
	gcc-bugs@gcc.gnu.org, gcc-prs@gcc.gnu.org, nobody@gcc.gnu.org,
	parisc-linux@lists.parisc-linux.org, tausq@debian.org,
	gcc-gnats@gcc.gnu.org
Subject: [parisc-linux] Re: target/10271: [3.0/3.2/3.3/3.4] [HPPA] Floating point args don't get reloaded across function calls at -O2
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

Synopsis: [3.0/3.2/3.3/3.4] [HPPA] Floating point args don't get reloaded across function calls at -O2

Responsible-Changed-From-To: unassigned->danglin
Responsible-Changed-By: danglin
Responsible-Changed-When: Sat Apr 12 21:47:57 2003
Responsible-Changed-Why:
    Assignment.
State-Changed-From-To: open->analyzed
State-Changed-By: danglin
State-Changed-When: Sat Apr 12 21:47:57 2003
State-Changed-Why:
    Confirmed.
    
    There is a problem with the usage notes for argument registers in sibling calls when an argument needs to be passed in both general and floating point registers.  The usage notes appear correct in the initial rtl but the note for the general general register for the third argument of the fprintf call is being dropped.  This causes the insns which load these argument registers to be deleted.
    
    Correct code is generated if the -fno-optimize-sibling-calls option is specified.  The first fprintf call behaves correctly because it isn't a sibling call.
    
    More analysis is needed to determine why usage notes are being dropped in sibling calls.
    
    This is a regression as sibcalls were first enabled on this port in 3.1 branch.

http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=10271
