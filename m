Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24B764829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 11:46:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18YsYe-000394-00; Wed, 15 Jan 2003 18:46:36 +0000
Date: Wed, 15 Jan 2003 18:46:36 +0000
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "FARINATI, LEANDRO" <leandro.farinati@hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64 userspace
Message-ID: <20030115184636.M26554@parcelfarce.linux.theplanet.co.uk>
References: <9A0482A7BD2506488AD9417C93F3714F011A1AE6@xsp01.brazil.hp.com> <200301151840.h0FIeS9I018903@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301151840.h0FIeS9I018903@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Wed, Jan 15, 2003 at 01:40:28PM -0500
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

On Wed, Jan 15, 2003 at 01:40:28PM -0500, John David Anglin wrote:
> To my knowledge, there isn't one.  Roughly what is required is:
> 
> 1) Kernel -- design and implement 64-bit system calls.

Another piece of the kernelside puzzle is designing the VM layout for
64-bit processes.  Do we want to (as ia64 does) reserve parts of the address
space for the kernel?  Map shared libraries in different quadrants from
the user process?  Keep data in yet another quadrant?

It's a lot of work, and I'm not sure the will is there to make it happen.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
