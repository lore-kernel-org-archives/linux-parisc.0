From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Wed, 5 Apr 2006 19:02:33 +0200
Message-ID: <200604051902.34129.deller@gmx.de>
References: <IX9D3V$BF2D86A8A8E037EBE75DD1CCA92265E8@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: "James.Bottomley" <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IX9D3V$BF2D86A8A8E037EBE75DD1CCA92265E8@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 05 April 2006 18:43, Joel Soete wrote:
> > If a user then runs on a big iron like N4k he should use a 64bit kernel
> instead, which then would implement your 64bit-changes proposal.
> >  
> Sorry but I misderstood: iirc only 64bit kernel runs on such system like A, L,
> N class; we haven't the choice?

Yes, 64bit kernel, but with additional changes as James proposed.
(the proposal is to implement an iomapping-region (in a very high memory region where you do not have physical memory), in which the ioremapping can happen.)

> PS: btw, I read a lot of your patch related to page size 16k and 64k (for
> pa8000) but not sure we can try it now?

It does not makes sense to test it yet, since it will crash your box.
I'm trying to read and understand the docs.
Not sure when I have it (at least partly) workable....
I'll let you know when you can try.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
