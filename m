Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D0784838
	for <parisc-linux@lists.parisc-linux.org>; Fri, 17 May 2002 09:58:18 -0600 (MDT)
Date: Fri, 17 May 2002 11:58:08 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: james@massive.com.au
Cc: randolph@tausq.org, dave@hiauly1.hia.nrc.ca,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parsic function calling convention
Message-ID: <20020517115808.A11603@systemhalted>
References: <20020517063657.GZ30370@tausq.org> <200205171442.g4HEgNbk029843@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200205171442.g4HEgNbk029843@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, May 17, 2002 at 10:42:22AM -0400
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

> You will probably need to understand stub generation to implement libffi
> if I recall correctly.
> 
> Hpux uses a segmented memory model.  Linux uses a flat model.
> 
> Dave

Last I remember there was someone porting avcall.
They might be a good resource.

http://lists.debian.org/debian-hppa/2002/debian-hppa-200203/msg00073.html

Here is some general discussion on fp passing:
http://lists.parisc-linux.org/hypermail/parisc-linux/8277.html

c.
