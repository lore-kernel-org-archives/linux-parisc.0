From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Fri, 02 Nov 2007 18:00:16 +0000
Message-ID: <472B65B0.7020300__49602.7772933759$1416624650$gmane$org@scarlet.be>
References: <JQIT2V$FB9C8381616CCA32E9FC6CC809E8D81D@scarlet.be>
	<20071028064158.GB29233@colo.lackof.org>
	<4724A084.5090709@scarlet.be>
	<20071029053015.GA14763@colo.lackof.org>
	<472A0A3F.5040007@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kyle <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <472A0A3F.5040007@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Joel Soete wrote:
> Grant,
> 
> 
> Grant Grundler wrote:
>> On Sun, Oct 28, 2007 at 02:45:24PM +0000, Joel Soete wrote:
>> ...
>>> e.g.
>>> # more GetOrder-poc.c
>> ...
>>> give me well same results:
>>> # ./GetOrder-poc
>>> get_order(1) = 0 (0x0);
>>> get_order_poc(1) = 0 (0x0).
>> ...
>>
>> Good!
>>
>> ...
>>> But I need to check more on a detail:
>>> here is the prototype of fls():
>>> static inline int fls(int x)
>>>
>>> so I need to be sure that the value of ((size - 1) >> (PAGE_SHIFT)) 
>>> would always stand in a int (not unsigned but sign) for 32bit (iirc 
>>> size_of(unsigned long)==32) and 64bit (size_of(unsigned long)==64) 
>>> implementations?
>>
>> Huh?
>> Why do you care how (unsigned long) is handled when the function 
>> prototype
>> defines the API to pass in an "int"?
>>
it seems that I simply forget the existance of fls_long().

I can now safely patch get_order() ;<).

Tx,
	J.

PS: Yes DELAYED_RESOURCE_CNT was set to 16
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
