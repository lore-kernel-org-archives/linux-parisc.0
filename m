Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 20 Dec 2002 15:37:47 -0700
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults
Message-ID: <20021220223747.GD13478@dsl2.external.hp.com>
References: <randolph@tausq.org> <20021218170254.GM19331@tausq.org> <200212202212.gBKMCbv08741@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212202212.gBKMCbv08741@localhost.localdomain>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Dec 20, 2002 at 04:12:37PM -0600, James Bottomley wrote:
> The fix is simple: increment the stack pointer.  I chose 16 to preserve every 
> alignment I can think of is that also safe for 64 bit?

needs to be 64 bytes - lamont confirmed.

> With this fix, my system seems fairly solid.  It survives my bitkeeper and 
> stress tests so far (about 30 min) previously it always collapsed within
> a few minutes.

excellent!

> P.S. After this little debug frenzy, I don't personally care if I ever see 
> another line of parisc assembly again, so if another obscure register
> trashing problem turns up, my good deed is done...

*G*
/me kowtows to the east several times...


>  	STREG	%r1,0(%r30)			/* Stick r1 (usp) here for now */
> +	ldo	16(%r30),%r30

As David observed, this wants to use ",ma" and I'll work that out with
lamont/helge offline.
Something will get committed to 2.4.x/2.5.x trees this afternoon.

thanks - what a wonderful Christmas present! :^)

grant
