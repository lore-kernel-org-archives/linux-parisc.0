From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ipv6 problem with 2.6.7-pa1
Date: Sun, 27 Jun 2004 14:59:56 +0000
Message-ID: <40DEE0EC.5040700@tiscali.be>
References: <20040622005559.GA24406@sal.ucc.ie>
	<40BD9F050000D9F3@ocpmta1.freegates.net>
	<20040623050009.GB27085@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040623050009.GB27085@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

I find interesting to report the success of following test on my c110 with k-2.6.7-pa1 + ncr patch:

* I just tar my kernel src tree in a 'big' file of about 200Mb (previous patch that was enough to crash the system)
* I scp (ipv4 first) this file to my pc (it takes about 4:15 with a 10Mb nic that's a rate of less then 1MB/s Ok for me)
     (i do this from hppa to pc because Guy's report indicates that tx stuff was the pb)
* I recompile the kernels (pc & hppa) to add just CONFIG_EXPERIMENTAL & CONFIG_IPV6 (also CONFIG_IPV6_PRIVACY don't know yet if 
required)
* refering to <http://people.debian.org/~csmall/ipv6/setup.html> and with Guy's help, after reboot I choose the simplest way and
* config my second pc nic with 'ifconfig eth1 add 2001:0db8:0005:0006::79/64'
* config the buildin nic of my hppa with: 'ifconfig eth0 add 2001:db8:5:6::78/64'
* i can ping6 (added thanks to iputils-ping dpkg) each other ;)
* I just add those to ip6 address to my /etc/hosts:
2001:db8:5:6::78	hpal-ip6
2001:db8:5:6::79	sidh-ip6

* i re-launch scp of previous 200Mb file from hppa to pc and all is Ok ;)
* and do the reverse (pc to hppa) with same success (just a bit slowest: ie 4:47 min in place of 04:12)

Cheers,
	Joel

Grant Grundler wrote:
> On Tue, Jun 22, 2004 at 07:09:33PM +0200, Joel Soete wrote:
> 
>>Very intersecting, c3k is using a tulip as builtin nic (iirc) and
>>not ccio-dma.
> 
> 
> c3k is using sba_iommu.c instead.
> 
> 
>>OTC d250 (as well as c110) uses LASI ASIC interface.
>>
>>Grant could you let me know if this last nic also interface with ccio-dma?
> 
> 
> Yes. All IO goes through the IOMMU when it's part of the system.
> 
> 
>>even over my ncr patch on this d model?
> 
> 
> seems jejb would prefer to see your patch get committed and then
> move upstream.
> 
> 
>>Is this kind of interface also use the scatter/gather list?
> 
> 
> NICs don't scatter gather. They only map a single buffer at
> a time.
> 
> grant
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
