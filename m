Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1FFD44952
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 08:11:19 -0700 (MST)
Date: Tue, 9 Mar 2004 10:09:10 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Morrison <ja2morri@csclub.uwaterloo.ca>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
Message-ID: <20040309150910.GE22721@baldric.uwo.ca>
References: <404782C800002FD2@ocpmta1.freegates.net>
	<kfhk71uawj9.fsf@perpugilliam.csclub.uwaterloo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <kfhk71uawj9.fsf@perpugilliam.csclub.uwaterloo.ca>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Mar 09, 2004 at 10:07:54AM -0500, James Morrison wrote:
>  Shouldn't this be --prefix=/usr then make install_root=/mnt/chroot install?

Yes, you can go that way, I think just prefix works aswell.
Unless you have seen this fail before?

Glibc doesn't do any path mangling so far as I know.

c.
