Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70233482A
	for <parisc-linux@parisc-linux.org>; Tue, 18 Dec 2001 18:29:37 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7BC0AB00C; Wed, 19 Dec 2001 01:27:56 +0000 (GMT)
Date: Wed, 19 Dec 2001 01:27:56 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] HP 9000/782/C240 up and running 0.9.3 (serial)
Message-ID: <20011219012756.S1897@linuxcare.com>
References: <Pine.OSF.4.41.0112181415560.6043-100000@student.cs.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.OSF.4.41.0112181415560.6043-100000@student.cs.ucc.ie>; from xam@student.cs.ucc.ie on Tue, Dec 18, 2001 at 03:50:24PM +0000
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

On Tue, Dec 18, 2001 at 03:50:24PM +0000, Markus Grabert wrote:
> do_page_fault() pid=5087 command='scrollkeeper_to' type=15 address=0x00000008

I looked in to this, btw, it is not hppa specific, see bug #103224

Richard
