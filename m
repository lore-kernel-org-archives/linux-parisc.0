From: Andrew Cagney <ac131313@redhat.com>
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
Date: Mon, 24 Feb 2003 17:11:19 -0500
Message-ID: <3E5A9887.8090209__35558.6398429752$1416622239$gmane$org@redhat.com>
References: <20030224182328.M2938@parcelfarce.linux.theplanet.co.uk> <200302241839.h1OIdqBf016932@localhost.redhat.com> <20030224184225.N2938@parcelfarce.linux.theplanet.co.uk> <3E5A936F.6070401@redhat.com> <20030224215733.O2938@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: law@redhat.com, Alan Modra <amodra@bigpond.net.au>,
	binutils@sources.redhat.com, parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> On Mon, Feb 24, 2003 at 04:49:35PM -0500, Andrew Cagney wrote:
> 
>> > get binutils cvs to build a cross i386->hppa gdb dies in tix (no tk8.4
>> > directory), trying with just `make all-binutils all-gdb' dies being
>> > unable to find dl.h or machine/save_state.h.
> 
>> 
>> Unfortunatly, no one got the i386->hppa GDB to build so asking you to do 
>> that isn't reasonable.  If you've a hppa-linux-gnu box, can you just try 
>> binutils, `objdump --disassemble`?
> 
> 
> Yep, I can build binutils head-of-cvs just fine as a crosscompiler,
> and objdump --disassemble does the right thing.  Jeff's concern is that
> this intended output change might break the gdb testsuite.
> 
> fwiw, it doesn't break the binutils `make check' ;-)

If that happens `oops'.  GDB's HP/PA support isn't maintained.

Andrew
