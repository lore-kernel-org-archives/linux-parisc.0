From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 17:07:35 -0400 (EDT)
Message-ID: <200604242107.k3OL7Zc7029333@hiauly1.hia.nrc.ca>
References: <200604241412.02200.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241412.02200.mszick@morethan.org> from "Michael S. Zick"
	at Apr 24, 2006 02:12:02 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > An exception (footnoted somewhere):
> > > ldcw,co does not set the dirty bit on the dcache line.
> > 
> > Don't see this. 
> >
> I agree, it is not clear
> 
> Start with:
> http://h21007.www2.hp.com/dspp/files/unprotected/parisc20/PA_7_inst_descriptions.pdf
> 
> Find section 7-74, physical page 76 of the above.
> 
> Sub-section: "If the cache control hint is not specified ..."
> 
> First bullet, last sentence:
> "If the line is retained in cache, it must not be marked dirty."
> 
> PA2.0 only does this on lines in cache with the co completer;
> therefore, it must be 'retained in cache'.
> 
> Now:
> Sub-section: "If the cache control hint is specified ..."
> 
> "... the semaphore operation _may_ be handled as if the cache control
> hint had not been specified ..."
> 
> Now add in the errata to this flow ...

I believe that the PA 2.0 errata requires support for the cache control
hint and that the operation must be performed in cache when it is specified.
The first bullet and second bullets only apply when the hint isn't specified.
I would argue that the errata requires PA 2.0 machines to effectively
use bullet 2 (see indivisible on page 7-75).  In this case, I believe
that the line has to marked dirty.  The difference being that the line
hasn't been flushed and zero written to memory.

The PA 1.1 situation is messy in that the arch gave the hardware designers
an out since the hint can be ignored.  So, on a mchine that's not coherent,
it seems like an efficient implementation would try load the line and
make it dirty before doing the ldcw.  However, this is only going to work
if the machine does the operation in cache.  It's allowed to use the
technique in bullet 1.  Thus, probably trying ldcw once and then sampling
with ldw is as optimal has it gets without checking the capabilities
of each CPU.  PA7100LC ERS says the cache control hint is supported and
will operate in cache if the line is present the cache.  PA7300LC ERS
states that ldcw hints are supported at all privilege levels.  So,
I would say add the hint but be aware that it might be ignored on some
cpus.

> Then jump forward a page to the first clause of the indivisible RTL
> statement:
> 
> Note that all the operations are qualified by "NO_HINT"

I think the hints used in mem_store are those in table 6-8 which is
why ldcw uses "NO_HINT".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
