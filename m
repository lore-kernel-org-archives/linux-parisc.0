Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 595044856
	for <parisc-linux@parisc-linux.org>; Tue, 26 Feb 2002 17:13:24 -0700 (MST)
Date: Tue, 26 Feb 2002 16:13:10 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] gcc (g++) problem
In-Reply-To: <200202260425.g1Q4PYOJ001214@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.33L2.0202261612360.6941-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Cool.  Seems to work OK on the test, now to try it on the real thing...


On Mon, 25 Feb 2002, John David Anglin wrote:

> > Here's the problem.  This program segfaults when compiled with -fPIC, as
> > required to build a .so.  It is fine when compiled without -fPIC.  It is
> > also fine on intel platform with both.  Is there something wrong with the
> > code that I'm not seeing, or is this a compiler bug?  I have tried this
> > with gcc-3 on an intel box, and it is fine, so I assume it is this port?
>
> It's probably a compiler bug.  The code works ok with my 3.1 test version.
> I think the problem may be the restoration of the pic offset table register
> after function calls.
>
> Suggest trying the debian 3.1 prerelease build.  Search the list to find
> how to get it.
>
> Dave
>

-- 
QOTD:
	 "It's not the despair... I can stand the despair.  It's the hope."
