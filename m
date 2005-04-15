From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] D380: ccio-dma issue for 64bit kernel?
Date: Fri, 15 Apr 2005 09:22:05 -0500
Message-ID: <1113574926.5009.6.camel@mulgrave>
References: <420889870001AEAE@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <420889870001AEAE@mail-4-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2005-04-15 at 11:44 +0200, Joel Soete wrote:
> ncr53c720-0: rev 0xf irq 66
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> scsi0 : ncr53c8xx-3.4.3g
> scsi: Device offlined - not ready after error recovery: host 0 channel 0
> id 0 lu

This too is known.  The ncr53c8xx driver doesn't work in 64 bit mode.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
