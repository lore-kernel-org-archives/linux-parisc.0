From: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCHv3 7/7] checkpatch: add pF/pf deprecation warning
Date: Wed, 4 Oct 2017 14:08:47 +0200
Message-ID: <20171004120847.GI20084@pathway.suse.cz>
References: <20170930025319.987-1-sergey.senozhatsky@gmail.com>
 <20170930025319.987-8-sergey.senozhatsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Steven Rostedt <rostedt@goodmis.org>,
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
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170930025319.987-8-sergey.senozhatsky@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat 2017-09-30 11:53:19, Sergey Senozhatsky wrote:
> We deprecated '%pF/%pf' printk specifiers, since '%pS/%ps' is now smart
> enough to handle function pointer dereference on platforms where such
> dereference is required.
> 
> checkpatch warning example:
> 
> WARNING: Deprecated vsprintf pointer extension '%pF' - use %pS instead
> 
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Joe Perches <joe@perches.com>
> Cc: Andy Whitcroft <apw@canonical.com>
> Tested-by: Helge Deller <deller@gmx.de> # parisc64
> Tested-by: Santosh Sivaraj <santosh@fossix.org> # powerpc64
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> # powerpc64
> Tested-by: Tony Luck <tony.luck@intel.com> # ia64

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
