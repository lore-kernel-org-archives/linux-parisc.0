From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv4 0/6] printk/ia64/ppc64/parisc64: let's deprecate
 %pF/%pf printk specifiers
Date: Sat, 11 Nov 2017 13:41:28 +0900
Message-ID: <20171111044128.GA596@tigerII.localdomain>
References: <20171109234830.5067-1-sergey.senozhatsky@gmail.com>
 <20171110181114.x22y2zr5qdf4y5za@agluck-desk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        James Bottomley <jejb@parisc-linux.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: "Luck, Tony" <tony.luck@intel.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20171110181114.x22y2zr5qdf4y5za@agluck-desk>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On (11/10/17 10:11), Luck, Tony wrote:
> On Fri, Nov 10, 2017 at 08:48:24AM +0900, Sergey Senozhatsky wrote:
> > 	All Ack-s/Tested-by-s were dropped, since the patch set has been
> > reworked. I'm kindly asking arch-s maintainers and developers to test it
> > once again. Sorry for any inconveniences and thanks for your help in
> > advance.
> 
> You can add back the:
> 
> Tested-by: Tony Luck <tony.luck@intel.com> #ia64

Thanks a ton, Tony!

	-ss
