Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep02-mail.bloor.is.net.cable.rogers.com (fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2D92482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 20:08:11 -0600 (MDT)
Date: Tue, 20 May 2003 22:09:08 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4 and semtimedop - need kernel compat?
Message-ID: <20030521020908.GE10485@systemhalted>
References: <3EC76210000009D0@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3EC76210000009D0@ocpmta8.freegates.net>
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

> In the very last Andrea's patch 2.4.21rc2aa1.bz2, I read that Andrea already
> back port this stuff :)
> 
> At a first glance, the job is also applied for hppa. Would you like that
> I have a look to see if it is applicable with your patch in p-l cvs tree?

Seeing as how our glibc 2.3.2 is highly unstable and non-functional, it
won't help very much :(

It should be easy enough to connect our syscall to semtimedop when the
code is backported.

c.
