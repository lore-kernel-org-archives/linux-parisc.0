From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] Should I read SHR[DW] as SHRP[DW] in parisc2.p
Date: Fri, 13 Aug 2004 12:50:52 -0500
Message-ID: <200408131250.52034.mszick@goquest.com>
References: <200408131520.i7DFKckH017219@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408131520.i7DFKckH017219@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri August 13 2004 10:20, John David Anglin wrote:
> > Time will show if gcc-inline assembly is that nice to we programmers.
> 
> The PA-RISC GNU assembler was never intended to be a general purpose
> assembler.  Features that GCC doesn't use are probably not that well
> tested ;)
> 
That is what I meant - we are on a 'feature discovery' trip here.

I did cheat a bit - I studied the pa.md file - figured that if what I was
interested in wasn't there, I need to be careful about using it.

Also discovered that software integer divide uses a similar bit-finder
to what I have proposed in the past. (Immediate, magic number,
bit masks).

But I have had that proposal turned down often enough - 
Even though it can be written to avoid register stalls; works
run-time, register size independent; does not dirty a d-cache
line and returns the bit-mask for the found bit 
(or the input mask modified by the found bit)
in addition to the index without additional instructions.
Which makes it ideal for all of those 'find next bit' loops.

Mike

> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
