Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45A38482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Mar 2003 06:20:07 -0700 (MST)
Date: Mon, 3 Mar 2003 08:19:59 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: GOTO Masanori <gotom@debian.or.jp>
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Message-ID: <20030303131959.GZ3009@systemhalted>
References: <20030302164816.GF3009@systemhalted> <80wujhaw8r.wl@oris.opensource.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <80wujhaw8r.wl@oris.opensource.jp>
Subject: [parisc-linux] Re: [PATCH] Update HPPA LinuxThread implementation and remove old .dpatch's
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

> Excellent :)
> 
> Thanks, but should it apply in 2.3.1-15?  I would like to delay to
> apply it in 2.3.2-1.

It will work with -15, HPPA will FTBS under 2.3.2-1 because we haven't
written the sysdep-cancel support yet. The timeline for that looks like
atleast 2 weeks.

c.
