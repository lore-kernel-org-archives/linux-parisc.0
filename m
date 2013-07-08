From: Alex Ivanov <gnidorah@p0n4ik.tk>
Subject: Re: Gentoo boot on C8000 (was: Re: PARISC Linux website and status update)
Date: Mon, 8 Jul 2013 12:31:22 +0000 (UTC)
Message-ID: <loom.20130708T135706-644@post.gmane.org>
References: <201304241944.r3OJirJv009740@arbas.nms.ulrich-teichert.org> <1725746.7h2TmhW5F7@eto> <CAEdQ38HjaLRMa_0f=qjVa84-xmerQvmsLH0OBdHxeRReOKQuyw@mail.gmail.com> <5178EBC5.2050607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Graham Gower <graham.gower <at> gmail.com> writes:

> Looks rather similar.
> 
> burke:~# modprobe radeon
> ...
> [  531.016000] BUG: soft lockup - CPU#3 stuck for 22s! [bash:2745]
> ...
> [  533.364000] Kernel panic - not syncing: softlockup: hung tasks

Same here at c8000 with firegl x3, running unstable Debian with vanilla 
3.10 kernel. Does anyone know a solution?



