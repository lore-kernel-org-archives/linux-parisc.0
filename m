Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from goliath.alaskatech.org (207-5-237-24-cable.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id C314E4843
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 May 2002 23:06:23 -0600 (MDT)
Date: Fri, 3 May 2002 20:53:24 -0800 (AKDT)
From: Tom <palinux@alaskatech.org>
To: Grahame Jordan <gbj@theforce.com.au>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] K-Class9000 K200
In-Reply-To: <1020457378.4706.9.camel@falcon.TheForce.com.au>
Message-ID: <Pine.LNX.4.33.0205032047320.26146-100000@goliath.alaskatech.org>
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

On 4 May 2002, Grahame Jordan wrote:
> Sorry to sound ignorant here but I just got me a K200.  Specs are hard
> to come by.  I am wondering if I can install Linux on this or not.
> Is this machine 32 bit or 64 bit?
>
> Which are the corect iso images?

Well, according to the hardware list I built (from ESIEE and
parisc-linux.org info) the K200 is a PA7200 (PCX-T') chip, 32-bit CPU and
system. The note from 0.9.3's release is that the generic default install
may fail, but that a K410 (single-CPU) worked. I haven't heard anything
since then, so it looks like the K200 should work.

If you'd like to browse (or if there's updates to what works)
http://www.alaskatech.org/pa-risc/PARISC-Systems.htm is what I was able to
dig up... Feel free to send me updates.
