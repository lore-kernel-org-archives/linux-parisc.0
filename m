From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ipv6 problem with 2.6.7-pa1
Date: Sun, 27 Jun 2004 17:40:01 +0000
Message-ID: <40DF0671.1070007@tiscali.be>
References: <20040622005559.GA24406@sal.ucc.ie>
	<40BD9F050000D9F3@ocpmta1.freegates.net>
	<20040623050009.GB27085@colo.lackof.org>
	<40DEE0EC.5040700@tiscali.be> <20040627161152.GB8598@sal.ucc.ie>
	<40DEFAD3.5050105@tiscali.be> <20040627170842.GC8740@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: "M. Grabert" <xam@cs.ucc.ie>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040627170842.GC8740@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



M. Grabert wrote:
> On Sun, Jun 27, 2004 at 04:50:27PM +0000, Joel Soete wrote:
> 
>>>BTW, what kind of NIC (ne2k, tulip, etherexpress, some 3com ...?)
>>>
>>
>>umm I don't yet test hwinfo but btw dmesg tells me:
>>
>>LASI 82596 driver - Revision: 1.30
>>Found i82596 at 0xffd07000, IRQ 87
>>CLASS: registering class device: ID = 'eth0'
>>eth0: 82596 at 0xffd07000, 00 60 B0 07 1E EA IRQ 87.
> 
> 
> Ooops, sorry. I thought you also used a second NIC ...
> 
No pb.
> 
> I mean his additional network card (the 3com) could be the trouble
> maker.
> 
Well I also miss something important: this 3com is certainly a isa model and so btw uses the wax-eisa driver which afaik is not 
the must (http://lists.parisc-linux.org/pipermail/parisc-linux/2003-November/021613.html ?)

> 
>>Should be: the builtin card is the same as the c110 (at least uses the
>>same driver) but the additional one uses 3c509.c
>>(with one I had so much pb some time ago on my i386)
> 
> 
> And which I had so much trouble half a year ago in my C3000.
> 
Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
