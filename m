From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
Date: Mon, 24 Feb 2003 21:57:33 +0000
Message-ID: <20030224215733.O2938__35613.4590031163$1416622238$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <20030224182328.M2938@parcelfarce.linux.theplanet.co.uk> <200302241839.h1OIdqBf016932@localhost.redhat.com> <20030224184225.N2938@parcelfarce.linux.theplanet.co.uk> <3E5A936F.6070401@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthew Wilcox <willy@debian.org>, law@redhat.com,
	Alan Modra <amodra@bigpond.net.au>, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org
To: Andrew Cagney <ac131313@redhat.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E5A936F.6070401@redhat.com>; from ac131313@redhat.com on Mon, Feb 24, 2003 at 04:49:35PM -0500
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Feb 24, 2003 at 04:49:35PM -0500, Andrew Cagney wrote:
> > get binutils cvs to build a cross i386->hppa gdb dies in tix (no tk8.4
> > directory), trying with just `make all-binutils all-gdb' dies being
> > unable to find dl.h or machine/save_state.h.
> 
> Unfortunatly, no one got the i386->hppa GDB to build so asking you to do 
> that isn't reasonable.  If you've a hppa-linux-gnu box, can you just try 
> binutils, `objdump --disassemble`?

Yep, I can build binutils head-of-cvs just fine as a crosscompiler,
and objdump --disassemble does the right thing.  Jeff's concern is that
this intended output change might break the gdb testsuite.

fwiw, it doesn't break the binutils `make check' ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
