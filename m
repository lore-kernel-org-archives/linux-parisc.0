Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C2DD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 May 2002 11:29:23 -0600 (MDT)
Date: Tue, 28 May 2002 13:29:33 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Patrick Caulfield <patrick@tykepenguin.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020528132933.B31214@systemhalted>
References: <20020527001321.A6629@systemhalted> <20020528142736.GA9288@tykepenguin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020528142736.GA9288@tykepenguin.com>; from patrick@tykepenguin.com on Tue, May 28, 2002 at 03:27:36PM +0100
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

> I can't get it to boot on my C110 - it gets stuck at the old familar "if this is
> the last message you see" message. I can run the Debian 2.4.18 kernel OK on this
> box.
> Any ideas anyone?
> patricki

What gcc version are you using to compile your kernel?
What kernel parameters have you appended?
What version of modutils are you using?
Send your .config?
Serial console?

Helpful is the documentation can be found at:
http://oss.sgi.com/projects/kdb/

c.
