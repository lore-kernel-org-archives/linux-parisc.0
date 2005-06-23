From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 23 Jun 2005 08:10:19 +0200
Message-ID: <4282FEEE0000FA5F@mail-6-bnl.tiscali.it>
References: <20050623052753.GA20584@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050623052753.GA20584@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> Date: Wed, 22 Jun 2005 23:27:53 -0600
> From: Grant Grundler <grundler@parisc-linux.org>
> To: Joel Soete <soete.joel@tiscali.be>
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
> 
> 
> On Wed, Jun 22, 2005 at 07:54:54PM +0000, Joel Soete wrote:
> > of fp registers?
> > or how may I try to define it as accurately as possible?
> > (I objdump a operating 2.6.12-rc.-pa. 64bit to grep some 'fr[12][0..9=
]'
> and 
> > all of them seems to be used?
> 
> Of course they will all be used - kernel has to save and restore
> process state when switching context.
Oops I missed it (my bad)

> You have to look at each
> use and determine why FP is being used. There shouldn't
> be that many different uses.
> 
Thanks for enlightenment,

I still have to make a lot of progress ;-)

> > Do I have to look elsewhere; tausq also spoke about: sic
> > [...]One proposal that has been talked about before is if we can
> > compile a version of the millicode lib that uses limited fpregs range=

> > and compile the kernel using this new option that Dave is talking abo=
ut,
> > then we will be able to get by using a (much) smaller subset of fp re=
gs
> > and we won't have to save/restore them in the kernel. )
> 
> That's correct - but we will still have to save/restore all FP regs
> on a general context switch - just a subset of those when
> entering/leaving the kernel (e.g. handling an external interrupt).
> 
Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
