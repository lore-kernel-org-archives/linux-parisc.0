Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9789E4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Oct 2002 18:38:17 -0600 (MDT)
Date: Wed, 16 Oct 2002 17:40:00 -0700
From: Randolph Chung <randolph@tausq.org>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: PA/Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] New hppa64 toolchain available
Message-ID: <20021017004000.GT5602@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <B6610D13-DFA2-11D6-A1B0-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <B6610D13-DFA2-11D6-A1B0-0030656F07A2@esiee.fr>
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

> ftp://ftp.parisc-linux.org/unofficial-debs/gcc-hppa64_3.0.4ds3- 
> 7_hppa.deb

this is now superceded by

ftp://ftp.parisc-linux.org/unofficial-debs/gcc-hppa64_3.0.4ds3-7.1_hppa.deb

which fixes a problem when using -nostdinc (e.g. when building a kernel)

> Thanks Randolph Chung for making it a debian package :)

and thanks to thibaut for pointing out to me that it's broken :-)

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
