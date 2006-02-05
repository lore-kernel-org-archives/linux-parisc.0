From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] "I/O MMU is out of mapping resources" while a base
	install into HP C200
Date: Sat, 4 Feb 2006 17:39:24 -0700
Message-ID: <20060205003924.GA2225@colo.lackof.org>
References: <20060204095247.1896.qmail@web54511.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa-request@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: yong Jung <yong_jk@yahoo.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060204095247.1896.qmail@web54511.mail.yahoo.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 04, 2006 at 06:52:47PM +0900, yong Jung wrote:
> Hellow debian lovers,
> .
> Could you give me a favor to check my install problem
> on C200 machine ?

Hi Yong.
You are the 3rd person in the past week or so to report this problem. :)
It was fixed here:
| revision 1.18
| date: 2005/03/06 23:48:39;  author: grundler;  state: Exp;  lines: +34 -32
| branches:  1.18.2;  1.18.4;
| 
| 2.6.11-pa2 - ditch ccio_mem_ratio. "Ported" from similar change to sba driver.

I'm told debian-31r1a-hppa-netinst.iso uses 2.6.8.1.

Workaround is to reduce the number of outstanding scsi commands
and thus reduce the amount of total I/O "in flight".

You can do this by setting "queue_depth" to 1.
Offhand I only know about /sys entries:
	find /sys -name queue_depth 

and then "echo 1 > /sys/devices/...../queue_depth"

Or can someone remind me how to globally do that from the command line?
google isn't finding it for me today.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
