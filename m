Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 14 Dec 2002 20:53:59 -0700
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.20-pa14 64bit crash on boot - A500-5X
Message-ID: <20021215035359.GA18647@dsl2.external.hp.com>
References: <20021213132838.F044D49C55@mail.esiee.fr> <20021213233540.503b16d3.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021213233540.503b16d3.varenet@esiee.fr>
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

On Fri, Dec 13, 2002 at 11:35:40PM +0100, Thibaut VARENE wrote:
> AOUT: 0x10143bd4 mod_timer+3c
...
> AOUT: 0x10538b48 hp_diva_timer+0

Good News: I reproduced this and fixed it.
But I don't know exactly what I did that fixed it. :^(
(drawbacks of the shotgun approach).
Fairly small patch is on ftp.parisc-linux.org/patches/diff-2.4.20-timer
This isn't ready to commit until someone narrows it down to one thing.

Bad News: SMP kernel now hangs during SCSI device discover.
I haven't tried CONFIG_SMP=n yet and I guess that would be a next step.
Console output of the a500-44 boot with 2.4.20-pa14 + patch is on
	dsl2.e.h.c:~grundler/rp2470-2.4.20-symhang-01

grant
