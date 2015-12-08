From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 1/3] parisc: Disable huge pages on Mako machines
Date: Mon, 7 Dec 2015 21:03:21 -0500
Message-ID: <E384F76A-0424-4237-8624-3761A2EA68F0@bell.net>
References: <1449434613-32214-1-git-send-email-deller@gmx.de> <5665A221.5050309@bell.net> <5665F7CE.3010209@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5665F7CE.3010209@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-07, at 4:19 PM, Helge Deller wrote:

>> Where do the non equivalent addresses come from?
> 
> I think the main problem is the gateway page.
> It's mapped at address 0 into userspace, but needs to jump into kernel space too.
> This somehow breaks the huge page mapping.

With latest debian kernel, I see:

000000004015d000 <linux_gateway_page>:
        ...

000000004015d0b0 <lws_entry>:

Possibly, this needs to be aligned to huge page boundary.

Dave
--
John David Anglin	dave.anglin@bell.net



