From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: backport sba change to ccio
Date: Thu, 3 Mar 2005 22:03:24 -0700
Message-ID: <20050304050324.GA30252@colo.lackof.org>
References: <4208898700009474@mail-4-bnl.tiscali.it>
	<42271F19.6010406@tiscali.be>
	<20050303154531.GA18286@colo.lackof.org>
	<20050303155332.GG28741@parcelfarce.linux.theplanet.co.uk>
	<20050303170405.GC18286@colo.lackof.org>
	<4227575A.4060901@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4227575A.4060901@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Mar 03, 2005 at 06:28:42PM +0000, Joel Soete wrote:
> >replace ioc_count in just that one context with
> >	count_parisc_drivers(ccio_driver)
...
> -/* Ratio of Host MEM to IOV Space size */
> -static unsigned long ccio_mem_ratio = 4;
>  static struct ioc *ioc_list;
> -static int ioc_count;
> +static int ioc_count = 0;
> +static int global_ioc_cnt = 0;

You won't need global_ioc_cnt.
Just call count_parisc_drivers() every time.
It's walking a short list and hopefully gives back
the same result everytime.

> 
>  /**************************************************************
>  *
> @@ -559,7 +558,7 @@
>  ccio_io_pdir_entry(u64 *pdir_ptr, space_t sid, unsigned long vba,
>  		   unsigned long hints)
>  {
> -	register unsigned long pa = (volatile unsigned long) vba;
> +	register unsigned long pa;
>  	register unsigned long ci; /* coherent index */
> 
>  	/* We currently only support kernel addresses */
> @@ -1269,17 +1268,16 @@
>  	** Hot-Plug/Removal of PCI cards. (aka PCI OLARD).
>  	*/
> 
> +	iova_space_size = (u32) (num_physpages / global_ioc_cnt);

call count_parisc_drivers() here instead of global_ioc_cnt.

> -/* We *can't* support JAVA (T600). Venture there at your own risk. */
> -static struct parisc_device_id ccio_tbl[] = {
> -	{ HPHW_IOA, HVERSION_REV_ANY_ID, U2_IOA_RUNWAY, 0xb }, /* U2 */
> -	{ HPHW_IOA, HVERSION_REV_ANY_ID, UTURN_IOA_RUNWAY, 0xb }, /* UTurn */
> -	{ 0, }
> -};

Yeah, you'll have to move this (and related bits) further up.

> that boot fine and no more crash after stress test :-)
> (I hope the same results with previous disk failing ;-)

Very good. At least we are on the right track.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
