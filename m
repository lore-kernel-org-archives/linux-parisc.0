Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC3224829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 21 Sep 2002 17:19:04 -0600 (MDT)
Date: Sat, 21 Sep 2002 16:20:18 -0700
From: Randolph Chung <randolph@tausq.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350
Message-ID: <20020921232018.GA29388@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020920203724.GD24622@systemhalted> <200209202046.g8KKkGwj019921@hiauly1.hia.nrc.ca> <20020920205012.GF4909@tausq.org> <20020920205518.GB25844@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020920205518.GB25844@systemhalted>
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

> Would be nice to have a proc interface for this.
> I would like to do consecutive testing with it 
> enabled and disabled.

ftp://ftp.parisc-linux.org/patches/unaligned-procfs.diff

legolas:/home/randolph# cat /proc/sys/kernel/unaligned 
Unaligned trap handler is enabled
legolas:/home/randolph# ./t; echo $?
0
legolas:/home/randolph# echo 0 >> /proc/sys/kernel/unaligned 
legolas:/home/randolph# cat /proc/sys/kernel/unaligned 
Unaligned trap handler is not enabled
legolas:/home/randolph# ./t; echo $?
Bus error
138
legolas:/home/randolph# echo 1 >> /proc/sys/kernel/unaligned 
legolas:/home/randolph# cat /proc/sys/kernel/unaligned 
Unaligned trap handler is enabled
legolas:/home/randolph# ./t; echo $?
0

if someone can review this real quick before i commit it to cvs, i'd
appreciate it. in particular, the point where it decides that the
unaligned trap is not enabled and forces the SIGBUS is not exactly at
the beginning of the trap handler -- it still prints the unaligned
message.... 

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
