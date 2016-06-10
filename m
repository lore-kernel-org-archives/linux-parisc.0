From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v4] parisc: add <asm/hash.h>
Date: Fri, 10 Jun 2016 21:15:54 +0200
Message-ID: <575B11EA.6030300@gmx.de>
References: <20160610032318.32173.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: George Spelvin <linux@sciencehorizons.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160610032318.32173.qmail@ns.sciencehorizons.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10.06.2016 05:23, George Spelvin wrote:
> Helge Deller wrote:
>>> +	a += c << 3;		_ASSIGN(b, b << 7+31, "X" (c), "X" (d));
>>
>> This line produces compiler warnings:
> 
> Thanks for catching that.
> 
>> So, please add
>> Acked-by: Helge Deller <deller@gmx.de>
> 
> Done and pushed out to git://ftp.sciencehorizons.net/linux.git hash
> 
> Would you like to take it via the PA-RISC tree?

Yes, I will take it through the parisc tree.

Helge

