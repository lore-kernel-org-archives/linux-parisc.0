From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Tue, 2 May 2006 00:00:28 -0600
Message-ID: <20060502060028.GA14414@colo.lackof.org>
References: <20060430171331.GB1358@skunkworks.cabal.ca>
	<200604302125.k3ULPDl5016370@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604302125.k3ULPDl5016370@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 30, 2006 at 05:25:13PM -0400, John David Anglin wrote:
...
> I also suggest using an ordered store for the unlock operation.  This
> doesn't cost anything and may help to ensure that the order of memory
> accesses as seen by another processor occur in the expected sequence.

I've had it drilled into my head that all parisc implmentations
have strongly ordered memory subsystems. John Marvin (jsm) has
stated that more than a few times on this list. So "ordered store"
is the same as a regular store.

> It all comes down to this crucial bit of code in the ldcw description:

I'd rather have someone like Jerry Huck or someone in his experience
comment on this before we go down this path.  I'll try to find
someone to consult with this week.

...
> It may be this is only reliable on fully coherent systems.  While
> the N-class is classified as a UMA machine, it has two system buses
> separated by a memory controller.  Each system bus can handle four
> processors with L1 and L2 cache.

AFAIK, N-class has no L2 cache.

But it's worse than you think.
N-class has two _Merced_ busses connected to the memory controller. 
Each Processor is connected via a double pumped Runway Bus to "Dew"
which acts as a "bridge" to one of the Merced Busses.

[ Digression - certain document says:
	In PA-RISC, code fetches are non-coherent, such that PCX-W doesn't
	even supply Vindex bits that would allow the code fetches to be
	coherent.
]

> Thus, it would seem safer to adopt
> the prewrite and use ldcw without the cache control completer.

I'm skeptical but will ask about this.
Maybe I'm thinking kernel space only...is this intended only for
user space or for kernel also?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
