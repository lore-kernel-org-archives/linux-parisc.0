Return-Path: <ja2morri@csclub.uwaterloo.ca>
Received: from perpugilliam.csclub.uwaterloo.ca
	(perpugilliam.csclub.uwaterloo.ca [129.97.134.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1763748FA
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 08:39:14 -0700 (MST)
Sender: ja2morri@perpugilliam.csclub.uwaterloo.ca
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
References: <404782C800002FD2@ocpmta1.freegates.net>
	<kfhk71uawj9.fsf@perpugilliam.csclub.uwaterloo.ca>
	<20040309150910.GE22721@baldric.uwo.ca>
From: James Morrison <ja2morri@csclub.uwaterloo.ca>
Date: 09 Mar 2004 10:39:11 -0500
In-Reply-To: <20040309150910.GE22721@baldric.uwo.ca>
Message-ID: <kfheks2av34.fsf@perpugilliam.csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Carlos O'Donell <carlos@baldric.uwo.ca> writes:

> On Tue, Mar 09, 2004 at 10:07:54AM -0500, James Morrison wrote:
> >  Shouldn't this be --prefix=/usr then make install_root=/mnt/chroot install?
> 
> Yes, you can go that way, I think just prefix works aswell.
> Unless you have seen this fail before?
> 
> Glibc doesn't do any path mangling so far as I know.
> 
> c.

 Humm, it may be a Hurd thing where libc needs the correct prefix.

Jim
