Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp02.web.de [217.72.192.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id F25EC4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 01:45:19 -0700 (MST)
Received: from c-180-204-166.n.dial.de.ignite.net ([62.180.204.166] helo=web.de)
	by smtp.web.de with asmtp (WEB.DE(Exim) 4.91 #2)
	id 18AREx-000414-00
	for parisc-linux@lists.parisc-linux.org; Sat, 09 Nov 2002 09:45:15 +0100
Message-ID: <3DCCC839.EFC91019@web.de>
Date: Sat, 09 Nov 2002 09:32:57 +0100
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nanosleep
References: <200211081116.gA8BGuX28978@mailgate5.cinetic.de> <20021108161225.GD2402@systemhalted>
Content-Type: text/plain; charset=us-ascii
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

Carlos O'Donell wrote:
> 
> > Hi List,
> > I tried to compile glibc2.3.1, and have some problems with the threading support there.
> > When using perl with the new glibc on a C240, things seem to work without problems. On
> > a 715/33, I get (probably) endless loops with lots of sched_yield() calls.
> 
> glibc 2.3.1 from debian CVS or upstream?

This is upstream with hppa patches from the debian tree. 

The report was probably bad. In the mail thread I mentioned in my
previous mail, the nanosleep in the kernel was fixed because of
threading problems. If I understand it correctly, threading will always
have problems without a realy working nanosleep.

Berthold
