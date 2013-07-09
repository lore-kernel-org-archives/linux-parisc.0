From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Tue, 9 Jul 2013 19:45:31 +0000 (UTC)
Message-ID: <loom.20130709T200549-18@post.gmane.org>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com> <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org> <51DC29DC.8060106@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin <dave.anglin <at> bell.net> writes:

> It would be useful if you could test if the current case
> , "mm->context == mfsp(3)" case works.
> You would have to move return
> and disable non current block.

Done. The system seems to work as usual. Should i do 
some specific checks?

> Suggest you hack arch/parisc/kernel/cache.c to 
> disable this optimization

The panic on SMP kernel changed to another one:
http://pastebin.com/SfUfd0Un
Same was before with an UP kernel. The only thing
i've changed since is moving to the latest toolchains.
Can't reproduce the previous panic case, so can't
comment on your proposed solution.

P.S.: The hw is not faulty, works ok under hpux.

