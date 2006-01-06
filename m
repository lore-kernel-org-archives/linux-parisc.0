From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] gcc-hppa64 compilers
Date: Fri, 06 Jan 2006 09:10:08 -0600
Message-ID: <1136560208.3528.4.camel__22297.5227669396$1416623977$gmane$org@mulgrave>
References: <17341.56304.198509.175260@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Matthias Klose <doko@cs.tu-berlin.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17341.56304.198509.175260@gargle.gargle.HOWL>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, 2006-01-06 at 03:54 +0100, Matthias Klose wrote:
> Which gcc-X.Y-hppa64 variants are still needed for Debian sid/etch?
> Currently compilers are built for 3.3, 3.4, 4.0 and 4.1, the latter
> one for experimental. Is it time to drop some of these?

We use the hppa64 compilers only for generating our kernels.  Most of my
64 bit kernels are currently built with 3.4.5-1 so I wouldn't have
strenuous objections to removing 3.3;  For 4.0 and 4.1, you need to ask
John David Anglin <dave@hiauly1.hia.nrc.ca> because I think these
compilers are still under suspicion of not generating correct code for
parisc64.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
