Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: tag starvation 
In-Reply-To: Message from James Bottomley <James.Bottomley@HansenPartnership.com>
   of "Sun, 27 Jan 2002 11:52:53 EST." <200201271652.g0RGqrA02016@localhost.localdomain>
References: <200201271652.g0RGqrA02016@localhost.localdomain> 
Date: Sun, 27 Jan 2002 12:05:06 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020127190506.DD761482A@dsl2.external.hp.com>
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

James Bottomley wrote:
> Actually, I looked and the timeout is now 10s, not 2s.

Ah ok. then really the question is if this happens with HP firmware or not.
(Eg ST15150WD should have HP12 firmware rev, iirc). I don't expect it to.

> The upper device 
> drivers (st, sd etc.) do get to override this.  The problems tend to come
> when the error recovery takes over.

errory recovery is a nightmare. For HPUX, we concluded we coudn't safely
guarantee the bus would be cleared until about 45 seconds after an IO
had be initiated. Roughly in the following order:
	30 sec	IO timeout
	10 sec	abort cmd to timeout (attempt to kill the original IO)
	 5 sec	post-reset delay (SCSI device recovery from bus reset)

Shortening the 30 second timer could be done but it would require
more restrictions on how much IO is going across the bus. non-trivial
problem given these were SCSI clusters.

grant
