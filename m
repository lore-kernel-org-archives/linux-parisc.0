Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 450DC484B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 14:47:50 -0600 (MDT)
Message-ID: <3F57A50B.8050504@tiscali.be>
Date: Thu, 04 Sep 2003 20:48:11 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
References: <3F5728AB.3040501@hrzpub.tu-darmstadt.de>
In-Reply-To: <3F5728AB.3040501@hrzpub.tu-darmstadt.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
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

Ruediger Scholz wrote:

> Hi there,
>
> I tried to boot 2.6.0-test4-pa8 on my HP 715/100, but it crashed right 
> after the message "Freeing unused kernel memory...". I'm using debian 
> testing with devfs and gcc-3.3.1.
> I think the pb is devfs, so I will try to boot a kernel without it.
> Bootlog is attached, Config, System.map is here: 
> http://rscholz.bluehash.de/parisc

May I ask you how do you build your .config?
I presume that it is a custom one if you tried devfs. hmm isn't it 
obsolete now?

iirc i encounter the same pb with my b2k. I find a work around by 
accident: removing all kind of console (pdc, serial) make it boot. I 
tried to obtain a patch for a network console for 2.6 but without success :(

Sorry to be not more helpfull but even a toc didn't help to analyse this 
pb :(

Thanks for info,
    Joel
