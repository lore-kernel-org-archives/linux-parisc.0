Return-Path: <ja2morri@csclub.uwaterloo.ca>
Received: from perpugilliam.csclub.uwaterloo.ca
	(perpugilliam.csclub.uwaterloo.ca [129.97.134.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CAE14952
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 08:08:10 -0700 (MST)
Sender: ja2morri@perpugilliam.csclub.uwaterloo.ca
To: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
References: <404782C800002FD2@ocpmta1.freegates.net>
From: James Morrison <ja2morri@csclub.uwaterloo.ca>
Date: 09 Mar 2004 10:07:54 -0500
In-Reply-To: <404782C800002FD2@ocpmta1.freegates.net>
Message-ID: <kfhk71uawj9.fsf@perpugilliam.csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


> >>2. Compile glibc with --prefix=/mnt/chroot

 Shouldn't this be --prefix=/usr then make install_root=/mnt/chroot install?

Jim
