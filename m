From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv3 6/7] symbol lookup: use new kernel and module
 dereference functions
Date: Mon, 23 Oct 2017 17:38:04 +0900
Message-ID: <20171023083804.GA32339@tigerII.localdomain>
References: <20170930025319.987-1-sergey.senozhatsky@gmail.com>
 <20170930025319.987-7-sergey.senozhatsky@gmail.com>
 <20171004115306.GH20084@pathway.suse.cz>
 <20171019064235.GB449@jagdpanzerIV>
 <20171020130848.GC22070@pathway.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
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
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171020130848.GC22070@pathway.suse.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (10/20/17 15:08), Petr Mladek wrote:
> On Thu 2017-10-19 15:42:35, Sergey Senozhatsky wrote:
> > Sorry for the delay and thanks for taking a look.
> > 
> > I'll try to re-spin the patch set by the end of this week/early next
> > week.
> > 
> > 
> > On (10/04/17 13:53), Petr Mladek wrote:
> > [..]
> > > Note that kallsyms_lookup() and module_address_lookup() is used
> > > in many other situations.
> > 
> > we dereference only things that can be dereferenced.
> > so calling it on already dereferenced address, or address
> > that does need to be dereferenced is OK.
> 
> My concern is that it changes the behavior. It will suddenly return
> another information for addresses that were not dereference before.

OK. I'd be really-really surprised to find out that anyone did
kallsyms_lookup()/module_address_lookup() on func descriptors,
but I understand your concerns. I'll try to keep everything
within vsprintf().

	-ss
