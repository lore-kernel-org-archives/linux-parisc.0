From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: PA7200 smp pb on d380 [Continue: May be ccio-dma
	also?]
Date: Fri, 14 Oct 2005 00:04:17 -0600
Message-ID: <20051014060417.GD3348@colo.lackof.org>
References: <IOC4Y4$47D21CD65D90BE54F77B218C41CF7D41@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IOC4Y4$47D21CD65D90BE54F77B218C41CF7D41@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 14, 2005 at 07:37:16AM +0200, Joel Soete wrote:
> > sr0?
> > The above change was for %r0, not %sr0.
> > Or can you point out exactly what you are referring to?
>
> Ah it was so a good question :=)
> let see so the first:
> RCS file: /var/lib/cvs/linux-2.6/drivers/parisc/ccio-dma.c,v
> retrieving revision 1.24
> retrieving revision 1.25
> diff -u -r1.24 -r1.25
> --- linux-2.6/drivers/parisc/ccio-dma.c	2005/09/11 19:47:11	1.24
> +++ linux-2.6/drivers/parisc/ccio-dma.c	2005/10/12 15:25:21	1.25
> @@ -613,7 +613,7 @@
>  	** the real mode coherence index generation of U2, the PDIR entry
>  	** must be flushed to memory to retain coherence."
>  	*/
> -	asm volatile("fdc 0(%0)" : : "r" (pdir_ptr));
> +	asm volatile("fdc %%r0(%%sr0,%0)" : : "r" (pdir_ptr));

Ah ok!

> (I agree that it was in my original proposal, you can blame me ...)

No. My bad. I should have known better.


> finaly (what confusing my tiny mind: your previous related patch just removed it):
> RCS file: /var/lib/cvs/linux-2.6/drivers/parisc/sba_iommu.c,v
> retrieving revision 1.39
> retrieving revision 1.40
> diff -u -r1.39 -r1.40
> --- linux-2.6/drivers/parisc/sba_iommu.c	2005/10/09 21:08:38	1.39
> +++ linux-2.6/drivers/parisc/sba_iommu.c	2005/10/12 15:30:28	1.40
> @@ -743,9 +743,8 @@
>  	 * (bit #61, big endian), we have to flush and sync every time
>  	 * IO-PDIR is changed in Ike/Astro.
>  	 */
> -	if (ioc_needs_fdc) {
> -		asm volatile("fdc %%r0(%0)\n\tsync" : : "r" (pdir_ptr));
> -	}
> +	if (ioc_needs_fdc)
> +		asm volatile("fdc %%r0(%%sr0,%0)" : : "r" (pdir_ptr));
>  }
> 
> 
> ====<>====
> (why I said 'resurected')

ok - I'll remove that as well. I suspect that crept in when
I switch machines and didn't properly sync the source trees.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
