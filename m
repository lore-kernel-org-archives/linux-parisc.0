Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 599DF4858
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 00:33:51 -0700 (MST)
Date: Sun, 24 Mar 2002 23:33:39 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Kernel 2.4.17-32-smp problem 
In-Reply-To: <20020325035848.477324855@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.33L2.0203242328170.13376-100000@eiger.apptechsys.com>
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

On Sun, 24 Mar 2002, Grant Grundler wrote:

> And I hope CPU0 isn't completely idle, look at /proc/interrupts.
> I know interrupt distribution works.
>
according to /proc/stat
cpu  599904 33379482 34656795 68636319
cpu0 0 0 64 68636186
cpu1 599904 33379482 34656731 133
