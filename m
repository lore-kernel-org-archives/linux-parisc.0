From: Kumar Gala <kumar.gala@freescale.com>
Subject: Re: [parisc-linux] [PATCH 07/15] parisc: remove use of asm/segment.h
Date: Wed, 24 Aug 2005 12:31:11 -0500
Message-ID: <C8230D03-D0D9-4096-A995-0C1E124F665D__6592.80028562552$1416624560$gmane$org@freescale.com>
References: <20050824171433.GD4645@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0 (Apple Message framework v734)
Content-Type: text/plain;
  charset=US-ASCII;
  delsp=yes;
  format=flowed
Cc: "Gala Kumar K.-galak" <galak@freescale.com>,
 <linux-kernel@vger.kernel.org>,
 "Andrew Morton" <akpm@osdl.org>,
 <parisc-linux@parisc-linux.org>
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20050824171433.GD4645@parcelfarce.linux.theplanet.co.uk>
List-Id: linux-parisc.vger.kernel.org


On Aug 24, 2005, at 12:14 PM, Matthew Wilcox wrote:

> On Wed, Aug 24, 2005 at 11:55:30AM -0500, Kumar Gala wrote:
>
>> Removed asm-parisc/segment.h as its not used by anything.
>>
>
> Did you already remove all the uses outside the parisc-specific  
> bits of
> the tree, eg ISDN, media/video/, sound/oss/, etc?
>
> If so, ACK, otherwise, NAK.

I did remove them.  I should have included a reference to the patch  
that did this:

http://www.ussg.iu.edu/hypermail/linux/kernel/0508.3/0099.html

- kumar
