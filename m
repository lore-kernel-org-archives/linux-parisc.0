From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ipv6 problem with 2.6.7-pa1
Date: Sun, 27 Jun 2004 16:50:27 +0000
Message-ID: <40DEFAD3.5050105@tiscali.be>
References: <20040622005559.GA24406@sal.ucc.ie>
	<40BD9F050000D9F3@ocpmta1.freegates.net>
	<20040623050009.GB27085@colo.lackof.org>
	<40DEE0EC.5040700@tiscali.be> <20040627161152.GB8598@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: "M. Grabert" <xam@cs.ucc.ie>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040627161152.GB8598@sal.ucc.ie>
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
> On Sun, Jun 27, 2004 at 02:59:56PM +0000, Joel Soete wrote:
> 
>>Hello all,
>>
>>I find interesting to report the success of following test on my c110
>>with k-2.6.7-pa1 + ncr patch:
>>
>>* I just tar my kernel src tree in a 'big' file of about 200Mb
>>  (previous patch that was enough to crash the system)
>>* I scp (ipv4 first) this file to my pc (it takes about 4:15 with
>>  a 10Mb nic that's a rate of less then 1MB/s Ok for me)
> 
> 
> BTW, what kind of NIC (ne2k, tulip, etherexpress, some 3com ...?)
>
umm I don't yet test hwinfo but btw dmesg tells me:

LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffd07000, IRQ 87
CLASS: registering class device: ID = 'eth0'
eth0: 82596 at 0xffd07000, 00 60 B0 07 1E EA IRQ 87.

> 
>>  (i do this from hppa to pc because Guy's report indicates that
>>   tx stuff was the pb)
> 
> 
> I'm still suspicious that the network card (ie. the driver) could
> cause Guy's problem,

Should be: the builtin card is the same as the c110 (at least uses the same driver) but the additional one uses 3c509.c
(with one I had so much pb some time ago on my i386)

> although his kernel stack dump doesn't give
> any indication and suggests to look somewhere else (ie. IPv6)
>
The same for the ncr, it's only thanks to knowledge and experience of Grant, James, Matthew (sorry if I forget somebody else) that 
I reach to locate and fix the pb. Mel Gorman tool CodeViz just help me to figureout a bit how to read the stack dump but not 
really more.

> 
>>* I recompile the kernels (pc & hppa) to add just CONFIG_EXPERIMENTAL & 
>>  CONFIG_IPV6 (also CONFIG_IPV6_PRIVACY don't know yet if required)
> 
> 
> If you don't assign a IPv6 address to a NIC manually, IPv6 does
> create one automatically. With 'Privacy Extensions' enabled,
> the address autoconfiguration uses 'random' IPv6 addresses instead
> of deriving them from the MAC address (EUI-64).
> 
> Since you set up your IPv6 addresses manually, you don't need
> CONFIG_IPV6_PRIVACY). BTW, you also have to explicitly turn those
> 'privacy extensions' on (via /proc) if you want to use it.
> 
> 
>>* refering to <http://people.debian.org/~csmall/ipv6/setup.html>
>>  and with Guy's help, after reboot I choose the simplest way and
>>* config my second pc nic with 'ifconfig eth1 add 
>>  2001:0db8:0005:0006::79/64'
>>* config the buildin nic of my hppa with: 'ifconfig eth0 add 
>>  2001:db8:5:6::78/64'
>>* i can ping6 (added thanks to iputils-ping dpkg) each other ;)
>>* I just add those to ip6 address to my /etc/hosts:
>>  2001:db8:5:6::78	hpal-ip6
>>  2001:db8:5:6::79	sidh-ip6
>>* i re-launch scp of previous 200Mb file from hppa to pc and all is Ok ;)
>>* and do the reverse (pc to hppa) with same success (just a bit
>>  slowest: ie 4:47 min in place of 04:12)
> 
> 
> Well, what else is different from Guy's config?
> He's using the machine as a IPv6 router, so you might have to
> simulate this aswell in order to trigger the same problem that Guy
> has.
Yes, I just try step by step. More over I don't have second nic (and no chance no cache another one), so that will be difficult :(

> As I said, I have virtually the same IPv6 setup as Guy has,
> but I don't have the problem on my C3000.
> 
Thanks again,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
