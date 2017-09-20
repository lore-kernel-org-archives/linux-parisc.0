From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [RFC][PATCH v2 7/7] checkpatch: add pF/pf deprecation warning
Date: Thu, 21 Sep 2017 01:33:24 +0900
Message-ID: <20170920163324.GB502@tigerII.localdomain>
References: <20170920162910.32053-1-sergey.senozhatsky@gmail.com>
 <20170920162910.32053-9-sergey.senozhatsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20170920162910.32053-9-sergey.senozhatsky@gmail.com>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (09/21/17 01:29), Sergey Senozhatsky wrote:
> We deprecated '%pF/%pf' printk specifiers, since '%pS/%ps' is now smart
> enough to handle function pointer dereference on platforms where such
> dereference is required.
> 
> checkpatch warning example:
> 
> WARNING: Use '%pS/%ps' instead. This pointer extension was deprecated: '%pF'

weird... somehow I sent this patch twice. please ignore this one.

	-ss
