From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ipv6 problem with 2.6.7-pa1
Date: Sun, 27 Jun 2004 20:48:20 +0000
Message-ID: <40DF3294.5000902@tiscali.be>
References: <20040622005559.GA24406@sal.ucc.ie>
	<40BD9F050000D9F3@ocpmta1.freegates.net>
	<20040623050009.GB27085@colo.lackof.org>
	<40DEE0EC.5040700@tiscali.be> <20040627161152.GB8598@sal.ucc.ie>
	<40DEFAD3.5050105@tiscali.be> <20040627170842.GC8740@sal.ucc.ie>
	<40DF0671.1070007@tiscali.be> <40DF0BAE.2000406@tiscali.be>
	<20040627192754.GA9095@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: "M. Grabert" <xam@cs.ucc.ie>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040627192754.GA9095@sal.ucc.ie>
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
> On Sun, Jun 27, 2004 at 06:02:22PM +0000, Joel Soete wrote:
> 
> 
>>>Well I also miss something important: this 3com is certainly a isa model 
>>>and so btw uses the wax-eisa driver which afaik is not the must 
>>>(http://lists.parisc-linux.org/pipermail/parisc-linux/2003-November/021613.html ?)
>>>
>>
>>Or more recent again:
>><http://lists.parisc-linux.org/pipermail/parisc-linux/2004-March/022686.html>
> 
> 
> Sorry to disappoint you (and me), but our theory of a broken EISA/network
> card driver is pointless. Guy already pointed out that he's only using
> the onboard lasi card,
Yes he remember me ()

> and that there is in fact no card in the EISA slot atm.
?
any way, in the dmesg he sent us this card appears well and I have no clue how much this card, even not used could disturbe its 
system?
> I even doubt the 3com network card driver (compiled as module) is loaded into
> kernel space.
> 
> Also interesting is the fact that his system is still running after the
> kernel oops, and only the network (IPv4 and IPv6) is not working anymore.

I presume that the developper find the fact to not being able to tx a data is less critical then lost to write data on disk?

> Might this indicate that it is not really IPv6-stack related, but the problem
> is somewhere else in the networking code?
> 
I have this feeling (so similar to my ncr pb: same lasi+ccio-dma drivers, when writing and with high i/o rate?)
It's possible that my patch is not enough or has border effect?
For the moment Guy as recompile a 2.6.6-pa4 with my patch and awaiting to reboot it.
If it unfortunately it still failled, I will ask to try a 2.6.3 (ie the last one I can boot without pb on my c110 ;)

Regards,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
