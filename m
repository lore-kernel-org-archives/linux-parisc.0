Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jsoe0708@tiscali.be
Cc: "Joel Soete" <joel.soete@freebel.net>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb 
In-Reply-To: Message from jsoe0708@tiscali.be
   of "Mon, 02 Sep 2002 10:47:59 +0200." <3D3815BD0000A476@ocpmta5.be.tiscali.com>
References: <3D3815BD0000A476@ocpmta5.be.tiscali.com> 
Date: Mon, 02 Sep 2002 11:28:54 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020902172854.C73F44829@dsl2.external.hp.com>
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
> >Since start_sect and nr_sects are ints, this code will also generate an
> >"unaligned data reference fault" like the original code did.
> 
> Trust me it does not? (it works fine)

then I'll wager there is padding between the char and int fields
of that struct.

> >You need
> >to find the origin of "struct partition *p" when the address is un-aligned.
> >
> Very hard to define:
> a. the previous code works (again all odds)
> b. the following trial code:
...

> int main(int argc, char * * argv, char * * env) {
> 
>     struct partition p1, p2;

...
> did not reproduce the problem.

Things on the stack (local var) are properly aligned.
Malloc a block of mem and then point to an unaligned address
in that block.

> What can I do to analyse this problem? (printing all p addresses and its
> elements
> during a run with the original code and compare with a run with modified
> code?)

yes. You want to verify the addreses are unaligned.

grant
