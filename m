Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB0EF4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 17 Feb 2004 14:12:21 -0700 (MST)
Date: Tue, 17 Feb 2004 16:10:41 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
Message-ID: <20040217211041.GB12535@baldric.uwo.ca>
References: <402E7722.2080105@tiscali.be>
	<402A4CA50000347C@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A4CA50000347C@ocpmta2.freegates.net>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Feb 16, 2004 at 06:31:41PM +0100, Joel Soete wrote:
> > Ok, I will try to report as much detail as I can.
> 
> Hi all,
> 
> Just in case of some interest interest, here is the pr ref:
> <http://gcc.gnu.org/bugzilla/show_bug.cgi?id=14163>
> 
> hth,
>     Joel

Joel,

Excellent! Thanks for posting the PR, the person answering the PR is
correct, we should be indicating to gcc that set_dp is being used by
assembly.

I'm building with a fix right now "__attribute__((used))" to warn
gcc-3.5 that it should not remove the function. I hadn't even realized
that it was only being called by assembly, hence gcc-3.5 is doing a
*better* job of removing apparently dead code.

When the build finishes I'll update my glibc patches online.

c.
