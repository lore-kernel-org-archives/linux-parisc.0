From: David Mosberger <davidm@napali.hpl.hp.com>
Subject: Re: [parisc-linux] PA-Linux version of libunwind
Date: Mon, 6 Dec 2004 11:22:56 -0800
Message-ID: <16820.45456.164786.170565@napali.hpl.hp.com>
References: <20041205023331.GB5905@colo.lackof.org>
	<200412050304.iB534j12014124@hiauly1.hia.nrc.ca>
	<20041205091640.GV6359@tausq.org>
Reply-To: davidm@hpl.hp.com
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 davidm@hpl.hp.com,
 parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041205091640.GV6359@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>>>>> On Sun, 5 Dec 2004 01:16:40 -0800, Randolph Chung <randolph@tausq.org> said:

  Randolph> The kernel contains a primitive SOM unwind record-based
  Randolph> unwinder. That will also need to be redone if we decide to
  Randolph> go to dwarf2 only unwinding (but i guess David is working
  Randolph> towards that anyway).

Ugh, it's good you mention this!  Just a few days ago, I raised the
question of in-kernel unwind support for various Linux platforms.
Nobody expressed a clear-cut interest so far (I fear I asked on the
wrong mailing-list...).  It sounds like PARISC Linux would benefit
from having libunwind-support in the kernel?  I'm pretty sure Alpha
needs that too.  There are probably others that would want it, too.
So far, it looks like only SPARC and PPC{,64} don't need libunwind,
since the hardware/calling-convention squirrels away enough info in
the stack-frames to not need unwind-info.

  Randolph> One tricky thing though is that while generating SOM-style
  Randolph> unwind records for hand-written assembly is fairly
  Randolph> straightforward, generating dwarf2-unwind data is not
  Randolph> quite so easy... possibly we need to do some work to make
  Randolph> this somewhat easier to handle.

The cfi-directive support recently added to the binutils makes it
fairly straight-forward though.  Basically, you just need to annotate
the instructions that manipulate the stack-pointer and instructions
that save/restore a preserved register.

	--david
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
