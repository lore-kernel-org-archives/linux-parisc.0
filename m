From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] k-class smp_call_function
	at	arch/parisc/kernel/smp.c:340
Date: Mon, 28 Mar 2005 13:04:27 +0000
Message-ID: <424800DB.6000709@tiscali.be>
References: <20050328122749.GB12853@ing.umu.se>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Anders <dizzey@ing.umu.se>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050328122749.GB12853@ing.umu.se>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Anders wrote:
> well i got help with the ccio-dma problem.
> but now i get smp badness.
> 
mostly harmless (see among other reports: <http://lists.parisc-linux.org/pipermail/parisc-linux/2004-August/024291.html>

> kernel 2.6.12-rc1-pa4 with a little ccio fix 
Cool

> gcc version 3.3.5
> 
> bootlog can be found at 
> www.ing.umu.se/~dizzey/k460_bootlog
> 
Do I well understand: the system hung after last messages:
...
FLT  5208



FLT"

?

(sorry never seen this before?)

btw could you have a try with a up kernel?

Thanks,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
