From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: Sat, 20 Nov 2004 16:42:01 -0700
Message-ID: <20041120234201.GD11503@colo.lackof.org>
References: <20041116063733.GA27633@colo.lackof.org>
	<20041116150748.GI26623@parcelfarce.linux.theplanet.co.uk>
	<20041116160939.GB4176@colo.lackof.org>
	<20041116163403.GJ26623@parcelfarce.linux.theplanet.co.uk>
	<20041116181427.GG4176@colo.lackof.org>
	<419FC7C4.5030606@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <419FC7C4.5030606@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 20, 2004 at 10:40:04PM +0000, Joel Soete wrote:
> It seems to also help c110 pb with ncr53c710:
> a big apt-get upgrade + 2 tar in //

I'm guessing the problem is the ncr53c8xx driver does NOT call
dma_set_mask(). PCI devices by default get a 32-bit mask.
I'll commit a patch so that's true for "parisc" (ie GSC) devices
as well. EISA device drivers will need to set an appropriate dma mask.
-pa17 should be ready shortly.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
