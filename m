From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: 12 Sep 2004 11:03:32 -0400
Message-ID: <1095001418.1714.7.camel@mulgrave>
References: <20040911165325.GO28659@tausq.org>
	<20040912134707.GL1854@baldric.uwo.ca>
	<1094997501.1714.4.camel@mulgrave>
	<20040912142908.GM1854@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912142908.GM1854@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2004-09-12 at 10:29, Carlos O'Donell wrote:
> Are relocations generated against the exception table entries?

Yes.  A module is just a normal .o file with a few extra sections.  It
contains all the relocations a .o file usually contains.

> > The same way we do in the regular kernel ... jump to the absolute
> > address.
> 
> If relocations are generated against extable entries then all should be
> okay. The address will be fixed by the loader and everything is fine.
> 
> That was my only worry, Randolph didn't seem to address testing a failed
> copy_from_user through a module extable.
> 
> My other question about freeing a flag still stands though.

I'll let Randolph answer that ... I find thinks like this are sticky;
once you touch them you can never get them off your hands...

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
