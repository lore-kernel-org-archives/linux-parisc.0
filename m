From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Troubles with console on HP9000 rp3440
Date: Wed, 27 Oct 2004 13:57:46 -0600
Message-ID: <20041027195746.GC25418@colo.lackof.org>
References: <200410271322.QAA23840@mail.nek.bg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Dimitar Atanasov <d.atanasov@nek.bg>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410271322.QAA23840@mail.nek.bg>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 27, 2004 at 04:22:34PM +0300, Dimitar Atanasov wrote:
> Hello Pa-Risc!
> I try to install linux on HP 9000 rp 3440.

Support for pa8800 machines isn't fully functional yet.
"make -j2" segfaults withing a minute or so. I haven't tried
again recently.
Unless you intend on debugging TLB/Cache probles, it's best
to stick with HPUX for now.

>  I connect to console over null
> modem cable, and I start the install from the boot cd.

Which boot cd? Where did it come from?

The only installer that has a chance of working is if
debian-installer uses a recent 2.6 kernel (since May, 2004) *or* has
the pa8800/ZX1 chipset support backported to 2.4 kernel.

hth,
grant

>  But I lost the
> output. The installation says that the output is on ttyS0 but I can't find
> it. I search all com ports and other consoles but I didn't see anything
> anywhere.
> Please help if you have any ideas.
> I have read the manual but I have no such things on my console commands, or
> may be I didn't understand the procedure.
> 
> 
> 
> Regards,
> Dimitar Atanasov
> NEK EAD.
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
