Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12503.mail.yahoo.com (web12503.mail.yahoo.com [216.136.173.195])
	by dsl2.external.hp.com (Postfix) with SMTP id 1523A4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Sep 2002 00:26:42 -0600 (MDT)
Message-ID: <20020913062639.20473.qmail@web12503.mail.yahoo.com>
Date: Thu, 12 Sep 2002 23:26:39 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>,
	smithjames@comcast.net, parisc-linux@lists.parisc-linux.org
In-Reply-To: <sd78d3a1.013@ms-zrt1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: OT HP-UX Formatting Scsi disks
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

> try zeroing out the first few blocks:
> 
> dd if=/dev/zero of=/dev/offending_scsi_drive bs=512 count=4

I've decided to load HP-UX on the E55 I've been playing with since
Debian doesn't work very well on it right now.  I'm sending this OT
because I need to know where dd lives on an HP-UX 11.11 box.  I'm in a
limited shell and need an absolute path to dd to get it to accomplish
the above.  It's so limited it won't even give me the ls command.  Any
of you HP-UX guys out there?  Since I'm at home I don't have access to
an HP-UX box at work.  Thanks.

derek

__________________________________________________
Do you Yahoo!?
Yahoo! News - Today's headlines
http://news.yahoo.com
