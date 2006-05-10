From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Just a question about a sba_iommu.c warning with
	gcc 64bit (but not 32bit)?
Date: Wed, 10 May 2006 16:13:14 -0400
Message-ID: <20060510201314.GL32414@skunkworks.cabal.ca>
References: <IZ1TQF$AB963885A7ABF163B254A190F47F10B6@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Parisc List <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IZ1TQF$AB963885A7ABF163B254A190F47F10B6@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, May 10, 2006 at 02:08:39PM +0200, Joel Soete wrote:
> /usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1000: warning: value
> computed is not used

lack of cast to (void)

> /usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1767: warning:
> initialization makes integer from pointer without a cast

ioc_hpa should be void __iomem *

> /usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1782: warning:
> passing argument 1 of '__raw_readq' makes pointer from integ
> er without a cast
> /usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1784: warning:
> passing argument 2 of '__raw_writeq' makes pointer from inte
> ger without a cast

rope_cfg and cfg_val should be void __iomem *

> /usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1790: warning:
> passing argument 2 of '__raw_writeq' makes pointer from inte
> ger without a cast

ioc_hpa should be void __iomem *

> /usr/src/linux-2.6.17-rc3-pa3/drivers/parisc/sba_iommu.c:1794: warning: value
> computed is not used
>

lack of cast to (void) 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
