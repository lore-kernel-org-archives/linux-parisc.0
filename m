Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1B8B482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 22:56:57 -0600 (MDT)
Message-Id: <200110260453.WAA05297@puffin.external.hp.com>
To: Daniel Williams <dan@bigw.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to Boot CD on C110 
In-Reply-To: Message from Daniel Williams <dan@bigw.org>
   of "Thu, 25 Oct 2001 16:12:00 CDT." <EDDF6AE3-C98C-11D5-BDE1-0030657D1C94@bigw.org>
Date: Thu, 25 Oct 2001 22:53:16 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Daniel Williams wrote:
> I've got a C110...  I picked up the .9 ISO and burned it with EasyCD 
> Creator on a Win2k box (I know, I know, but no access to a linux box 
> right now, I'm running FreeBSD and it doesn't have a burner).  Popped it 
> in and it won't boot.

Uhm...I tried the same trick for IA64 Debian ISO and it didn't work either.
I should have looked in the parisc-linux mail archives before
since folks have described how to do it right. Anyway, I found a CD-writer
on a linux box and ended up using cdrecord.

> Too bad the firmware doesn't see the SCSI CD 
> either, when SEArching on bootup.

"Sea" should see the CD-ROM. Very likely it's not properly
connected or has the option jumpers set wrong for PDC.

> SCSI CD is ID 2, but what bus is it on?

When it's working right, "sea" should tell you regardless of
whether it has a CD installed or not (I think).

grant
