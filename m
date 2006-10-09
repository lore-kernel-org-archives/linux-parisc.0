From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for git tree management
Date: Mon, 9 Oct 2006 13:39:58 +0200
Message-ID: <7d01f9f00610090439g763c9260q257fad185bbdf326@mail.gmail.com>
References: <20061008004151.GZ2563@parisc-linux.org>
	<20061009032945.GB30517@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061009032945.GB30517@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 10/9/06, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Sat, Oct 07, 2006 at 06:41:52PM -0600, Matthew Wilcox wrote:
> >
> > I think the git development model is working out pretty well.  We've
> > committed around 100 patches to our tree since we switched to using git.
> > Most of those have gone upstream, mostly through Kyle's hard work.
>
> Agreed - many kudos/thanks to kyle!

All hail Kyle indeed :)

> > The obvious solution is to rebase the tree.  We start a new origin
> > branch from point E and pull commit F onto it as commit F'.  But if we
> > delete the former origin branch we lose our history.
>
> I don't care so much about "our" history. I mostly care
> about the commit message(s) that end up in linus' tree.

Despite not being terribly active nowadays, I'd like to contrast this
view a little bit. "Our" history has proven very useful (at least to
me) in a number of cases (comes to mind the development of gscps2
input driver based on evolutions of hp_kbd.c and friends) and I
remember quite a few occasion where it was actually interesting to be
able to track down who committed any given bit of code (for some
reason I remember tracking down prumpf's commits in some well known
locking routine, among other things).

On a more "play the devil's advocate" side of things, i believe it's
of great importance to be able to track down when any given code was
first introduced and who committed it. Copyright issues such as the
SCO-induced shite are a good demonstration that being able to quickly
assert copyright/genealogy on any given bit is a good thing...

> > I'm concerned we may get an unreasonable number of branches using this
> > scheme.  Using a date (rather than a cardinal) helps understand how
> > relevant a branch may be.
>
> I think anything is ok if it helps us determine what's missing
> from linus' tree and ship those patches (when ready) to him.
> I'll probably end up ignoring the branches anyway.
>
> Please just make it "KISS". I'm only using git a few times per month
> and it's just not enough to do anything complicated right now.
> My goal is any git commits I make can (indirectly via kyle) go
> to linus without the confusion you described.

I'd also strongly support a KISS approach. Yet I was under the
impression that rebasing the tree would break any subsequent 'git
pull' on older trees, is that right?

Along those lines I'm also thinking that assuming we want to revive
our kernel autobuilder, we probably want to think of a git tree
architecture that will induce minimal man handling of the autobuilder
once started...

Just my 2c, well aware that I'm not paying enough attention to our
development process lately, and thus I may be full of sh*t  ;^)

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
