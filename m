From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCHv3] Implement gcc 64bit atomic operations and fix the broken
 8/16 bit ones
Date: Mon, 15 Sep 2014 23:17:44 +0200
Message-ID: <54175778.3060809@gmx.de>
References: <507b1e2873b0724964068ba2b4159b6d@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Guy Martin <gmsoft@tuxicoman.be>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <507b1e2873b0724964068ba2b4159b6d@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Guy,

On 09/12/2014 06:02 PM, Guy Martin wrote:
> Here is the latest set of patch for the 8/16/64 bit atomic gcc builtins.
>
> On the kernel side a new LWS is implemented allowing for variable size CAS.
> On gcc's side, the new LWS is used for 8/16/64 bit atomic builtins, keeping the old LWS for 32bit ops.
> Since 8 and 16 bit ops were broken, it's best to use the new LWS unconditionally for these.

I've pushed your kernel patch upstream for kernel 3.17.
Furthermore I've scheduled it for backporting into kernels >= 3.13.
I would have liked to go back to kernel 3.0, but then more patches would have needed to be backported.

Maybe someone now can start to push the gcc patch upstream?

Thanks!
Helge
