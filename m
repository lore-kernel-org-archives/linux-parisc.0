Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA079482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 08:07:51 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id BA1FEB00C; Fri,  9 Nov 2001 15:08:38 +0000 (GMT)
Date: Fri, 9 Nov 2001 15:08:38 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo problems
Message-ID: <20011109150838.Y8938@linuxcare.com>
References: <20011109154525.A7672@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011109154525.A7672@dogbert.localdomain>; from fullung@ilink.nis.za on Fri, Nov 09, 2001 at 03:45:25PM +0200
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

Hi,
  As you've captured this output, I guess you are using serial console?
If so

> --commandline=2/boot/vmlinux HOME=/ TERM=linux console=tty

is wrong.  You want console=ttyS0

In fact, you don't actually need to specify console= at all these
days, palo will append the right string based on where you run it
from.

Richard
