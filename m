From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCHv3 1/7] switch dereference_function_descriptor() to
 `unsigned long'
Date: Thu, 19 Oct 2017 15:50:04 +0900
Message-ID: <20171019065004.GF449@jagdpanzerIV>
References: <20170930025319.987-1-sergey.senozhatsky@gmail.com>
 <20170930025319.987-2-sergey.senozhatsky@gmail.com>
 <20171004082414.GC20084@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20171004082414.GC20084@pathway.suse.cz>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (10/04/17 10:24), Petr Mladek wrote:
[..]
> To make it clear. All these comments are not a big deal and I do
> not want to invalidate all the acked-by and tested-by just because
> of them.
>
> But please, consider removing this change if we need to do
> another iteration of this patchset. IMHO, there is no real win
> and it would just pollute the git history.

I tend to rather keep it. would that cause any problems on your side?
it saves a ton of ugly casts later in the patch set and lets us to drop
some casts from the modules code/etc. the patch is here because otherwise
I had to add a bunch of new casts.

	-ss
