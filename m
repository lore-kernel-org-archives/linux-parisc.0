From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: 2.6.14-rc2-pa6 issues on C3000
Date: Wed, 19 Oct 2005 14:11:38 -0600
Message-ID: <20051019201138.GA29348@colo.lackof.org>
References: <IOLN1Y$2D02E9DC48FF1382783F4DBD297A44A4@scarlet.be>
	<200510191854.j9JIsgEf018826@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200510191854.j9JIsgEf018826@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 19, 2005 at 02:54:42PM -0400, John David Anglin wrote:
> > Nice that works a lot better (you get rid of may Warning) eventhought didn't
> > boot yet (again synchronize_irq()) :_(
> 
> rc2-pa5 doesn't boot on c3k with default config.  I built it with
> gcc-4.0 (debian).  It dies with a data alignment exception (code=26)
> in kref_get (if I remember correctly).

I'm not seeing that with my j6k.
But I'm building using "stable" gcc (gcc version 3.3.5 (Debian 1:3.3.5-13)).
I also have enabled SMP and DEBUG_SLAB in my kernel builds.
Diff between c3000_config and my mine is appended (It's short).

Kernel should warn about, but handle data alignment exceptions.
So this sounds like two bugs: one for the misaligned data and
another that the kernel isn't handling it properly.
I expect this is another exposure that gcc 3.x was hiding by
automatically aligning some data types.

> There's also some undefined symbols in a module.

Ok - those should be easy to sort out. I'll look at that tonight.
I haven't noticed it on my builds.

thanks,
grant


grundler <505>diff /boot/config-2.6.14-rc2-pa6 arch/parisc/configs/c3000_defconfig 
3,4c3,4
< # Linux kernel version: 2.6.14-rc2-pa5
< # Mon Oct 17 19:39:53 2005
---
> # Linux kernel version: 2.6.14-rc2-pa1
> # Sat Sep 24 18:33:00 2005
22d21
< CONFIG_LOCK_KERNEL=y
40d38
< # CONFIG_CPUSETS is not set
70d67
< CONFIG_STOP_MACHINE=y
83,84c80
< CONFIG_SMP=y
< CONFIG_HOTPLUG_CPU=y
---
> # CONFIG_SMP is not set
98d93
< CONFIG_NR_CPUS=4
916a912,913
> CONFIG_SND_AD1889=y
> # CONFIG_SND_AD1889_OPL3 is not set
939,940d935
< CONFIG_SND_AD1889=y
< # CONFIG_SND_AD1889_OPL3 is not set
1280c1275
< CONFIG_DEBUG_SLAB=y
---
> # CONFIG_DEBUG_SLAB is not set
1287d1281
< # CONFIG_DEBUG_RWLOCK is not set
grundler <506>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
