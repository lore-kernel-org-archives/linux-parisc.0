From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: add strict copy size checks
Date: Sat, 26 Dec 2009 12:32:16 -0500
Message-ID: <20091226173216.GG11593@bombadil.infradead.org>
References: <20091222225649.GA7050@p100.box> <4B315460.6090007@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B315460.6090007@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 23, 2009 at 12:21:04AM +0100, Helge Deller wrote:
> On 12/22/2009 11:56 PM, Helge Deller wrote:
>> Add CONFIG_DEBUG_STRICT_USER_COPY_CHECKS, copied from the x86
>> implementation.
>> [...PATCH...]
>
> Kyle,
>
> please don't apply yet.
> It will break the 64bit build.
> Nevertheless, it brings up some code areas which would need
> investigation...
>

Ok, cool.
