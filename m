From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Just A suggestion to highlight mb() and	cpu_relax()
	in s files?
Date: Thu, 24 Aug 2006 18:39:23 +0000
Message-ID: <44EDF25B.6070309@scarlet.be>
References: <J4IE0Y$F96BD8695898C37EEF35C0BA6880F173@scarlet.be>	<20060824154721.GL24068@parisc-linux.org>
	<20060824161532.GA1455@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060824161532.GA1455@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Kyle McMartin wrote:
> On Thu, Aug 24, 2006 at 09:47:21AM -0600, Matthew Wilcox wrote:
> 
>>I like the idea.  How about using the function name instead, though?
>>
>>+#define __mb(s)           __asm__ __volatile__(s "()":::"memory") /* barrier() */
>>+#define mb()	__mb("mb")
>>+#define rmb()          __mb("rmb")
>>+#define wmb()          __mb("wmb")
>>+#define smp_mb()       __mb("smp_mb")
> 
> 
Love it too (would be my next q)
anyway won't we need some comment charater: I prefer ';' (my oldfashion) but may be better '#'
+#define __mb(s)           __asm__ __volatile__("# " s "()":::"memory")	/* barrier() */

> I liek it.

Will you do it or do you prefer I send you (tomorrow) a patch?

TIA,
	Joel
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
