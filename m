Return-Path: <carlos@lios.external.hp.com>
Received: from lios (colossus.baldric.uwo.ca [129.100.225.209])
	by dsl2.external.hp.com (Postfix) with ESMTP id 954984840
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 23 Jan 2004 12:25:59 -0700 (MST)
Date: Fri, 23 Jan 2004 09:24:26 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
Message-ID: <20040123142426.GE4571@baldric.uwo.ca>
References: <20040122213849.GG13354@colo.lackof.org>
	<20040123020907.GJ13354@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040123020907.GJ13354@colo.lackof.org>
Sender: Carlos O'Donell <carlos@lios.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Jan 22, 2004 at 07:09:07PM -0700, Grant Grundler wrote:
> On Thu, Jan 22, 2004 at 02:38:49PM -0700, Grant Grundler wrote:
> > Just booted 2.6.1-pa9 (-pa8 + SBA change) and got:
> > 
> > kernel BUG at mm/shmem.c:585!
> > Kernel addresses on the stack:
> 
> I've associated this with logging out of ssh sessions.
> ie when I exit a remote login, the above output pops up in the console.

I've been looking at this bug for a while now, it crops up when I cross
compile a 64-bit kernel with a newer gcc. Randolph was saying that cross
compilng with 3.0.4 doesn't generate this problem. If I remember right
it's trying to free a shared memory inode that is still being used, and
that scenario shouldn't exist. Why this happens is a mystery. 

I see this twice, once for ssh, and something else generates the error.
It appears non-fatal, and I want to blame the compiler :)

http://lists.parisc-linux.org/pipermail/parisc-linux/2003-December/021783.html

c.
