Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5A26482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Nov 2001 21:53:44 -0700 (MST)
Message-Id: <200111140449.VAA01946@puffin.external.hp.com>
To: "Craig D. Lansing" <lansing@beldar.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems of instaling (booting) on a 715/75 
In-Reply-To: Message from "Craig D. Lansing" <lansing@beldar.com>
   of "Tue, 13 Nov 2001 20:12:43 EST." <006901c16ca9$78c16e60$0101a8c0@pogo>
Date: Tue, 13 Nov 2001 21:49:04 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

"Craig D. Lansing" wrote:
> BTW, if I can
> scrounge a DB9<-->DB9 can I use a Reflection connection on my laptop as a
> console?  I assume 9600/8/none/1 would be a good place to start?

Under linux, definitely. Try to find a real HP DB9-DB9 cable
as the only time I had seen problems was when someone used a cheapo
off-brand cable that didn't run all the lines.

9600-8N1 is correct default for all parisc machines that support
serial console.

If you have problems with this, check the mail archives first please.

grant
