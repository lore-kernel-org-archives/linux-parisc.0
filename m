From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: 29 Nov 2004 19:18:51 -0600
Message-ID: <1101777536.2114.103.camel@mulgrave>
References: <200411300023.iAU0NaI2014797@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200411300023.iAU0NaI2014797@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2004-11-29 at 18:23, John David Anglin wrote:
> > On Mon, 2004-11-29 at 18:08, John David Anglin wrote:
> > > With -ffunction-sections, gcc guarantees that calls can reach the
> > > beginning of a function plus some margin for the stub table.  The linker
> > > inserts stubs on a per function basis.  This should work better with
> > > relinking as the functions remain in their own sections.
> > 
> > So what we really need is the equivalent of -ffunction-sections for the
> > linker where, when we combine a bunch of .o's it sees if the branches
> > are getting too far a way and drops a stub in between the function
> > sections (so that the in-kernel linker doesn't have to bother about
> > doing this).
> 
> Then, in the final or in-kernel link, the long branch stubs get
> fixed.

That's the general idea.  Obviously any two pass linker (like the one in
binutils) can place the stubs optimally in between the sections (as long
as the code was compiled with -ffunction-sections) as part of the final
link, but the in-kernel linker is small and simple and I'd rather not
have to introduce it to the concept of multiple passes, so if there were
a flag to get binutils to do the hard work for us it would be much
appreciated.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
