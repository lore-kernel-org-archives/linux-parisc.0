From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] spinlock debug
Date: Tue, 13 Jul 2004 23:28:06 -0600
Message-ID: <20040714052806.GB16639@colo.lackof.org>
References: <20040714042909.GM546@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 varenet@parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040714042909.GM546@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jul 13, 2004 at 09:29:10PM -0700, Randolph Chung wrote:
> I don't think the comment is correct.

The comment is *mostly* correct.
It just doesn't get all the exit criteria right. :^)

> Lets say someone is holding the
> lock when you enter this code, your outer loop test always succeeds, and
> you spin on the inner loop until stuck == 0. At that point you go back
> to the outer loop, the lock is still held, so you go back to the inner
> loop and continue spinning, and you never timeout the lock.

Yup - good catch.

> you probably need a "&& stuck > 0" in the outer loop.

Yes. This should be sufficient:
        a = __ldcw_align(lock);
        while ((__ldcw(a) == 0) && stuck)
                while ((*a == 0) && --stuck);

> for some reason this still doesn't work for me though, but i don't see 
> why :( with a TOC i see we are spinning and i never see the printk.
> it might be that it's actually printing and just that the output is not
> going to the console... dunno

Do you happen to know which lock it's spinning on?
That should at least reduce the subset of code we need to look at.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
