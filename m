Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 022244829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 12:28:33 -0700 (MST)
Date: Tue, 12 Nov 2002 19:28:37 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] rtc doesn't build 
In-Reply-To: <20021112190427.F11C14829@dsl2.external.hp.com>
Message-ID: <Pine.BSF.4.44.0211121925070.32930-100000@e0-0.zab2.int.zabbadoz.net>
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

On Tue, 12 Nov 2002, Grant Grundler wrote:

> "Bjoern A. Zeeb" wrote:
> > thi sseems to be a problem with nonexistent defines expected
> > to be in include/asm-parisc/mc146818rtc.h
>
> use GENRTC instead

Is this a general prob ?

if so it would be good if we could hide this option - I do not know
Kconfig...

perhaps drop a note to Documentation/parisc/

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
