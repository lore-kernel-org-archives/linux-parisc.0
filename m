From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 15:36:38 -0400
Message-ID: <20050406193638.GA1833@baldric.uwo.ca>
References: <20050406181337.GX1833@baldric.uwo.ca>
	<200504061837.j36IbnWI006770@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504061837.j36IbnWI006770@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Apr 06, 2005 at 02:37:49PM -0400, John David Anglin wrote:
> > We still have the problem of a *stuck* thread using linuxthreads.
> > Which we don't have a clear solution for...
> 
> It's my belief that expect/tcl has a similar problem, so the problem
> likely isn't specific to linuxthreads.  Expect definitely doesn't use
> linuxthreads.  This affects GCC and binutils testing so I rate fixing
> this as extremely important ;^)

We might have multiple problems :)

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
