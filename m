From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] /proc/stat became wrong during 2.6.10-pa6 pa7
	transition???
Date: Thu, 3 Feb 2005 14:26:35 +0000
Message-ID: <20050203142635.GB20386@parcelfarce.linux.theplanet.co.uk>
References: <41DE9360000085A1@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41DE9360000085A1@mail-4-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Feb 03, 2005 at 08:38:06AM +0100, Joel Soete wrote:
> I previously mentioned that top didn't report anymore right values since
> 2.6.10-pa7:
> ...
> Cpu(s):  0.7% us,  0.0% sy,  0.0% ni,  0.0% id,  0.0% wa, 99.3% hi,  0.0%
> si
> ...
> 
> while 2.6.10-pa6 was seems more relevant:
> ...
> Cpu(s):  0.7% us,  1.0% sy,  0.0% ni, 98.4% id,  0.0% wa,  0.0% hi,  0.0%
> si
> ...
> 
> and btw I noticed that strange stat reports too:
> 2.6.10-pa6 # cat /proc/stat
> cpu  23248 3356 64981 4508884 30377 0 147
> cpu0 23248 3356 64981 4508884 30377 0 147
> ...
> i.e. 7 field ok
> OTC
> 2.6.10-pa7 # car /proc/stat
> cpu  88358 16430 0 0 0 33813422 0 0
> cpu0 88358 16430 0 0 0 33813422 0 0
> ...
> fwfw _8_ field ???

Aha, found it.  Thanks for pointing out that /proc/stat was the
guilty party.  Don't worry about the 7/8 fields, that's a red herring.
The problem was that we weren't calling irq_enter/irq_exit().  I just
committed that fix, but now we appear to *never* spend any time in
interrupts.  I think I know how to fix that, but we'll see ...

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
