Return-Path: <ja2morri@csclub.uwaterloo.ca>
Received: from perpugilliam.csclub.uwaterloo.ca
	(perpugilliam.csclub.uwaterloo.ca [129.97.134.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id 143C648BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 13:12:53 -0700 (MST)
Sender: ja2morri@perpugilliam.csclub.uwaterloo.ca
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
References: <20040312164116.GI24266@baldric.uwo.ca>
	<404EC1C600002B98@ocpmta1.freegates.net>
	<20040312212012.GS24266@baldric.uwo.ca> <40535A0A.4020209@tiscali.be>
	<4054B9BC.30309@tiscali.be>
From: James Morrison <ja2morri@csclub.uwaterloo.ca>
Date: 14 Mar 2004 15:12:51 -0500
In-Reply-To: <4054B9BC.30309@tiscali.be>
Message-ID: <kfhad2j2nng.fsf@perpugilliam.csclub.uwaterloo.ca>
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


C
Joel Soete <soete.joel@tiscali.be> writes:

> arlos,
> 
> I just noticed a border effect when I try to use James method: use prefix=/usr and make  install_root=/mnt/chroot install;
> 
> Joel Soete wrote:
> > Carlos O'Donell wrote:
> >
> >> On Fri, Mar 12, 2004 at 06:33:11PM +0100, Joel Soete wrote:
> >>
> >>> Hmmm all output files realted to Error1 was empty because of:
> >>> hppa-linux-gcc -nostdlib -nostartfiles -o
> >>> /Develop/parisc-linux/build/glibc/posix/tst-regex
> >>> -Wl,-dynamic-linker=/lib/ld.so.1
>                          ^^^^^^^^^^^^

 Are you running make check after make install?

Jim
