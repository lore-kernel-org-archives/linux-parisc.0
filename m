Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 9 Feb 2003 01:26:45 -0700
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030209082645.GB31855@dsl2.external.hp.com>
References: <200302090740.AAA17008@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200302090740.AAA17008@udlkern.fc.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux grundler
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

On Sun, Feb 09, 2003 at 12:40:14AM -0700, John Marvin wrote:
> > o moved disable_sr_hash() from SMP to common code path so all
> > CPU's (including monarch) have this disabled.
> 
> Huh? You didn't seriously think the monarch still had sr hashing enabled
> did you?

sorry - I did.
I could not find where it was getting cleared for the monarch.

> Believe me, shared memory wouldn't work at all if that was the case.

ok.

> This change is wrong. init_per_cpu() is called too early for the monarch.

yup - it's before collect_boot_cpu_data(). :^(

> disable_sr_hashing() is called for the monarch in mm/init.c in
> setup_bootmem().

ugh. my bad.
I was only looking in arch/parisc/kernel/ since that's where it's defined
and was being used in the SMP case.

Can I move the disable_sr_hashing() call from setup_bootmem() to
before/after cache_init() in setup_arch()?

Please feel free to correct if you have time to muck with it.
If my damage is not backed out in the morning, I'll back it out then.

thanks for pointing out this stupidity,
grant
