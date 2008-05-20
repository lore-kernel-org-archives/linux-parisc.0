From: Helge Deller <deller@gmx.de>
Subject: Re: Git head doesn't boot on A500
Date: Tue, 20 May 2008 21:59:17 +0200
Message-ID: <48332D95.3020409@gmx.de>
References: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com> <20080517152623.GA26649@colo.lackof.org> <7d01f9f00805171752r4eb8ee5nbfee8f832677f792@mail.gmail.com> <20080518071342.GB26649@colo.lackof.org> <48305728.20403@gmx.de> <20080518202603.GA9093@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>, kyle@mcmartin.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080518202603.GA9093@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Sun, May 18, 2008 at 06:19:52PM +0200, Helge Deller wrote:
...
> (2) works for me. I'm booting with 64-bit on a500...at least it's
> now finding all the disks and attempting to mount NFS root.
> 
>> diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
>> index 50b4a3a..2e516b8 100644
>> --- a/arch/parisc/kernel/vmlinux.lds.S
>> +++ b/arch/parisc/kernel/vmlinux.lds.S
>> @@ -50,6 +50,7 @@ SECTIONS
>>  
>>  	_text = .;		/* Text and read-only data */
>>  	.text ALIGN(16) : {
>> +		HEAD_TEXT
> 
> grundler <537>fgrep HEAD_TEXT include/*/*.h
> include/asm-generic/vmlinux.lds.h:#define HEAD_TEXT  *(.head.text)
> 
> Yeah, I like that better than depending on *(.text) to include it.

So, this is the way to go ?
Should I clean up the patch and send to Linus, or Kyle, will you do that 
anyway with other patches?
I think this really should go into 2.6.26.

Helge

