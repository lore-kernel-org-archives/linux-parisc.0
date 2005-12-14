From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Merged new binutils.
Date: Tue, 13 Dec 2005 19:46:44 -0500
Message-ID: <20051214004643.GZ1298@baldric.uwo.ca>
References: <20051213213825.GY1298@baldric.uwo.ca>
	<200512132208.jBDM8mNG013383@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200512132208.jBDM8mNG013383@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Dec 13, 2005 at 05:08:48PM -0500, John David Anglin wrote:
> > I merged a new binutils into cvs.parisc-linux.org. Anyone want to take a
> > look at why we have 38 regressions in ld?
> > 
> > This is probably my fault :)
> 
> cvs:
> 
>                 === ld Summary ===
> 
> # of expected passes            215
> # of expected failures          41
> /home/dave/binutils-2.16.91/objdir/ld/ld-new 20051213

Oh wow... that's CVS?

I guess we have something we need to fix. ld doesn't bootstrap properly
so it's a pretty serious buglet somewhere.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
