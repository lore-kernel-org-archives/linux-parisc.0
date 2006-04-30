From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Heavy Iron Reference Docs
Date: Sun, 30 Apr 2006 13:13:31 -0400
Message-ID: <20060430171331.GB1358@skunkworks.cabal.ca>
References: <200604292250.49455.mszick@morethan.org>
	<200604300436.k3U4ao30012106@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604300436.k3U4ao30012106@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 30, 2006 at 12:36:50AM -0400, John David Anglin wrote:
> 
> I also found the following:
> http://h21007.www2.hp.com/dspp/files/unprotected/itanium/spinlocks.pdf
>

Our in-kernel spinlocks respect this, minus the pretest which probably
isn't necessary for anything but performance. See include/asm-parisc/spinlock.h
__raw_ macros for more details. I suspect mb() is probably a good equivalent
for the notation used as a compiler barrier in that document.

Note, the document also uses LDCW,CO so I suspect this is correct
in our implementation as well. Also note that in PA1.1 LDCW,CO is simply
a hint and will not relax the alignment requirement.

-- --

To address the previous point, I believe when I first discovered
the V-class SAR a year or two ago I tried to hardcode a few of the
ops in them to see if they would work on my C3000. I don't remember
whether the result was a LDW equivalent or an illegal operation trap,
but it didn't work as expected none the less. Until someone from HP
is able to confirm the existance of some of these hversion-dependant
atomic ops, I am going to pretend they don't exist.

However, if someone from HP wants to give details if any magic instructions
exist in any of the PA8x00 processors I have... I'd be more than happy to
try and make use of the information to optimize some of our atomic ops.

Cheers,
	Kyle 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
