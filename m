Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56EFC4843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 23:01:08 -0700 (MST)
Date: Sat, 17 Jan 2004 06:01:04 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] explicitly allocate executable pages?
In-Reply-To: <20040117055850.GA28550@colo.lackof.org>
Message-ID: <Pine.LNX.4.58.0401170559560.21809@sal.ucc.ie>
References: <20040117055850.GA28550@colo.lackof.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 16 Jan 2004, Grant Grundler wrote:

> Could someone explain the following code in arch/parisc/mm/init.c?
>
> The #warning doesn't make sense to me since it's inside !defined()
> for the thing it's talking about.

Yes, it doesn't make sense to me either.
Running serial console only (without STIcon or STIfb) give me that
error message aswell, which is slightly confusing ;-)

Max
