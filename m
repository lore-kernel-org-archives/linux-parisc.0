Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61A384829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 09:11:23 -0600 (MDT)
Date: Tue, 6 May 2003 08:08:27 -0700
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
Message-ID: <20030506150827.GA23465@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030506140425.GF18309@tausq.org> <3EB7766A00000308@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3EB7766A00000308@ocpmta7.freegates.net>
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

> That is ok for me (even if I don't understand very well :( ; afaik the previous
> code works fine for gcc<=3.1 and do not seems to concern 64bits? )

The point is that if the new code is always correct, then littering 
the code with #ifdef's makes the code hard to read and maintain. If 
you really need to make the code different for the two cases, it's 
better to conditionally define a function/macro in a single place 
(header file) and use that in the source, rather than having ifdef's 
in many places.

HTH,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
