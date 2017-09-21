From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [RFC][PATCH v2 7/7] checkpatch: add pF/pf deprecation warning
Date: Thu, 21 Sep 2017 16:43:51 +0900
Message-ID: <20170921074351.GC773@jagdpanzerIV.localdomain>
References: <20170920162910.32053-1-sergey.senozhatsky@gmail.com>
 <20170920162910.32053-8-sergey.senozhatsky@gmail.com>
 <1505929138.12311.5.camel@perches.com>
 <ddf9b54b-34d9-c1e2-e34f-a1cc055b8cf7@gmx.de>
 <1505931868.12311.7.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Andy Whitcroft <apw@canonical.com>
To: Helge Deller <deller@gmx.de>, Joe Perches <joe@perches.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <1505931868.12311.7.camel@perches.com>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (09/20/17 11:24), Joe Perches wrote:
> On Wed, 2017-09-20 at 19:53 +0200, Helge Deller wrote:
[..]
> > Is it worth to mention, that it's still needed in older kernels?
> > Just in case some patch get's backported.

good question.

> I think probably not.
> 
> There are relatively few references and
> modifications are unlikely to be backported.

I tend to agree.

unlikely anyone backports printk message updates. I have quickly glanced
through stable-4.9 and haven't seen such backports. well, may be there
are some.

can tweak the warning a bit, probably. e.g. "if you are planning to
backport your change to kernels older than 4.14 then ignore this
warning". but not sure if it's worth it.

	-ss
