From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] Re: [git pull] parisc-linux for 2.6.15
Date: Sat, 19 Nov 2005 05:16:06 +0000
Message-ID: <e6eae0290511182116i43490909o@mail.gmail.com>
References: <20051118221601.GD28276@tachyon.int.mcmartin.ca>
	<Pine.LNX.4.64.0511181426270.13959@g5.osdl.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: akpm@osdl.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Linus Torvalds <torvalds@osdl.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.64.0511181426270.13959@g5.osdl.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 18/11/05, Linus Torvalds <torvalds@osdl.org> wrote:
>
> On Fri, 18 Nov 2005, Kyle McMartin wrote:
> >
> > This pull contains the last remnants of parisc divergence in parisc
> > specific files up to this point. At least, until someone commits to cvs=
.
> > Remaining changes in CVS are compat_signal and some ALSA stuff that wil=
l
> > be forwarded along to Jaroslav.
>
> Argh. I was tempted to not merge at this point, but since most of it is i=
n
> the parisc subdirectories, I let it slide.

I guess the less diff between the parisc tree and mainline, the more
happy we  (users & developers) are ;)

> > Before you consider whether to pull, I'd just like to double check
> > whether I made any mistakes in the process:
>
> Ok, it has that unnecessary extra merge, but apart from that there doesn'=
t
> seem to be anything actually _wrong_ with it.
>
> I don't mind some criss-cross merges, as long as they aren't common enoug=
h
> to make the history completely unreadable, and that was certainly not the
> case here.
>
> I just ask for cleanliness - not totally sterile trees ;)

I'm personally more the kinda guy who'll ask for a black&decker and some
WD40 and if something doesn't fit in properly.
I guess not everything IRL applies to CS ;)

Does this mean Linux/PA development is moving towards git in the near futur=
e?

Slan,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
