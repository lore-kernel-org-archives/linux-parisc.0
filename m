From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Git head doesn't boot on A500
Date: Sun, 18 May 2008 14:26:03 -0600
Message-ID: <20080518202603.GA9093@colo.lackof.org>
References: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com> <20080517152623.GA26649@colo.lackof.org> <7d01f9f00805171752r4eb8ee5nbfee8f832677f792@mail.gmail.com> <20080518071342.GB26649@colo.lackof.org> <48305728.20403@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Thibaut VARENE <T-Bone@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48305728.20403@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, May 18, 2008 at 06:19:52PM +0200, Helge Deller wrote:
...
>> using ".text.head" (not .head.text) which has corresponding "code" in
>> their vmlinux.lds.  Could someone kindly point out how .head.text works 
>> for parisc?
>
> Yeah, my fault (no idea why it worked for me???).

Kyle's explanation sounds right or I expect the sections wouldn't
have been included at all (or something like that) - and maybe it
really only matters for SMP - ie getting secondary CPUs running.

> I see two options:
> 1) revert my patch (gets to linker warnings and have to build up a new 
> patch, ideally adding a section for .text.head to vmlinux.lds.S),
> 2) apply the attached patch.
>
> Opinions?

(2) works for me. I'm booting with 64-bit on a500...at least it's
now finding all the disks and attempting to mount NFS root.

>
> Helge

> diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
> index 50b4a3a..2e516b8 100644
> --- a/arch/parisc/kernel/vmlinux.lds.S
> +++ b/arch/parisc/kernel/vmlinux.lds.S
> @@ -50,6 +50,7 @@ SECTIONS
>  
>  	_text = .;		/* Text and read-only data */
>  	.text ALIGN(16) : {
> +		HEAD_TEXT

grundler <537>fgrep HEAD_TEXT include/*/*.h
include/asm-generic/vmlinux.lds.h:#define HEAD_TEXT  *(.head.text)

Yeah, I like that better than depending on *(.text) to include it.

thanks,
grant

>  		TEXT_TEXT
>  		SCHED_TEXT
>  		LOCK_TEXT

