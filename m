From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.4.20-pa27 64bits smp problem!
Date: Wed, 26 Feb 2003 16:13:11 -0500 (EST)
Message-ID: <200302262113.h1QLDC05020030__13475.5144165412$1416622244$gmane$org@hiauly1.hia.nrc.ca>
References: <20030226203722.A16664@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: willy@debian.org, parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
To: willy@debian.org (Matthew Wilcox)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030226203722.A16664@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 26, 2003 08:37:22 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> On Wed, Feb 26, 2003 at 01:58:57PM -0500, John David Anglin wrote:
> > > Would I have to open a bug report near gcc with this one?
> > 
> > You mean for the errors:
> > 
> > joel.c:19: error: initializer element is not constant
> > joel.c:19: error: (near initialization for `MyRWLock')
> > joel.c:19: error: initializer element is not constant
> > 
> > No, fix the code.  I don't believe you will win this one.  This
> > feature (extension) was deliberately removed from GCC.
> 
> I think it was an error to do so.  I do not see how
> 
> 	(spinlock_t) { 1 }
> 
> is any more or less constant than
> 
> 	{ 1 }
> 
> Removing this extension is a bad idea because it removes the ability to
> do typechecking.  For example,
> 
> 	rwlock_t lock = SPIN_LOCK_INIT;
> 
> would throw an error with a cast and not without.

GCC allows the above cast.  What is not ok is a non-arithmentic cast
operator within an arithmetic constant expression (initializer).  In
ISO C, cast operators in an arithmetic constant expression shall only
convert arithmetic types to arithmetic types, except as part of an
operand to the sizeof operator.  See section 6.6 in the ISO C standard.

Joel's example contained a non-arithmetic cast within an arithmetic
expression.  Possibly, GCC could have continued to allow casts to
aggregate types, but a decision was made not to.  I know glibc has
had to adapt similar code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
