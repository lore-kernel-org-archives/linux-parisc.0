From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: ccio_mark_invalid(): would it have to clear a bit or byte?
Date: Fri, 1 Aug 2008 10:12:48 -0600
Message-ID: <20080801161248.GA22961@colo.lackof.org>
References: <4884A25C.7000902@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4884A25C.7000902@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 21, 2008 at 02:51:08PM +0000, Joel Soete wrote:
> Hello all,
>
> given this comment:
>  * Given a virtual address (vba, arg2) and space id, (sid, arg1),
>  * load the I/O PDIR entry pointed to by pdir_ptr (arg0). Each IO Pdir
>  * entry consists of 8 bytes as shown below (MSB == bit 0):
...
> and also this:
>         while (byte_cnt > 0) {
>                 /* clear I/O Pdir entry "valid" bit first */
>                 ((unsigned char *) pdir_ptr)[7] = 0;
>
> So if I well understand 'Valid' field of a pdir entry is well of 1 bit but 
> the code cleanup a all byte?

That's just a convenient way to clobber the bit we care about.
The fact that the rest of the pdir remains available is irrelevant
except for debugging (when we might dump IO Pdir to see the history.)

>
> Is coding something like:
> #define PTE_VALID_BIT_MASK      0xfffffffffffffffeULL	
>
> 		*pdir_ptr &= PTE_VALID_BIT_MASK;

That's a load/modify store of a 64-bit value.
That substantially more instructions than a single byte store.

> wouldn't do better what comment says it does?

Yes, but the comment is just describing what needs to happen, not exactly how.
The "entry valid" bit just needs to be cleared and it doesn't matter how.

hth
grant

>
> Well a short test seems to help but doesn't fix all issue:
>
> patst007 login: end_request: I/O error, dev sdl, sector 6659574
> __ratelimit: 32 messages suppressed 
> Buffer I/O error on device sdl9, logical block 193374 
> lost page write due to I/O error on sdl9 
> Buffer I/O error on device sdl9, logical block 193375 
> lost page write due to I/O error on sdl9 
> Buffer I/O error on device sdl9, logical block 193376 
> lost page write due to I/O error on sdl9 
> Buffer I/O error on device sdl9, logical block 193377 
> lost page write due to I/O error on sdl9 
> Buffer I/O error on device sdl9, logical block 193378 
> lost page write due to I/O error on sdl9 
> Buffer I/O error on device sdl9, logical block 193379 
> lost page write due to I/O error on sdl9 
> Buffer I/O error on device sdl9, logical block 193380 
> lost page write due to I/O error on sdl9
> Buffer I/O error on device sdl9, logical block 193381
> lost page write due to I/O error on sdl9
> Buffer I/O error on device sdl9, logical block 193382
> lost page write due to I/O error on sdl9
> Buffer I/O error on device sdl9, logical block 193383
>
> Tia for all advise,
> 	J.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
