Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FC25482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Sep 2002 12:15:41 -0600 (MDT)
Date: Fri, 6 Sep 2002 20:15:38 +0200
Message-ID: <3D53B3B70000C9E8@ocpmta1.be.tiscali.com>
In-Reply-To: <3D53B3B70000BC9B@ocpmta1.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] upgrade evms-1.1.0 -> Kernel bug at blkpg.c (need help)
To: parisc-linux@lists.parisc-linux.org
Cc: willy@debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Hi all,


>in put_user, case 8 uses something like as:
>__put_user_asm("stw",(unsigned int)(x >> 32), (unsigned int) ptr);__put_user_asm("stw",(unsigned
>int) x, (unsigned int) (ptr+1) );
>

Well it is the contrary.

But I am a bit confuse of what do this __put_user_asm:
what does it return? (error code or ptr or something else?)

Thanks in advance for help;
    Joel


Big Brother Anders  - With Tiscali you will see it all !  Check it up on
 www.tiscali.be/bigbrother
