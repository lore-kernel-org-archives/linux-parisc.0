Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4EC6A482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 May 2003 11:53:51 -0600 (MDT)
Message-Id: <200305131753.h4DHrmPJ007374@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc and -march=2.0 flag bug
To: gmsoft@gentoo.org
Date: Tue, 13 May 2003 13:53:48 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200305131853.03798.gmsoft@gentoo.org> from "gmsoft@gentoo.org>" at May 13, 2003 06:53:03 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> I've attached the the end of the compilation log of groff which fail with 
> -march=2.0 in CXXFLAGS. The same compilation works perfectly without this 
> flags or with -march=1.1 instead.

[...]

> troff: Failed assertion at line 654, file `number.cc'.

You didn't say which compiler version that you were using.

As I mentioned, the 3.2 branch is closed for bug fixes.  The failure
doesn't occur with 3.3.  It has a number of -march=2.0 fixes.  The
problem could be C++ related as well.  There are a huge number of C++
fixes in 3.3 relative to 3.3.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
