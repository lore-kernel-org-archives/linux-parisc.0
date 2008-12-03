From: Helge Deller <deller@gmx.de>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Wed, 03 Dec 2008 21:41:00 +0100
Message-ID: <4936EEDC.1000908@gmx.de>
References: <4932FFB7.4040506@gmx.de>	 <20081201000013.349294DF8@hiauly1.hia.nrc.ca> <7d01f9f00812010254s3bf845cr8e2b35fe2dedc125@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, gmsoft@tuxicoman.be,
	carlos@systemhalted.org, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00812010254s3bf845cr8e2b35fe2dedc125@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thibaut VARENE wrote:
> On Tue, Dec 2, 2008 at 1:00 AM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> 
>> Are there some standard 32 and 64 bit defines for format strings?  Or, do we
>> always want 16 hex digits?
> 
> In traps.c we used to do this for the regs dump:
> 
> #ifdef __LP64__
> #define RFMT "%016lx"
> #else
> #define RFMT "%08lx"
> #endif
> 
> and then sprintf(p, " " RFMT, (i+j) == 0 ? 0 : regs->gr[i + j]);
> 
> I guess a similar trick could do, to some extent?

An alternative possibility would be to use pointers, e.g.
printk("addr 0x%p\n", (void *)x);
That way it would 32 or 64bit addresses, depending if we have a 32 or 
64bit kernel.

Helge
