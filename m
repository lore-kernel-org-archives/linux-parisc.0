Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C81BF482A
	for <parisc-linux@parisc-linux.org>; Thu, 20 Dec 2001 01:18:16 -0700 (MST)
Received: from marmite.its.uct.ac.za ([137.158.26.155])
	by mail.uct.ac.za with esmtp (Exim 3.33 #4)
	id 16GyQy-0008Wb-00
	for parisc-linux@parisc-linux.org; Thu, 20 Dec 2001 10:20:08 +0200
Date: Thu, 20 Dec 2001 10:17:52 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] LibC errors on C180 install
Message-ID: <20011220081752.GA29993@marmite.its.uct.ac.za>
References: <Pine.LNX.4.33.0112191033240.1400-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0112191033240.1400-100000@goliath.alaskatech.org>
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

On Wed, Dec 19, 2001 at 10:51:41AM -0900, Tom wrote:
> Interesting - C180, 4G FWSCSI.5, Plextor CD SESCSI.5, 0.93
> ISO. On install I had a segfault in the base-config, which
> bombed the rest of the install.  Manually added FTP, pulled
> the latest kernel, reboot and now I can get APT etc to run,
> but every time it tries to update libc6 I get an error -
> "unable to stat './usr/lib/gconv/CP1251.so' (which I was about
> to install): Value too large for defined data type", then
> libc6 fails to install.

Might be fs corruption.  I got a similar error on a corrupted
filesystem:

(Reading database ... 6812 files and directories currently installed.)
Preparing to replace libc6 2.2.4-3 (using .../libc6_2.2.4-7_hppa.deb) ...
Unpacking replacement libc6 ...
dpkg: error processing /var/cache/apt/archives/libc6_2.2.4-7_hppa.deb (--unpack):
 unable to stat `./usr/share/zoneinfo/Australia/Lindeman' (which I was about to install): Input/output error
dpkg-deb: subprocess paste killed by signal (Broken pipe)
Errors were encountered while processing:
 /var/cache/apt/archives/libc6_2.2.4-7_hppa.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)

And:

# ls -l /usr/share/zoneinfo/Australia/Lindeman 
ls: /usr/share/zoneinfo/Australia/Lindeman: Input/output error

After forcing an fsck on the relevant filesystem, it worked much
better :)

-- 
Michael Wood <mwood@its.uct.ac.za>
