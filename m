Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00207807b093-CM.cpe.net.cable.rogers.com [24.112.180.230])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7DB04829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 12:27:35 -0700 (MST)
Date: Wed, 15 Jan 2003 14:27:35 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: leandro.farinati@hp.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64 userspace
Message-ID: <20030115192735.GE20519@systemhalted>
References: <20030115190154.GA20519@systemhalted> <200301151917.h0FJH1v8021988@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301151917.h0FJH1v8021988@hiauly1.hia.nrc.ca>
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

> > I thought we had a 64-bit binutils port?
> 
> There enough to build kernels, static binaries, ...  The linker is really
> the problem.  First, we would need the processor/os specific ELF
> specification.  The handling of function pointers is another key part
> as it affects how shared libraries are implemented and the dynamic loader.

Okay. Were on the same page :)
 
> I don't see the gcc issues as major as we have the code generation part
> pretty much under control.

Yup :)

c.
