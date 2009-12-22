From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: add strict copy size checks
Date: Wed, 23 Dec 2009 00:21:04 +0100
Message-ID: <4B315460.6090007@gmx.de>
References: <20091222225649.GA7050@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091222225649.GA7050@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/22/2009 11:56 PM, Helge Deller wrote:
> Add CONFIG_DEBUG_STRICT_USER_COPY_CHECKS, copied from the x86
> implementation.
> [...PATCH...]

Kyle,

please don't apply yet.
It will break the 64bit build.
Nevertheless, it brings up some code areas which would need
investigation...

Helge
