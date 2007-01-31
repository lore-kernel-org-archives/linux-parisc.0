From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] an ultimate question about "at least 7 insn"
Date: Wed, 31 Jan 2007 08:07:10 -0500
Message-ID: <20070131130710.GB14255__20968.3406785645$1416624635$gmane$org@athena.road.mcmartin.ca>
References: <JCQ952$77E869952C796B32BB4B0FAD30F577E3@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JCQ952$77E869952C796B32BB4B0FAD30F577E3@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jan 31, 2007 at 11:00:38AM +0100, Joel Soete wrote:
> Hello Grant,
> 
> Some time ago we spoke about some programming note like in pa11_acd.pdf:
> [snip]
> Software may rely upon this instruction translation in order to improve
> performance in process dispatch. For example, in this code sequence:
>     SSM 0,gr0       ; initial RSM, SSM or MTSM
>     LDW             ; set up process state
>     .               ; must be at least 7 instructions
>     .               ; between the system mask instrs
>     .
>     LDW
>     RSM 8,gr0       ; set PSW Q-bit to 0
>     MTCTL reg1,cr20 ; set up IIASQ
> [snip]
> 
> My question: is that request of 7 insn is hard-coded somewhere in silicon or
> much more a logical value because of cache line size (e.g. 32 byte on a d380
> and as an insn is 32 bit wide == 4 byte)?
> 

I believe the pipeline is 8 stages deep on pre-pa8800 processors, which
basically means we're insuring there's no dependency on the effect of
the SSM from when it is decoded to when it retires. (This could also have
been implemented completely in hardware by stalling the pipeline once
the processor decoded the SSM, no clue why it wasn't... jsm?)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
