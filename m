Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA12640
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 01:10:52 -0700
Sender: phi@hpfrcu81.france.hp.com
Message-ID: <383263FD.E8976EFC@hpfrcu03.france.hp.com>
Date: Wed, 17 Nov 1999 09:14:53 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: frowand@cup.hp.com, parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <19991116170819.B750@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> > This is just one of several recent messages dealing with the issues caused by
> > locating the kernel at virtual address 0xc0000000 instead of 0x00000000.  I



Hi All,
Sorry for beeing a little out of phase with you this is the magic of the
timezone :-)

On the other I can read all the trail before reply.


First of all I may have started the 'trouble' by saying low virtual addr (that
can be mapped to low physical addr generally know as equiv map) I didn't meant
necessary starting at 0x0, I think I even say start mapping at anything after
page 0, it seems obvious that catch NULL deref in kernel mode is essential.

Regarding factoring kernel text pages, it could be accomplished by either
block tlb or super page depending on arch capability.

There where a reference about 'HP way of thinking the OS' versus rest of the
world, I would like to mention here that based on the french proverb 'who
loves well flame well' I love hp-ux and I'm the first to blame a lot of its
weaknesse. When I writing here I put my 'HP view' on the side, yet I'm
thinking the architecture we want to write an OS on will influence the OS
design. Here we have a 1Gb segmented machine, with virtual cache, and TLB,
this is definitly different from a 68K linear 4Gb with MMU. I think mastering
hppa is tough, and a laverage what the hpux designer did well or even goofed
if any would save time.

There is a reference about recognising a user pointer and a kernel pointer,
that something I don't understand due to lack of knowledge of the underlying
design. 
This sounds like (hope I'm wrong) user pointer and kernel pointer are
recognisable by their hi-bits (i.e quad selector), this would mean that
0xCafeCafe is recognised as kernel addr while 0x000F0FF is recognised as a
user addr, this imply the 0xc....... is not part of the user virtual adresse
space, this imply a user process is not 4 Gb capable (well it never will on
PA1.1 since we indeed need a UAREA, IO space, gateway page) 

This fear about user proces VAS (virtual adresse space) seem confirmed by
another reference to 'avoiding to use the space register at all) using space
register is the way to design multiple VAS, i.e one for user process for
instance, and one completly different for the kernel space, i.e how we use
those quadran in a given mode, I saw a reference about the user space layout
(text/data/shared data) but yet nothing abot the kernel, (kernel text/ data/
buffer cache/ other stuff)

I think the user virtual adress space must be design to allow a somewhat
linear view, allowing big chunck of vm, for instance a 2.5 Gb malloc (or
mmap). HP design is not good at that, while a new OS can learn what was wrong
with HP-UX and try to do better, on the other hand if the 0xcxxxxxxx is simply
removed from the user VAS, I think it is worst than HP-UX (process limited to
3 Gb by lack of last quad)

Now an hacker need. Dunno how it fit with current implementation of vmlinux,
but in case someday someone want to design a kernel tracer, that can be
install/desinstalled on the fly, a common hppa dependent implementation is to
divert the kernel code flow, i.e patch an instruction with a branch somewhere,
this could be assimilated to patching with a break instruction, as any debuger
the original instruct before patch would be saved for differed execution. For
break kind of implementation, this would mean debugger kind of ptrace, i.e get
the trap, restore instruction , single step, re-install the break, blah blah.
this is costly for tracing, another implementation is simply to stick a branch
to a tracer stub, and the tracer will one way or another execute the original
saved instruction, this limit patchable instruction to one that can be defered
(i.e non pc relative and non branch or delay slot kind) let simplify with
ld/st only.
Then you will discover the only possible instruction to use for branching is
the BLE within low virtual addr i.e using no base register 
BLE trace_stub(0,0) 
The tracer got the caller rp in r31 and then can identify the tracepoint and
manage it.
A single instruction patch is the easiest way to do it specillay on MP, no
spinlock needed to patch the trace point.
This is what ktracer is doing on hpux, this is what I'm doing in my own kernel
tracer, removing this possibilty somewhat reduce the supportability of the
target OS. I understand though that linux come with sources, then it is just a
matter to turn some compile flage to get any trace you want, but it happen
that on some site critical, being able to trace on a fly a kernel that was not
compiled for this on purpose is an ass saver (sometime) (well the tracer may
panic :-)

So the current 0xc0000000 may still allow this kind of tracer assuming we can
get kernel pages on the fly in those low virtual addr.

I rekon it is not easy to see its old habit going away, there where
interesting thing with hpux :-) well long live to vmlinux though, I bet my
kids are laughing (they are linux fan then we got animated meals :-)

Phi

--
mailto:phi@hpfrcu81.france.hp.com
WTEC Project. Kernel debugging tools
