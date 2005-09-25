From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
Date: Sat, 24 Sep 2005 21:45:48 -0600
Message-ID: <20050925034548.GB1459__48323.4728374102$1416623925$gmane$org@parisc-linux.org>
References: <20050925014906.GC29038@parisc-linux.org>
	<200509250324.j8P3OVYQ003335@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: 329888@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200509250324.j8P3OVYQ003335@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Sep 24, 2005 at 11:24:31PM -0400, John David Anglin wrote:
> > On Sat, Sep 24, 2005 at 09:27:22PM -0400, John David Anglin wrote:
> > > The last "fic" opcode entry is wrong.  It's using the wrong
> > > instruction format, the mask is wrong, pa10 is wrong, etc.
> > 
> > I don't think we realised this until now.  I suspect we've been
> > silently emitting bad code up until this point, and given that it's
> > in flush_kernel_icache_page, maybe it explains some of our occasional
> > crashes.
> > 
> > The code was previously:
> > 
> >         fic,m           %r23(%r26)
> 
> I've committed a fix to binutils head.  The above should now be
> accepted when generating PA 2.0 code.  However, I'd probably
> avoid using this feature for awhile.  It looks like the bug has
> been present since ~ 1996.

This is in a file that's used on pa1.1 processors too, so I've gone with
specifying sr4 explicitly.  Thanks for fixing this bug and exposing our
bug ...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
