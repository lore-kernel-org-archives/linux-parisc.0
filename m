From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 14:37:49 -0400 (EDT)
Message-ID: <200504061837.j36IbnWI006770@hiauly1.hia.nrc.ca>
References: <20050406181337.GX1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050406181337.GX1833@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 6, 2005 02:13:37 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> We still have the problem of a *stuck* thread using linuxthreads.
> Which we don't have a clear solution for...

It's my belief that expect/tcl has a similar problem, so the problem
likely isn't specific to linuxthreads.  Expect definitely doesn't use
linuxthreads.  This affects GCC and binutils testing so I rate fixing
this as extremely important ;^)

The problem also affects java.  I often have to manually kill various
java processes after a GCC test run completes.  At the moment, locking
isn't atomic in java.  I wonder if we are being bitten by the glibc
routines that still aren't atomic.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
