Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC6AE4895
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 00:49:16 -0600 (MDT)
Date: Fri, 30 Aug 2002 08:42:17 +0200
Message-ID: <3D3815BD000095D1@ocpmta5.be.tiscali.com>
In-Reply-To: <20020830063051.D29D84829@dsl2.external.hp.com>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb 
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
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

>-- Original Message --
>To: jsoe0708@tiscali.be
>Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
>	parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
>
>Date: Fri, 30 Aug 2002 00:30:51 -0600
>From: Grant Grundler <grundler@dsl2.external.hp.com>
>
>
>jsoe0708@tiscali.be wrote:
>> Ah ok but where is located the actual problem (gcc, ld, kernel ?).
>
>the program.
>
>> I am not a computer science engineer and have not enough knowledge
>> to understand this problem of unalign access and unalign adress.
>> Can you give me some source of information explaining that stuff?
>
>Details for parisc:
>	"PA-RISC 2.0 Architecture" by Jerry Kane.
>	page 5-11, "Unaligned Data Reference Trap (28)"
>	page 7-84, "Load Word"
>
>heh...doesn't define "aligned address" in the Glossary.
>The same stuff is in the PA 1.1 Arch books too.
>
>"aligned" means the address of the data falls on a boundary
>that is modulo the size of the data. It's more complicated
>for a "struct" but the rule applies to any field in a struct.
>
>Examples:
>	0x10 is an aligned address for an "int"
>	0x12 is an aligned address for a "short" but not an "int".
>
>Got it?
>
>BTW, even though x86 CPUs don't trap on unaligned access,
>they do take a performance hit. IIRC, it's one additional cycle.
>Under linux, most (all?) RISC CPUs trap and handle the unaligned access
>in the kernel trap handler. Other OS's could SIGBUS the application
>to kill it.
>
Thanks a lot for all info 

>Hmm...this is interesting:
>/usr/include/linux/prctl.h:# define PR_UNALIGN_SIGBUS   2       /* generate
>SIGBUS on unaligned user access */
>
>Maybe you can figure out how to set this and dig through the
>core file instead of trying to set break points.
>
Not sure I will reach but i will have look anyway.

Many thanks again,
    Joel
