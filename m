From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: RFC arch/sh/kernel/traps_64.c - unclear if/else construct (hpux
 compat layer)
Date: Tue, 17 Feb 2015 09:49:27 +0100
Message-ID: <1424162967.7082.7.camel@x220>
References: <20150203093758.GA27963@opentech.at> <54E2600F.9060502@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Valentin Rothberg <valentinrothberg@gmail.com>,
	Nicholas Mc Guire <der.herr@hofr.at>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E2600F.9060502@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On Mon, 2015-02-16 at 22:24 +0100, Helge Deller wrote:
> The hpux code is broken anyway.
> I'm going to remove it from the tree.

That happened in commit 04c161497716 ("parisc: hpux - Drop support for
HP-UX binaries"), which is included in today's linux-next
(next-20150217). I noticed because a script I use to check linux-next
spotted a problem with it.

That commit removed the Kconfig symbol HPUX. As a result BINFMT_SOM (see
fs/Kconfig.binfmt) can't be set anymore. I assume a patch to remove that
symbol too is also part of that series. Is that correct?


Paul Bolle
