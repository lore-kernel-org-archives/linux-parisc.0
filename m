Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01C95482D
	for <parisc-linux@parisc-linux.org>; Fri, 15 Jun 2001 19:17:03 -0600 (MDT)
Message-Id: <200106160116.VAA07733@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new g++/exceptions problem
To: bame@fc.hp.com (Paul Bame)
Date: Fri, 15 Jun 2001 21:16:39 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: amodra@bigpond.net.au, parisc-linux@parisc-linux.org
In-Reply-To: <E15B4IO-000111-00@noam.fc.hp.com> from "Paul Bame" at Jun 15, 2001 06:50:36 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I built apt against the new exception-handling
> compilers (pehc:~taggart/newcompilers-20010615)
> and now all the apt utilities bus error right away.  This stuff can

There is a known issue with gcc 3.0 and glibc:
<http://gcc.gnu.org/ml/gcc-bugs/2001-06/msg00770.html>.  It involves
the change in exception handling.  Possibly, this is what is bitting.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
