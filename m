From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 14:12:02 -0500
Message-ID: <200604241412.02200.mszick@morethan.org>
References: <200604241846.k3OIknKK028491@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241846.k3OIknKK028491@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon April 24 2006 13:46, John David Anglin wrote:
> > Those instruction descriptions do not always mention side-effects,
> > even less often do they mention the exceptions to the side-effects.
> > 
> > An exception (footnoted somewhere):
> > ldcw,co does not set the dirty bit on the dcache line.
> 
> Don't see this. 
>
I agree, it is not clear

Start with:
http://h21007.www2.hp.com/dspp/files/unprotected/parisc20/PA_7_inst_descriptions.pdf

Find section 7-74, physical page 76 of the above.

Sub-section: "If the cache control hint is not specified ..."

First bullet, last sentence:
"If the line is retained in cache, it must not be marked dirty."

PA2.0 only does this on lines in cache with the co completer;
therefore, it must be 'retained in cache'.

Now:
Sub-section: "If the cache control hint is specified ..."

"... the semaphore operation _may_ be handled as if the cache control
hint had not been specified ..."

Now add in the errata to this flow ...

Then jump forward a page to the first clause of the indivisible RTL
statement:

Note that all the operations are qualified by "NO_HINT"

Duh...
And this is the easy one to find, still searching for the magic byte[0]
reference.

Mike
> It uses mem_store just like stw.  The only exception 
> is when gr0 is the target and it behaves like a prefetch.  See also
> discussion of D bit trap.  If the machine has multiple D-caches, I
> don't see how the overhead present in the coherency communication
> can be avoided.
> 
> In the case where store_in_memory is used, the line is first flushed
> and then the data is written to memory.  It doesn't make sense to set
> the dirty bit in this case.  So, if you do a tight ldcw loop without
> the co completer on a CPU that is not fully coherent, you will always
> be in the slow store_in_memory case.
> 
> > Since there is no way to clear the lock with ldcw,co then when the
> > lock is cleared, then there must be another magic completer that needs
> > to be used on the instruction that resets the condition to '1' (unlocked).
> > 
> > Something that triggers the cache coherency system so the change is
> > immediately observable by all cpus.
> 
> The lock can be reset with a store.  You are probably thinking of
> the 'O' completer.  However, I think that all PA-RISC CPUs have strongly
> ordered loads and stores.  However, I think the discussion on pages
> 435-438 in http://ftp.parisc-linux.org/docs/arch/parisc2.0.pdf is
> relevant to the SMP case.
> 
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
