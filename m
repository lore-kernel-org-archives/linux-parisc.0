From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] Re: 2.6.12-rc1-pa1 32bit panicing on c110 :-( (BUG
	in 53c700.c)
Date: Sat, 19 Mar 2005 15:44:54 -0600
Message-ID: <1111268694.5525.26.camel@mulgrave>
References: <423C9886.8030402@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <423C9886.8030402@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2005-03-19 at 21:24 +0000, Joel Soete wrote:
> scsi1: 53c710 rev 2
> scsi1 : LASI SCSI 53c700
> scsi1: (3:0) HAS NO device
> kernel BUG at /Debian-apt/SRC/linux-2.6.12-rc1-pa1-050319/drivers/scsi/53c700.c!Backtrace:

The fix is here:

http://marc.theaimsgroup.com/?l=linux-scsi&m=111125955211593

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
