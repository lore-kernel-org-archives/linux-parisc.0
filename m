From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2	optimization?
Date: Mon, 30 Jun 2008 18:28:36 +0000
Message-ID: <486925D4.7090608@scarlet.be>
References: <K324MR$1963B6E59C4D4D716463AB17911CD186@scarlet.be> <20080628202347.GA23898@colo.lackof.org> <4866BA91.9040607@scarlet.be> <20080629205242.GA7629@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080629205242.GA7629@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant,

Grant Grundler wrote:
> On Sat, Jun 28, 2008 at 10:26:25PM +0000, Joel Soete wrote:
> ...
>>> What's wrong with "ci" variable? It's just another register.
>> well the idea is that "ci" variable is just there as a tmp variable just 
>> used in this asm code, right.
>> so why not simply get rid of its declaration (btw save a line of code ;-)) 
>> and just use a common temporay reg as r19?
> 
> No - don't do that. Let the compiler do the work of allocating registers.
> It's really good at it. :)  Much better than you and I combined. :)

You and gcc already prove it to me ;-)

> All we need to do is tell the compiler we need a register.
> 
Ok

Taken also into account of David remarks, here is the latest stuff tested with success:

         __asm__ __volatile__ (
         "lci    %%r0(%%sr1, %2), %0\n"
         "\textru        %0,19,12,%0\n"
         "\tdepw         %0,15,12,%1\n"
         : "=r" (ci), "=r" (pa)
         : "r" (vba)
         );

Tx to all for kind comments, they learn me a lot ;-)

J.

> cheers,
> grant
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
