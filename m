Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.quango.net (unknown [63.102.227.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5904482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 02:18:25 -0700 (MST)
Received: from shiftright.mail.quango.net [24.55.42.220] by quango.net [63.102.227.120]
	with SMTP (MDaemon.v3.5.1.R)
	for <parisc-linux@lists.parisc-linux.org>; Fri, 04 Jan 2002 01:11:50 -0800
Message-Id: <5.1.0.14.2.20020104011417.023b6008@mail.quango.net>
Date: Fri, 04 Jan 2002 01:18:18 -0800
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
From: Bill Ferguson <ferguson@quango.net>
In-Reply-To: <20020104085718.GB1029@marmite.its.uct.ac.za>
References: <5.1.0.14.2.20020103132428.00afee90@mail.quango.net>
 <ferguson@quango.net>
 <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net>
 <5.1.0.14.2.20020103010257.02f9c440@mail.quango.net>
 <5.1.0.14.2.20020103132428.00afee90@mail.quango.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Reply-To: ferguson@quango.net
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

At 10:57 AM 1/4/2002 +0200, you wrote:
>It doesn't matter if it's partitioned or not.  When you
>dd ... of=/dev/sda
>you overwrite the partition table anyway...
>
>--
>Michael Wood <mwood@its.uct.ac.za>


That maybe true but it didn't boot for me when I did that.  It was only 
when I deleted the partitions that it booted.

Anyone know how to get the STI console working?   It sees the two frame 
buffers in the 715, but isn't going there.    I see lots of posts in the 
archives asking this question, but not too many replies in archives with 
the answer.
