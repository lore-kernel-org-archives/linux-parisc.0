Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0421482A
	for <parisc-linux@parisc-linux.org>; Thu, 20 Dec 2001 04:16:53 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 78172B00C; Thu, 20 Dec 2001 11:15:38 +0000 (GMT)
Date: Thu, 20 Dec 2001 11:15:38 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Andy Walker <squawker@start.no>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <20011220111538.H1897@linuxcare.com>
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <1008594958.3c1df00ed9750@nyepost.start.no> <20011219113621.X1897@linuxcare.com> <1008771313.3c20a0f14484a@nyepost.start.no> <20011219165635.3E405482A@dsl2.external.hp.com> <001b01c188cb$cb1eda60$0201a8c0@andy> <squawker@start.no> <20011219204048.2140B482A@dsl2.external.hp.com> <20011219210329.E1897@linuxcare.com> <1008842769.3c21b81172e7c@nyepost.start.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1008842769.3c21b81172e7c@nyepost.start.no>; from squawker@start.no on Thu, Dec 20, 2001 at 11:06:09AM +0100
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

On Thu, Dec 20, 2001 at 11:06:09AM +0100, Andy Walker wrote:
> Do we know of anybody who has one of these cards working?

bluefish cards are working on some machines - B180, Cxxx, for example,
but I'm not aware of anyone running one in a 725/100.  The linux driver requires
coherent memory to work (typically non-cached), and that feature isn't
provided across all PARISC CPU flavours.  In theory your 725/100 supports that
and so should work.  fwiw, the CPU in 735 doesn't support coherent memory, which
is why my attempt to add support for 53c720 on 735 (outfield) failed.

Richard
