Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C881C4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 12:50:20 -0700 (MST)
Date: Tue, 1 Apr 2003 11:45:49 -0800
From: Randolph Chung <randolph@tausq.org>
To: "FUHRMAN,SCOTT (HP-Boise,ex1)" <scott.fuhrman@hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Sound on C3000
Message-ID: <20030401194548.GD23456@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <25C4C6009B5BD5118FF30003470BF7F503501C63@xboi04.boi.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <25C4C6009B5BD5118FF30003470BF7F503501C63@xboi04.boi.hp.com>
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

> I ham enjoying a C3000 (400MHz) machine running hppa Debian, with kernel
> 2.4.20-32.
> Everything is working except the sound.  Sound server can start up, but
> does not have a device to output to.  

did you load the ad1889 module (or build it into your kernel?) I'm not
sure it's enabled by default... it also doesn't work 100% of the time...
but if the module loads, you should see a message in your bootup log
that identifies the device.

the ad1889 driver is on my todo list of things to fix.... too much to
do, too little time to hack :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
