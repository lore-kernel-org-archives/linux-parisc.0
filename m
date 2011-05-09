From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Don't mlock guardpage if the stack is growing up
Date: Mon, 9 May 2011 15:58:02 -0700
Message-ID: <BANLkTikkA5H2D23u23FV0cTcL2bAT8BKWQ@mail.gmail.com>
References: <alpine.DEB.2.00.1105082045250.15552@artax.karlin.mff.cuni.cz>
 <alpine.LSU.2.00.1105081303540.16151@sister.anvils> <alpine.DEB.2.00.1105091307570.32299@artax.karlin.mff.cuni.cz>
 <BANLkTinCUQSjjif3op3H_9HDm5Eu-o+Luw@mail.gmail.com> <BANLkTim3kKJkisZK1mOgKhsEEs7FzZmyXA@mail.gmail.com>
 <1304979549.4865.56.camel@mulgrave.site> <BANLkTim7ATRyJ2NvoCj4Sv=7CLizKMd_WA@mail.gmail.com>
 <BANLkTi=DCKmN_BafFckKHOMfjWpVLQPDFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	Michel Lespinasse <walken@google.com>,
	Oleg Nesterov <oleg@redhat.com>, linux-ia64@vger.kernel.org
To: Tony Luck <tony.luck@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=DCKmN_BafFckKHOMfjWpVLQPDFA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 9, 2011 at 3:53 PM, Tony Luck <tony.luck@gmail.com> wrote:
>
> P.S. while we could start both stacks on the same page and have the grow
> away from the start point, ia64 actually starts them out a fair distance apart
> and lets them run into each other (if you have enough memory to let them
> grow that far, and if ulimit -s doesn't stop them earlier)

Ahh, so you never actually have one single mapping that has both flags set?

In that case, I won't even worry about it.

One thing I did want to verify: did the mlockall() actually change the
stack size without that patch? Just to double-check that the patch
actually did change semantics visibly.

                 Linus
