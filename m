From: law@redhat.com
Subject: [parisc-linux] Re: [PATCH] space register 0 changes for hppa
Date: Mon, 24 Feb 2003 11:39:52 -0700
Message-ID: <200302241839.h1OIdqBf016932__34863.2578891285$1416622237$gmane$org@localhost.redhat.com>
References: <20030224182328.M2938@parcelfarce.linux.theplanet.co.uk>
Reply-To: law@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Alan Modra <amodra@bigpond.net.au>, binutils@sources.redhat.com,
	parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Your message of "Mon, 24 Feb 2003 18:23:28 GMT."
             <20030224182328.M2938@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

In message <20030224182328.M2938@parcelfarce.linux.theplanet.co.uk>, Matthew Wi
lcox writes:
 >On Mon, Feb 24, 2003 at 08:01:31AM -0700, law@redhat.com wrote:
 >> And the GDB testsuite, which tests the PA disassembler.  I'm 99% sure
 >> it's going to fail after this change.
 >
 >i would, if i could.  every attempt i made to get gdb's testsuite to
 >run met with disaster.  this was supposed to be a quick bugfix not a
 >major expedition.  i give up.  someone who can cope with the ridiculous
 >requirements for building gdb targetting hppa can fix this.
Err, I built it without difficulty a few months ago (I don't do nearly as
much PA work as I used to).  Presumably you have an HPUX box, right?  That's
the easiest way to get it build and running.

Jeff
