From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] C3000 HPMC with high NFS traffic. 99% it's ASTRO's
Date: 13 Aug 2004 13:06:58 -0400
Message-ID: <1092416823.2186.70.camel@mulgrave>
References: <200408131656.i7DGuWF19777@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Stan Sieler <sieler@allegro.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408131656.i7DGuWF19777@opus.allegro.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2004-08-13 at 12:56, Stan Sieler wrote:
> If it helps, the instruction trapping appears to be:
>     LDWAX    0(0,19),19
> and r19 has fed30000 ... an I/O space address.

Actually that's the back end of a LBA I/O cycle generation (this is the
actual read that guarantees completion semantics---see lba_pci.c).  The
HPMC occurred because port 0x1008 timed out on an outl, I think.

That's tulip register CSR1 (i.e. the tulip driver was trying to force an
immediate transmit).  I assume this must be either because the tulip
failed to respond to the outl in time or because the Astro couldn't get
on the bus in time.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
