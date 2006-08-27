From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] What happen to the Penguin
Date: Sun, 27 Aug 2006 19:30:45 -0400
Message-ID: <20060827233044.GA6394@athena.road.mcmartin.ca>
References: <20060630184210.GE27102@athena.road.mcmartin.ca>
	<200608272121.k7RLLh0F018554@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200608272121.k7RLLh0F018554@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 27, 2006 at 05:21:43PM -0400, John David Anglin wrote:
> This happened between 2.6.17-rc3-pa3 and 2.6.17-rc4-pa0.  Removing
> the unsupported A1262A allowed 2.6.17-pa6 to boot.  It doesn't boot
> with the card installed.  This is using the c3000_defconfig kernels.
> 

Can you remove the PCI_DEVICE(...) lines with PCI_DEVICE_HP_VISUALIZEFX*
in drivers/video/console/sticore.c and see what happens? That should
at least allow them to boot.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
