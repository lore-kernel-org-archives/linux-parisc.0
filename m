Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100/10 add-on card causes kernel BUG 
In-Reply-To: Message from "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
   of "Sat, 16 Mar 2002 00:50:13 EST." <3C92DD15.4060008@neuronet.pitt.edu>
References: <3C92DD15.4060008@neuronet.pitt.edu> 
Date: Sat, 16 Mar 2002 11:42:31 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020316184231.482C6482C@dsl2.external.hp.com>
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

"Rafael E. Herrera" wrote:
...
> WARNING! Stack pointer and cr30 do not correspond!

A few times, this error (it's not a warning) meant the 
driver was attempting to access user space data directly.
This is wrong and unfortunately it *usually* (but not always)
works on x86 arch. The right way to access user space data
is via copy_from_user() or write asm code that explicitly
references Space Registers (eg sr3).

grant
