Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Paul Telford <paul_telford@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] apache weirdness 
In-Reply-To: Message from Paul Telford <paul_telford@hp.com>
   of "Thu, 07 Feb 2002 11:10:49 PST." <200202071910.g17JAxv11007@ros-saab.rose.hp.com>
References: <200202071910.g17JAxv11007@ros-saab.rose.hp.com> 
Date: Fri, 08 Feb 2002 00:42:13 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020208074213.7F177482A@dsl2.external.hp.com>
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

Paul Telford wrote:
>  I'm running Apache 1.3.22 on an A180 box, kernel 2.4.16.  I have the 
> "indexes" option turned on, and when I pull up a directory without an 
> index.html a number of files are reported as zero length with a very long 
> string of zeros.  Something like:
> 
> Canna-3.5b2-50.i386.rpm 07-Sep-2001 09:37 
> 0.000000000000000000000000000000000000000000M  

I've seen this before - perhaps when I first got
gsyprf10 or gsyperf11 up and running?
Anyone else remember more?

I think the workaround was to use a different method
of displaying the files. We weren't able to reproduce
the bug on a different machine.

grant
