Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 004894829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  5 Apr 2003 10:14:23 -0700 (MST)
Date: Sat, 5 Apr 2003 12:14:54 -0500
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Applications in 64 bits userspace
Message-ID: <20030405171454.GF32125@systemhalted>
References: <20030404220745.GA32125@systemhalted> <200304042212.h34MCY3j001052@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304042212.h34MCY3j001052@hiauly1.hia.nrc.ca>
From: Carlos O'Donell <carlos@baldric.uwo.ca>
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

> See chapter 6 in PA-RISC 64-Bit Runtime Architecture Supplement.

Stack unwinding and exception handling?
Does this code have to call into another library? (Or just millicode).

c.
