From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Remove __ldcw_align for PA-RISC 2.0 processors
Date: Wed, 8 Jun 2005 23:47:00 -0600
Message-ID: <20050609054700.GA9450@colo.lackof.org>
References: <20050609050702.GB4641@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@fattire.cabal.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050609050702.GB4641@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 09, 2005 at 01:07:02AM -0400, Kyle McMartin wrote:
> The 16-byte alignment for ldcw doesn't seem to be required on PA2.0
> processors (though the details of the insn in the manual are confusing)

The PA 2.0 Arch book in fact requires it.

Jim Hull (HP PARISC/IPF Architect) published an errata later
indicating that the alignment could be relaxed to "native access"
(ie 4 byte for ldcw) if ",co" (Coherent Operation) completer was specified.
The email was dated Jan 29th, 2003.
But I can't a direct public reference of it. :^(

Just need to add ",co" to __ldcw() and we should be good.
That might need to be "ifdef CONFIG_PA20" as well...it's been
a while since we've had this conversion on parisc-linux mailing list.


> so let's get rid of it.
> 
> This is a rather nice savings:
>     text    data     bss     dec     hex filename
> 4020166 1814920  368896 6203982  5eaa4e vmlinux
> 4096278 1822416  373400 6292094  60027e vmlinux.orig

Nice indeed. :^)
I like the fact that we lose 76KB in code vs 7K+5K (data+bss).
Implies we might see a measurable perf increase in some code pathes.

> The comment on the PA2.0 case could use a little work though. :)
...
> --- include/asm-parisc/system.h	4 Jun 2005 07:11:25 -0000	1.11
> +++ include/asm-parisc/system.h	9 Jun 2005 04:23:03 -0000
...
> @@ -159,13 +161,26 @@ static inline void set_eiem(unsigned lon
>    (volatile unsigned int *) __ret;                                      \
>  })
>  
> +#else /*CONFIG_PA20*/
> +/* Apparently this architectural requirement was removed from PA2.0
> +   processors. So we'll forego the 16-byte alignment on these machines. */

You could borrow the comment from this patch:
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-November/021747.html

Looks good to me. Please commit after fixing up the comment.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
