Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10BF6482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Dec 2001 04:50:40 -0700 (MST)
Received: from marmite.its.uct.ac.za ([137.158.26.155])
	by mail.uct.ac.za with esmtp (Exim 3.33 #4)
	id 16GfGz-0003kd-00
	for parisc-linux@lists.parisc-linux.org; Wed, 19 Dec 2001 13:52:33 +0200
Date: Wed, 19 Dec 2001 13:50:18 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011219115018.GA21399@marmite.its.uct.ac.za>
References: <001f01c18455$04d1cef0$0201a8c0@w2kpro> <200112140525.WAA21618@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200112140525.WAA21618@puffin.external.hp.com>
Subject: [parisc-linux] fs corruption
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

On Thu, Dec 13, 2001 at 10:25:32PM -0700, Grant Grundler wrote:
[snip]
> I punt. Met my web site hacking quota for the day...some substantial
> updates to the 0.9.3 errata:
> 	http://www.parisc-linux.org/release-0.9/errata-093.html
> 
> (You do want to know how to avoid file corruption right?)
[snip]

Oh I'm glad that's fixed :)  I was seeing fs corruption on a
D270 with an NCR53c720 and wasn't sure if it was the hardware or
the kernel or something stupid I had done :)

-- 
Michael Wood <mwood@its.uct.ac.za>
