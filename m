Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A5684829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Sep 2002 14:15:07 -0600 (MDT)
Message-ID: <3D961D0E.4060806@freebel.net>
Date: Sat, 28 Sep 2002 21:20:14 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] uaccess.h patch for new evms-1.1.0: correct?
References: <3D8F01140000102A@ocpmta2.be.tiscali.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Is somebody have some sample test program to stress this patch (so that 
I can consumme all available vm) to verify that it reports well the 
erronious memory access?

Thanks in advance,
	Joel


jsoe0708@tiscali.be wrote:
> Hi all,
> 
> As I not find "std" emulation (gcc report 'Internal compiler error... PLease
> submit a full bug report...) and not more the D, M, L mips prefix (to access
> different 32bits part of a 64bits lon long), here is what I proprose as uaccess.h
> patch.
> 
> Can someone have a look and advise me if I made any error?
> 
> Thanks in advance for help,
>     Joel
> 
> PS: Functionaly it seems to work to make evms 1.1.0 works
> 
> 
