Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jsoe0708@tiscali.be
Cc: "Joel Soete" <joel.soete@freebel.net>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from jsoe0708@tiscali.be
   of "Tue, 03 Sep 2002 18:02:58 +0200." <3D3815BD0000B0E9@ocpmta5.be.tiscali.com>
References: <3D3815BD0000B0E9@ocpmta5.be.tiscali.com> 
Date: Tue, 03 Sep 2002 14:33:17 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020903203317.C30834829@dsl2.external.hp.com>
Subject: [parisc-linux] Re: Unaligne access [was: Back to evms-1.0.1 && unaligne access && gdb ]
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

jsoe0708@tiscali.be wrote:
...
> And here is some data of my analyse:
> 
> First surprise in the two case (original checks.c and my checks.c with only
> "if (p->boot_ind != 0x00 && ") p addresses are exactly the same here is an
> example:

...
> with the checks.c.new:
> p            add: 0x272ee
> p.boot_ind   add: 0x272ee
> p.head       add: 0x272ef
> p.sector     add: 0x272f0
> p.cyl        add: 0x272f1
> p.sys_ind    add: 0x272f2
> p.end_head   add: 0x272f3
> p.end_sector add: 0x272f4
> p.end_cyl    add: 0x272f5
> p.start_sect add: 0x272f6
> p.nr_sects   add: 0x272fa
> 
> What do you think?

checks.c.new will generate a "misaligned access" when "p.start_sect"
is accessed. 0x272f6 is aligned on 2byte address, not 4 byte.
Ditto for "p.nr_sects".

You sure checks.c.new is referencing 0x272f6 and not something else?
You reviewed dmesg output?

...
> PS1: just in case I made error here is the code I add to print addresses:

printf's look right.

> PS2: If you think it could help you more, I can send you the complete logs
> I get from the two runs as well as sources

thanks but no. I'm just trying to help you understand "unaligned access".

grant
