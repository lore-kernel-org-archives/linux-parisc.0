Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust123.bre.cable.ntl.com [213.107.179.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id C29AE4842
	for <parisc-linux@parisc-linux.org>; Tue, 30 Jul 2002 06:42:13 -0600 (MDT)
Date: Tue, 30 Jul 2002 12:38:48 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Michael Wood <mwood@its.uct.ac.za>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Booting Debian on an HP C180 workstation
Message-ID: <20020730113848.GL29996@sleepie.demon.co.uk>
References: <20020730020030.40187.qmail@web12502.mail.yahoo.com> <20020730122859.GA14721@marmite.its.uct.ac.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020730122859.GA14721@marmite.its.uct.ac.za>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Jul 30, 2002 at 02:28:59PM +0200, Michael Wood wrote:
> On Mon, Jul 29, 2002 at 07:00:30PM -0700, Derek Engelhaupt wrote:
> [snip]
> > troubleshoot HP hardware.  I have dowloaded the Debian
> > palinux-0.9.3.iso.gz from http://ftp.parisc-linux.org/cd-images/ to my
> [snip]
> 
> Should people still be using 0.9.3 or should they rather use Debian 3.0
> CDs?

0.9.3 is rather dated now, so Debian 3.0 is a better choice.  You'll see
www.parisc-linux.org has been updated in the last day.  Debian 3.0 ISOs
have a 2.4.17-pa32 kernel, so there may be machines where a newer kernel
would be better.  In that case, you could look in
<ftp://ftp.parisc-linux.org/cd-images/testing/auto-isos/> where you'll
find some unofficial, lightly tested, smaller (70MB) images with recent
kernels.

Richard
