From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] c3k panics
Date: Wed, 1 Jun 2005 15:11:55 +0200
Message-ID: <4282FEEC00007CF4@mail-2-bnl.tiscali.it>
References: <20050531062619.GI3050@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050531062619.GI3050@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> 
> 
> > Ok clear but still confused why 32bit branch doesn't nullify the insn=

> > in delay slot like did 64bit?
> 
> it's a bug, but fortunately that copy of the fixup_branch macro (in
> syscall.S) isn't actually used ;-) I'll remove it.
> 
mmm, it seems that I am ongoing to become blind (to miss that ?)
ah no this the night (no idea where stand this dmaned bug) but I was just=

blind by a pocket torch thinking it would be a star :_(
 
> > btw one more thing confusing me: the third fixup_branch macro definit=
ion
> > in lusercopy.S:
> > [snip]
> >          .macro fixup_branch,lbl
> >          ldil        L%\lbl, %r1
> >          ldo         R%\lbl(%r1), %r1
> >          bv          %r0(%r1)
> >          .endm
> > 
> > This time just bv not bv,n ?
> 
> Yes, if you look at where the macro is used you will see that there is
> an instruction in the delay slot for the branch that should be executed=
.
> 
Cool :-)

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
