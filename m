Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delenn.fl.net.au (int-mail.syd.fl.net.au [202.181.0.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87D4048DB
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Mar 2002 02:55:38 -0700 (MST)
From: "Duraid Madina" <duraid@fl.net.au>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] 'foreign' PCI cards in an rp2430 
Date: Sat, 9 Mar 2002 20:54:55 +1100
Message-ID: <000001c1c750$8d5f7900$022a17ac@simplex>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <20020309082810.CD8FF4835@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Grant wrote:
> and later:
> > About two months of pain went into making it work (reasonably 
> > efficiently, in theory at least) in 100s of GB of swap.
> 
> The approach seems really odd - you are looking at 64-bit 
> userspace so you can *swap* large amounts of virtual memory 
> in/out. If you expected to be IO bound, tuning the app to 
> know more about IO (instead of swapping) makes more sense.

Normally, yes. In my case, not really. To cut a long story short,
because C++ has poor intrinsic support for reflection, even making my
app *do* IO is non-trivial. E.g. my program instantiates millions of
different objects (which interact in various interesting ways). The cost
of serializing/deserializing these objects to store them in a light
database like berkeleyDB, or simply as files is great enough that the
job becomes CPU bound, and not I/O bound. Being CPU bound is not where I
want to be, when I'm seeing only 2mb/sec of I/O ;)

What's even worse is that I'm using some truly unwiedly third party
class libraries (Hi Richard! ;) which don't provide serialization, so
again, instantiating 'plain old objects' seems to be the path of least
resistance, in my case.

What I was hoping to do is take an athlon box with fast raid and gigabit
ethernet, and buy one of those nice new rp2430s, having it swap over
ethernet. It seems that I can do this with HP-UX, though perhaps not
with G++. I would prefer to run Linux on the rp2430 though, since then I
could use a cheap Intel gigabit NIC (instead of paying $$$ for an HP
one) or better yet, stick my 3ware RAID card in the rp2430, and do away
with the network altogether. That I *can't* do with HP-UX, so...

> Have you tried begging, trading, or buying some cycles on a 
> Superdome with some 100GBs of RAM instead of waiting for 
> weeks to see your jobs run to completion?

Really, my code should be pretty efficient (it takes weeks to run anyway
;) with the setup I've described above, but the killer is: I'm a
University student ("I knew it!" I hear you all say ;) and as such, my
code is perpetually in the "hmm, I wonder what'd happen if.." state. So
"some cycles" would become "some more cycles" faster than you could say
"where's all my RAM gone?!"

	Duraid

P.S. Am I really the only sicko who's wanted a 64-bit machine just so
they can abuse virtual memory? Surely not... ;)

P.P.S. It's true, I do love the smell, the feel, the sound of striped,
thrashing, consumer-level hard drives. C'mon guys, help this sicko make
his dream come true (:
