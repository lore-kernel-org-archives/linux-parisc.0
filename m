Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep02-mail.bloor.is.net.cable.rogers.com (fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B0404829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 11:32:19 -0600 (MDT)
Date: Mon, 19 May 2003 13:33:24 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>,
	randolph@tausq.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
Message-ID: <20030519173324.GD4877@systemhalted>
References: <Pine.BSF.4.53.0305191159520.86062@e0-0.zab2.int.zabbadoz.net> <200305191705.h4JH5YPo020750@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200305191705.h4JH5YPo020750@hiauly1.hia.nrc.ca>
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

> Carlos had mentioned problems with -17 about a month ago.  Don't
> know if they have been fixed.

Not yet. Problem seems to be in the emulation code for unwind find fde.
I'm working on stuff right now, but since we don't have an IPC
multiplexing call I'm sidetracked into writing semtimedop for our kernel
:)

c.
