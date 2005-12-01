From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] 2.6.15-rc3-pa0 failed to build fix [Was:
	2.6.15-rc3 merged successfully with rc2-pa2 but failed to build]
Date: Thu, 1 Dec 2005 18:00:46 +0000
Message-ID: <e6eae0290512011000i3b89df60m@mail.gmail.com>
References: <IQT31C$A9CEBF93C62372CCD64DEF3B72E83892@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IQT31C$A9CEBF93C62372CCD64DEF3B72E83892@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 01/12/05, Joel Soete <soete.joel@tiscali.be> wrote:
> > Hi *,
> >
> > I just get a try to this merge (near straightforward :<)) but failled t=
o build
> > in 2 places with the same error:

[...]

> > I doubt it could be the fix as it seems that it was already build witho=
ut that
> > stuff (<http://lkml.org/lkml/2005/11/29/27>)?
> >
> Anyway feel safe to ci (no cvs write access), it's like this in mm1 as we=
ll as
> in <http://www.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git=
>
> repository, though.

I tested you patch and it works for me (TM).
Tested on c3700, 32bit UP, gcc-3.4, running for 10 hours now with
heavy i/o, no problems.
  Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
