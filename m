Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 13 Aug 2003 09:57:54 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030813155754.GC18794@dsl2.external.hp.com>
References: <20030812160612.GF20514@dsl2.external.hp.com> <3F29178A00002DBE@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F29178A00002DBE@ocpmta7.freegates.net>
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

On Tue, Aug 12, 2003 at 07:06:44PM +0200, Joel Soete wrote:
> >
> >osdl-aim-7 benchmark probably stresses both itlb and dtlb.
> >(available from osdl.org - URL is in linux-ia64 archive)
> 
> Ok I finaly find it as re-aim-7 sf.net project.

I also pulled bits from sf.net for ia64 testing:
    http://umn.dl.sourceforge.net/sourceforge/re-aim-7/reaim-0.1.8.tar.gz

though I know the maintainer planed to change the name since then:
| Apoligies, the naming was not good.
| I'll attempt to change it. ( i like osdl-aim-7 )
| In the meantime, you can also get the source from
| 
| bk://developer.osdl.org/reaim
| cliffw


> Just launch (alltest) with
> kernel-64bits+ C.patch . I will let run for the night and relaunch it with
>  tommorrow morning with original kernel-64bits.

I was told to run with:
iota:/mnt# reaim -f /mnt/usr/local/share/reaim/workfile.new_dbase -s100 -e 500 -i 100

You might need to pick -s and -e values that are more appropriate for
the machine under test. This was for dual CPU 900Mz rx2600 with 2GB RAM.

hth,
grant
