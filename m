Return-Path: <lists@fop.ns.ca>
Received: from brain.fop.ns.ca (u135n18.eastlink.ca [24.224.135.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 320174868
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 19:30:37 -0700 (MST)
Date: Wed, 7 Jan 2004 22:30:30 -0400 (AST)
From: Steve Bromwich <hppa@fop.ns.ca>
To: Riccardo <rollei@tiscalinet.it>
Subject: Re: [parisc-linux] scsi problem on a scorpio (715)
In-Reply-To: <3FFC9A15.6FA66B2@tiscalinet.it>
Message-ID: <Pine.LNX.4.58.0401072226130.5327@brain.fop.ns.ca>
References: <3FFC9A15.6FA66B2@tiscalinet.it>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Mailing Lists <lists@fop.ns.ca>
Cc: parisc linux <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

On Thu, 8 Jan 2004, Riccardo wrote:

[snip]
> A lot of different HD's (even HP spare parts) freeze up the kernel
> during mkfs.
[snip]
> Guy Martin suggested me to change the TAG default value in the NCR
> 53x700 driver from 16 to 8 since that is what HP used. I didn't get a
> big improvment. I still have one of the inriminated disks. Issuing
> several mkfs (usually the second) freezes the kernel.

I had a similar problem and fixed it by setting tags to 8 (my problem
drive is a Quantum Fireball). Grant Grundler mentioned that "as of 5 years
ago, HP-UX default was 8 for servers and 2 for workstations"; as the 715
is a workstation it might be worth trying setting tags to 2 and seeing
what happens?

What drives have you tried, out of curiosity?

Cheers, Steve
