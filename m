From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] [patch 2/2] backport of sba sg list management
	to ccio-dma
Date: Sun, 28 Oct 2007 15:44:14 +0000
Message-ID: <4724AE4E.8010804__7598.65269433266$1416624648$gmane$org@scarlet.be>
References: <JQIT2V$FB9C8381616CCA32E9FC6CC809E8D81D@scarlet.be>
	<20071028064158.GB29233@colo.lackof.org>
	<4724A084.5090709@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: kyle <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4724A084.5090709@scarlet.be>
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
 >
 >
[snip]
 >
 > so I need to be sure that the value of ((size - 1) >> (PAGE_SHIFT))
 > would always stand in a int (not unsigned but sign) for 32bit (iirc
 > size_of(unsigned long)==32) and 64bit (size_of(unsigned long)==64)
 > implementations?
 >
Definitely not:

if ul = 0xffffffffffffffff (64bit wide i.e. 16*4bits)
ul >> 12 (PAGE_SHIFT) == 0xfffffffffffff (13*4bits)

and INT_MAX= 0x7fffffff far well < then 0xfffffffffffff ;_(

we can get the idea in a corner when fls prototype will change.

Sorry,
	J.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
