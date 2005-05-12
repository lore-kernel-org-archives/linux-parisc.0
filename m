From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ccio-dma 64bit debug_init info
Date: Thu, 12 May 2005 11:47:13 -0600
Message-ID: <20050512174713.GL15173@colo.lackof.org>
References: <4282FEEE00000637@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEE00000637@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, May 12, 2005 at 07:37:27PM +0200, Joel Soete wrote:
> Hello all,
> 
> I try to figure out what's wrong with ccio-dma for 64bit and put on DEBUG_INIT
> an collect:
> for 32bit kernel:
>  base 10740000
>  base 10780000
> ...
> 
> Otc for 64bit kernel:
> ...
>  base 0000000010a80000
>  base 0000000010ac0000
> ...
> 
> mmm base address seems to be wrong.

You mean it's different. What makes you think it's wrong?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
