From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA-Linux version of libunwind
Date: Sat, 4 Dec 2004 22:04:45 -0500 (EST)
Message-ID: <200412050304.iB534j12014124@hiauly1.hia.nrc.ca>
References: <20041205023331.GB5905@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: davidm@hpl.hp.com,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041205023331.GB5905@colo.lackof.org> from "Grant Grundler" at
	Dec 4, 2004 09:33:31 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I'm only targeting DWARF2 unwind info (not the SOM-style PARISC
> > unwind-records) and not everything is implemented/working yet.
> 
> SOM is dead AFAIK. Only HPUX 32-bit uses SOM for anything.
> I'm not sure where DWARF fits into the gcc releases but maybe
> someone could remind me.

While only HP-UX 32-bit uses the SOM object format, parisc-linux
currently generates SOM-style unwind records generated from .callinfo
and other assembler statements.  At the moment, gdb uses the SOM-style
unwind records.

DWARF2 exception support has been available since GCC 3.3 but
the default exception model is still SJLJ.  SJLJ and DWARF2
can't be supported together in the same GCC build.  At the
moment, DWARF2 unwind info is generated only when using GCC
built with DWARF2 exception support, and when one of the following
GCC options is specified: -fexceptions, -funwind_tables or
-fasynchonous_unwind_tables.  You get -fexceptions when the
g++ driver is used, and possibly also with gcj.  Thus, some
migration to the new DWARF2 support is needed to take full
advantage of David's new library.

I must say I welcome David's new library.  Unwinding in gdb
has never been reliable with the SOM-style unwind records.
Some code reading is needed, etc.  The new library will make
it easy for applications to unwind on exceptions and print
backtraces when an internal problem occurs.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
