Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8F87482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 01:57:30 -0700 (MST)
Date: Fri, 4 Jan 2002 10:57:18 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20020104085718.GB1029@marmite.its.uct.ac.za>
References: <ferguson@quango.net> <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net> <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net> <5.1.0.14.2.20020103132428.00afee90@mail.quango.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.2.20020103132428.00afee90@mail.quango.net>
Subject: [parisc-linux] Re: Upgrading 715/100 Firmware
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

On Thu, Jan 03, 2002 at 01:27:04PM -0800, Bill Ferguson wrote:
> Now that worked!   My firmware is up to date!
> 
> Disk has to "raw" unpartitioned.   Thanks Grant!  I'll now
> write that FAQ for booting firmware I promised!

It doesn't matter if it's partitioned or not.  When you
dd ... of=/dev/sda
you overwrite the partition table anyway...

-- 
Michael Wood <mwood@its.uct.ac.za>
