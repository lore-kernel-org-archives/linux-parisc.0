Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0D654829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 13:41:29 -0600 (MDT)
Message-ID: <3D824E32.2060301@freebel.net>
Date: Fri, 13 Sep 2002 20:44:34 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Making SYM2 default SYM-SCSI driver instead of
 SYM1
References: <3D8212E7.6000609@esiee.fr>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Thibaut,

Thibaut VARENE wrote:
> Hi fellows !
> 
> Paul Bame has noticed a problem that seems to occur on B2600 with SYM1 
> driver, causing the box to slow down everything and increasing the 
> loadavg, while top reports 99% idle.
> 
> When this happens, one can hear HD making strange noise: two grouped 
> "ticks" every 2 seconds or so.
> 
> I have experienced this behavior by myself, and it seems that using SYM2 
> driver solves this problem.

At a moment it solved also this problem of disk on my b2k. So for 
severall month now, I use only SYM2 on this b2k.

More over as on a b180 I notice that SYM2 driver could also be used 
also, I test it with same success.

(sorry I could not any more test on 712)

Good idea,
	Joel
