From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [parisc] 2.6.24-rc3 (64-bit,
	smp) fails to boot on 9000/785/J5600
Date: Tue, 27 Nov 2007 11:45:27 -0500
Message-ID: <20071127164527.GA28891__9947.95984956927$1416624450$gmane$org@fattire.cabal.ca>
References: <200711271026.34863.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Frans Pop <elendil@planet.nl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200711271026.34863.elendil@planet.nl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Nov 27, 2007 at 10:26:34AM +0100, Frans Pop wrote:
> v2.6.24-rc3-19-g2ffbb83 fails very early in the boot procedure.
> 2.6.23 compiled with similar config boots fine.
> 
> System is running Debian unstable; kernel was compiled using gcc 4.1.2.
> 

Ah, I diagnosed this last week. Will post the patch in a bit.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
