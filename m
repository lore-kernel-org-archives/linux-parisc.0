From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Why gas kills the hppa-linux kernel and what you
	can do about it.
Date: Thu, 30 Jun 2005 14:41:33 -0400
Message-ID: <20050630184132.GL5269@systemhalted.org>
References: <20050630183559.GK5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050630183559.GK5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 30, 2005 at 02:36:03PM -0400, Carlos O'Donell wrote:
> 
> pa,
> 
> Assemble this using a binutils without Alan Modra's pa_block patch:
> ---        
> 	.data
> foo:
>         .block
> bar:
>         .block 0x3fffffff
> com:
> ---

The last thing I see is this:
mmap(NULL, 1073811456, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x408fc000

And I believe that the process proceeds to memset everything to zero.
I've done similar tests before and not had any problems. I guess I
should probably turn OOM off.

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
