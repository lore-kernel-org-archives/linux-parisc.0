Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2596B4857
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 10:01:15 -0700 (MST)
Message-Id: <200202201701.g1KH19AC019253@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.1 && k-2.4.17-pa27 50/50(was Re: hppa-linux gcc-3.0.3:)
To: jso@europay.com (=?iso-8859-1?Q?Jo=EBl_Soete?=)
Date: Wed, 20 Feb 2002 12:01:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: doko@cs.tu-berlin.de, carlos@baldric.uwo.ca,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <OF57EB6BBE.3537F19D-ONC1256B66.005252D2@com> from "=?iso-8859-1?Q?Jo=EBl_Soete?=" at Feb 20, 2002 05:53:32 pm
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

> I do not notice compile error :-)) (Hmm only note in dmesg  some
> do_page_fault() pid=... command='conftest' ... during glibc rebuild, I am
> not sure; I do not find any trace in my logs? ).

See the same, particularly running the gcc testsuite.  The program
which see to generate the do_page_fault's seems to be expect.  It
gets into a state where /var fills with log messages.

> Just inetd seems to make the system panic after a simple telnet:
> ...
> Kernel fault: Code=15 regs=...
> ...
> 
> David is it the problem of bootstrap you spoke about binutils?

No.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
