Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 413204840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Nov 2003 19:25:16 -0700 (MST)
Date: Sun, 23 Nov 2003 19:25:14 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
Message-ID: <20031124022514.GA23224@colo.lackof.org>
References: <20031121005003.GB13007@colo.lackof.org> <3FB265250000556F@ocpmta2.freegates.net> <20031122052915.GB29917@colo.lackof.org> <3FBF4F65.70502@tiscali.be> <20031122220919.GA6732@colo.lackof.org> <3FBFE71F.7060207@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FBFE71F.7060207@tiscali.be>
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

On Sat, Nov 22, 2003 at 10:45:51PM +0000, Joel Soete wrote:
> hmm b2k and c3k are very brother system in term of architecture and 
> components?

yes - identical nearly. Share the same CPU, chipset, and firmware.

>  May I ask you the amount of ram stand in your c3k? (on my 
> b2k only 256k).

1GB.


> >If network, then I would guess your merge (or the 2.4.23-rc2 base) has a 
> >bug.
> 
> Certainly :( [but where, the rest ftp, rsync, nfs-client, gtk-app, ... 
> work fine and no special messages neither into kernel, messages or 
> syslog?]. Well don't care now, it is just a beat anoying to printout my 
> scripts.

ok. TBH, I have no clue then. It might be possible to attach strace to
a running lp deamon, redirect strace output to /dev/console and then
compore what happens different on the b2k when a print job is started.
My hope is the syscall output will get printed before it totallte crashes.

grant
