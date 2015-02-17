From: Helge Deller <deller@gmx.de>
Subject: Re: RFC arch/sh/kernel/traps_64.c - unclear if/else construct (hpux
 compat layer)
Date: Tue, 17 Feb 2015 16:15:11 +0100
Message-ID: <54E35AFF.3030206@gmx.de>
References: <20150203093758.GA27963@opentech.at> <54E2600F.9060502@gmx.de> <1424162967.7082.7.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Valentin Rothberg <valentinrothberg@gmail.com>,
	Nicholas Mc Guire <der.herr@hofr.at>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1424162967.7082.7.camel@x220>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

H Paul,

On 17.02.2015 09:49, Paul Bolle wrote:
> On Mon, 2015-02-16 at 22:24 +0100, Helge Deller wrote:
>> The hpux code is broken anyway.
>> I'm going to remove it from the tree.
>
> That happened in commit 04c161497716 ("parisc: hpux - Drop support for
> HP-UX binaries"), which is included in today's linux-next
> (next-20150217).

Yes.

> That commit removed the Kconfig symbol HPUX. As a result BINFMT_SOM (see
> fs/Kconfig.binfmt) can't be set anymore. I assume a patch to remove that
> symbol too is also part of that series. Is that correct?

I missed it, but just sent out a patch to remove BINFMT_SOM too.
It will be in the next linux-next tree via
http://git.kernel.org/cgit/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next

Helge

