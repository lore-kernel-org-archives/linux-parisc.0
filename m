Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id E112D482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Nov 2002 10:50:27 -0700 (MST)
Date: Fri, 15 Nov 2002 12:50:32 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] next issues ...
Message-ID: <20021115175032.GD5673@systemhalted>
References: <Pine.BSF.4.44.0211151707330.39295-100000@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.44.0211151707330.39295-100000@e0-0.zab2.int.zabbadoz.net>
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

> Hi,
> 
> 2.5.47-pa3 up and running I added my vlan interface, ssh'ed to the
> host and *buff*
> 

I noticed that your 'uname -a' says you compiled the kernel with gcc-3.2.
AFAIK we have yet to build a kernel with gcc-3.2 that survives network 
traffic. Perhaps try building the kernel with gcc 3.1 or 3.0? 

Helping track down the gcc-3.2 problem would be a wonderful thing :)

c.
