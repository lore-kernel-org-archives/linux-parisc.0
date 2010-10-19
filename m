From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: scsi_wait_scan doesn't wait
Date: Tue, 19 Oct 2010 19:04:06 -0400
Message-ID: <AANLkTi=qHF8D9BZVnQK5_jo+kNLSLcTQ4OuAy3PHpU_b@mail.gmail.com>
References: <4CBD102F.2040705@logix.net.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Michal Ludvig <mludvig@logix.net.nz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CBD102F.2040705@logix.net.nz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 18, 2010 at 11:27 PM, Michal Ludvig <mludvig@logix.net.nz> wrote:
> I'm having a problem with 2.6.36-rc8+ on HP PARISC machine (HP 9000
> RP3410) where I intend to wait for SCSI enumeration during boot before
> LVM2 kicks in and attempts to activate the root volume. I modprobe
> scsi_wait_scan in the initramdisk before lvm2 script is run. However the
> modprobe doesn't wait. I'm on Debian testing, fwiw.

If you're interested in helping, the best thing you could do is back
up to a kernel that works and then try to track down what commit broke
the wait scan. It's a bit tedious, but fairly easy.

Cheers,
Carlos.
