From: David Mosberger <davidm@napali.hpl.hp.com>
Subject: Re: [parisc-linux] PA-Linux version of libunwind
Date: Mon, 6 Dec 2004 11:17:13 -0800
Message-ID: <16820.45113.170552.466399@napali.hpl.hp.com>
References: <20041205023331.GB5905@colo.lackof.org>
	<200412050304.iB534j12014124@hiauly1.hia.nrc.ca>
Reply-To: davidm@hpl.hp.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: davidm@hpl.hp.com,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412050304.iB534j12014124@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi John,

>>>>> On Sat, 4 Dec 2004 22:04:45 -0500 (EST), "John David Anglin" <dave@hiauly1.hia.nrc.ca> said:

  John> While only HP-UX 32-bit uses the SOM object format,
  John> parisc-linux currently generates SOM-style unwind records
  John> generated from .callinfo and other assembler statements.  At
  John> the moment, gdb uses the SOM-style unwind records.

Yes, that's why I mentioned SOM.  I already discussed the issue
briefly with Randolph.  We _could_ put PARISC Unwind Record support
into libunwind, but it's not clear whether it's worth the trouble.
The big issue is that under Linux, the only way to get to the PARISC
Unwind Records seems to be via the ELF file and that's not (directly)
accessible from within a running process.  That's not a problem for
gdb, of course, but in effect, use of PARISC Unwind Record would be
limited to what libunwind calls remote unwinding.  It may make more
sense to leave the PARISC Unwind Record support in gdb and just
declare support for those Unwind records as deprecated.

  John> I must say I welcome David's new library.  Unwinding in gdb
  John> has never been reliable with the SOM-style unwind records.
  John> Some code reading is needed, etc.  The new library will make
  John> it easy for applications to unwind on exceptions and print
  John> backtraces when an internal problem occurs.

gdb already has a DWARF2 unwinder and at this point I'm unsure whether
it's better to enable PARISC support for that unwinder or for
libunwind.  Whatever makes the most sense is fine with me.  However, I
do hope that having libunwind available on more (DWARF2) platforms
will get people away from constantly reinventing the wheel in regards
to unwinders.  As Randolph says, each unwinder tends to come with its
own set of limitations and bugs.  With the single source-tree provided
by libunwind, I hope to eliminate that problem.

	--david
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
