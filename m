Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E0974840
	for <parisc-linux@parisc-linux.org>; Tue, 18 Nov 2003 11:28:36 -0700 (MST)
Date: Tue, 18 Nov 2003 18:28:27 +0000
Message-ID: <3FB265EC0000392B@ocpmta3.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0311181014220.5439@brain.fop.ns.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Processes stuck in D state on 715/100XC with 2.4.22-pa17
To: "Steve Bromwich" <lists@fop.ns.ca>, parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Steve,

The toc 'process' don't display anything (excepted may be on lcd). To see
'piminfo', you should interupt the boot and collect the 'piminfo' (iirc >
ser pim).

hth,
    Joel

PS: btw which glibc is installed on your system?

>-- Original Message --
>From: Steve Bromwich <lists@fop.ns.ca>
>To: parisc-linux@parisc-linux.org
>Date: Tue, 18 Nov 2003 10:24:56 -0400 (AST)
>Subject: [parisc-linux] Processes stuck in D state on 715/100XC with 2.4.22-pa17
>
>
>Hi,

I installed 2.4.22-pa17 on my machine over the weekend, and I'm getting
processes stuck in D state. The machine usually runs for several hours
without any problem, but then processes start dying, apparently fairly
randomly, the load goes up, 
>nd vmstat shows CPU as near 100% idle. I
*think* it's something to do with writing to the drive, since one of the
first things to die is syslogging. Anything that doesn't touch the drive
(eg, IRC clients) seem to run forever. One thing that really k
>lls it
seems to be daily maintenance around 6am; I can see mail being delivered
until then, and after that it queues on my backup MX. The only way to get
the machine back is to pull the power - shutdown -r now hangs, presing the
power button gets s
>utdown started but still hangs, and the TOC doesn't
seem to produce any output on my serial console. I've only seen a process
die in ffront of me once, when I was exiting from a bash session; the
machine just sat there with no i/o, ps aux showed the
>bash session stuck
in D state, and I couldn't ctrl-c or ctrl-z out of it at all.

Prior to this I was running 2.4.18 with no problem with the machine
running for months at a time. Has anyone seen this problem and/or got any
tips on how to figure o
>t what's going wrong? I can't find any error
output anywhere that's hinting what could be wrong, so I'm really stuck on
this one.

I've attached my .config, dmesg and cpuinfo in case anyone can see
anything obvious. Thanks for any help!

Cheers,
>Steve
>
>Attachment: config_2422pa17
>
>
>Attachment: dmesg
>
>
>Attachment: cpuinfo
>


-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
