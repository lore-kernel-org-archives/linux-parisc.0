Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04AF14829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 16:57:09 -0700 (MST)
Date: Wed, 11 Dec 2002 23:56:59 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Solved: Kernel crash when loggin in via ssh
In-Reply-To: <200212112340.gBBNeVPA021527@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.44.0212112348220.1073-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 11 Dec 2002, John David Anglin wrote:

> > It IS a gcc issue.
>
> That is not sufficient proof.  Just because code "works" with one compiler
> version, doesn't mean that there isn't a problem with the code.  Someone
> actually has to produce a sample of miscompiled code.  The debian 3.0.4
> is not a supported version of gcc.

okay, fair enough. But for now I stick to gcc-3.0.4 ...

BTW, did anybody try to compile kernels with CVS gcc-3.3 ?
Otherwise I'll waste my time this weekend building a native compiler and
try to recompile the same kernel again with the CVS gcc main branch (3.3?)

greetings max
