Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15A384829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 11:05:37 -0600 (MDT)
Message-Id: <200305191705.h4JH5YPo020750@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
To: bzeeb-lists@lists.zabbadoz.net (Bjoern A. Zeeb)
Date: Mon, 19 May 2003 13:05:34 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.BSF.4.53.0305191159520.86062@e0-0.zab2.int.zabbadoz.net> from "Bjoern A. Zeeb" at May 19, 2003 12:07:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> my ssh connection had been terminated/crashed I woke up this morning
> and after re-connection I had those in dmegs:
> 
> --- cut ---
> do_page_fault() pid=268 command='sshd' type=6 address=0x00000003

You probably should try downgrading glibc and hope that completes
without a seg fault.

Carlos had mentioned problems with -17 about a month ago.  Don't
know if they have been fixed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
