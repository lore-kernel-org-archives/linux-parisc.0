From: Helge Deller <deller@gmx.de>
Subject: Re: missing compat_sys_ptrace conversions for mips and parisc
Date: Sun, 17 Aug 2008 13:14:34 +0200
Message-ID: <48A8081A.4080609@gmx.de>
References: <20080817022924.GA23625@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-mips@linux-mips.org, linux-parisc@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080817022924.GA23625@lst.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Christoph Hellwig wrote:
> Currently mips and parisc are the only architectures not yet converted
> to the generic compat_sys_ptrace.  The conversion is rather trivial and
> only involves splitting the current compat_ptrace handler into a
> compat_arch_ptrace with all the meat and the existing compat_sys_ptrace
> that does all the boilerplate code, just like the generic sys_ptrace.
> To get the generic compat_sys_ptrace you have to add a
> 
> 	#define __ARCH_WANT_COMPAT_SYS_PTRACE
> 
> to ptrace.h for now, but once mips and parisc are converted this will of
> course be removed.  Take a look at the powerpc conversion as an example:
> 
> 	http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git&a=commitdiff&h=81e695c026eeda9a97e412fa4f458e5cab2f6c85

I could take care of this for parisc. Just looked into the code and it 
seems it could cleanup the code nicely as well.

But I don't want to step on Kyle's toe, since I assume he prepares the 
asm-parisc/ move in the parisc-2.6 git tree during the next days.

Kyle: any comments? Should I prepare some patches? Or do you want to 
take care of the compat_sys_ptrace yourself?

Helge

