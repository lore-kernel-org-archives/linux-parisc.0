Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 16 Sep 2003 22:08:49 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: mmogenius@v8fiesta.co.uk
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] x86 on b2000
Message-ID: <20030917040849.GA11011@dsl2.external.hp.com>
References: <Pine.LNX.4.44.0308280022230.16696-100000@sal.ucc.ie> <1062062541.3f4dc9cd843ed@webmail.v8fiesta.co.uk> <1063733943.3f674ab751edb@webmail.v8fiesta.co.uk> <20030916174726.GC30906@dsl2.external.hp.com> <1063738987.3f675e6b22961@webmail.v8fiesta.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1063738987.3f675e6b22961@webmail.v8fiesta.co.uk>
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

On Tue, Sep 16, 2003 at 08:03:07PM +0100, mmogenius@v8fiesta.co.uk wrote:
> I have tried this but i am still getting the same error message... 
> 
> Fatal server error:
> AddScreen/ScreenInit Failed for driver 0 


> With me having 2 cards in the machine do i need to specify wich one to use ?

Maybe. I would expect the default to be the console.
Can you remove one of the cards?

> if so where can i get the information to do this as i am not having much luck 
> finding any documentation. Thanks

Try searching tha parisc-linux mailing list for "ScreenInit Failed".
Plenty of hits on this topic.

If none of the above helps, can you post the full Xfree86.log.0?

grant
