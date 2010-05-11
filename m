From: Helge Deller <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 11 May 2010 22:41:34 +0200
Message-ID: <4BE9C0FE.80509@gmx.de>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net> <20100419162653.GA106@hiauly1.hia.nrc.ca> <4BCDEB6E.1060408@gmx.de> <20100509124339.GA6797@hiauly1.hia.nrc.ca> <20100510095632.173760@gmx.net> <20100510145648.GA13452@hiauly1.hia.nrc.ca> <4BE85C82.4080202@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BE85C82.4080202@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/10/2010 09:20 PM, Helge Deller wrote:
> On 05/10/2010 04:56 PM, John David Anglin wrote:
>> Yes, just after sending, I noticed gcc testsuite and minifail were
>> broken on gsyprf11.  [...]
>>
>> The attached works better on gsyprf11.  I haven't tested it on anything
>> else.

Hi Dave,

I still can see segfaults of the minifail_dave.cpp program.

In addition I see some memory corruptions.
Those corruptions are not new due to your patch, I could see them with
other patches (and maybe even plain 2.6.32.3 kernel) as well...

pagealloc: memory corruption

6e8291c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

6e8291d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

6e8291e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

6e8291f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

Backtrace:

 [<1011ebc4>] show_stack+0x18/0x28

 [<10117b90>] dump_stack+0x1c/0x2c

 [<101c7020>] kernel_map_pages+0x2a0/0x2b8

 [<1019ebc8>] get_page_from_freelist+0x3d4/0x630

 [<1019ef58>] __alloc_pages_nodemask+0x134/0x610

 [<101b23d8>] do_wp_page+0x2c0/0xb50

 [<101b4290>] handle_mm_fault+0x514/0x844

 [<1011d870>] do_page_fault+0x1f8/0x2fc

 [<1011f400>] handle_interruption+0xec/0x730

 [<10103078>] intr_check_sig+0x0/0x40


Helge
