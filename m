Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 22 Dec 2002 00:11:42 -0700
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults
Message-ID: <20021222071142.GA17710@dsl2.external.hp.com>
References: <randolph@tausq.org> <20021218170254.GM19331@tausq.org> <200212202212.gBKMCbv08741@localhost.localdomain> <20021220223747.GD13478@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021220223747.GD13478@dsl2.external.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Dec 20, 2002 at 03:37:47PM -0700, Grant Grundler wrote:
> >  	STREG	%r1,0(%r30)			/* Stick r1 (usp) here for now */
> > +	ldo	16(%r30),%r30
> 
> As David observed, this wants to use ",ma" and I'll work that out with
> lamont/helge offline.
> Something will get committed to 2.4.x/2.5.x trees this afternoon.

*sigh*.  Can someone else test/commit this?

I've not been able to boot a 2.5.51 kernel on either A500-44 or C3000.
I won't commit what I can't test when others are obviously booting
2.5.51 kernels. My last attempts on A500-44 data page fault on
a NULL dereference in "$lctu_loop+8" (GR02 is sys_nanosleep+13c).
Panic seems to be after (AFAICT) all the RC scripts have run.
I'm at the end of my rope on 2.5.51.

I've placed the diff on ftp.parisc-linux.org:/patches/diff-2.5.51-pa5
The patch *looks* right and fixes a few other nits.
Should work on both PA1.1 and PA2.0 machines.
(and we have to use STREGM/LDREGM to support both variants).

thanks again and apologies for not committing it as promised.
grant
