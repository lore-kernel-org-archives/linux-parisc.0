Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 438CB4844
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  6 Apr 2004 07:18:34 -0600 (MDT)
Date: Tue, 6 Apr 2004 09:14:47 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [PATCH] glibc-2.3.3 error with debian unstable
	compiler...
Message-ID: <20040406131445.GO26344@baldric.uwo.ca>
References: <20040402180356.GG1081@baldric.uwo.ca>
	<40711E5600000D4E@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40711E5600000D4E@ocpmta1.freegates.net>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Apr 06, 2004 at 12:46:54PM +0200, Joel Soete wrote:
> Carlos,
> 
> I just apply your patch against the glibc cvs dated 20040405
> (yesterday for me).  It compiles well with last updated gcc (3.3.3-6
> dpkg iirc) :)
> 
> I just complete the 'make -k check' (on chroot disk) which finished
> with nothing more then well known bug :)
> 
> ... And the compile (always in the chroot disk) of the last
> k-2.6.5-pa3 just finishes with success :)


Thanks for the check Joel!

c.
