Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFD62482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Apr 2002 10:55:01 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id lpakmaaa for parisc-linux@lists.parisc-linux.org; Sat, 6 Apr 2002 10:54:00 -0700
Date: Sat, 6 Apr 2002 09:54:52 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, 140494-done@bugs.debian.org
Subject: Re: [parisc-linux] dynamic loader problem
Message-ID: <20020406175452.GF356@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200203111808.g2BI8u5N013881@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200203111808.g2BI8u5N013881@hiauly1.hia.nrc.ca>
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

In reference to a message from John David Anglin, dated Mar 11:
> In looking at the the failure of the g++.brendan/new3.C, I have observed
> what appears to be a problem with the dynamic loader.  The function
> _Znwj appears as a global symbol in the main program and in
> libstdc++.so.4.0.0.  The version in the main program should be selected
> in preference to the one in the shared library.  However, the dynamic
> loader actually uses the version in the shared library causing the
> test to fail.  The program works ok with static linkage.
> 
> It looks like the symbol search procedure used in glibc needs some work.

ok, recently events have prompted me to look at this again...

isn't the test itself broken?

it does this:

void *operator new(size_t sz) .....

int main() 
{
  A *bb = new A[10]; 
  ...
}

you define "operator new", but are calling operator new[], so it
defaults to the one in libstdc++...

if you change the definition of "operator new" to "operator new[]" then
the test will pass.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
