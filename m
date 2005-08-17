From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] CONFIG_PDC_NARROW leftover in sba_iommu.c
Date: Wed, 17 Aug 2005 00:57:12 -0600
Message-ID: <20050817065712.GD8761@colo.lackof.org>
References: <4302CBAD.3010506@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kurt Fitzner <kfitzner@excelcia.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4302CBAD.3010506@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 16, 2005 at 11:31:25PM -0600, Kurt Fitzner wrote:
> While investigating why I couldn't get a 64 bit kernel to boot on my
> machine, I discovered that there is a holdout use of the old
> CONFIG_PDC_NARROW config option.
> 
> It occurs in drivers/parisc/sba_iommu.c, line 108.

Thanks for pointing that out. I'll see if I can clean that up.


> I'm not sure if this is in any way critical or not.

It's not. C160 will need ccio driver, not sba driver.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
