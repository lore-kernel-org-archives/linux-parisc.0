From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] LCD driver trims whitespace
Date: Sun, 17 Jun 2007 22:27:21 +0200
Message-ID: <200706172227.22345.deller__19128.7974630997$1416624396$gmane$org@gmx.de>
References: <46279704.1080001@web.de> <200704211141.26069.deller@gmx.de>
	<4672F1B9.507@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4672F1B9.507@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Friday 15 June 2007, Julian Stecklina wrote:
> Helge Deller wrote:
> > On Thursday 19 April 2007, Julian Stecklina wrote:
> >> I have a HP Visualize workstation with this fancy little LCD at the 
> >> front controllable via /proc/pdc/lcd. The problem is that the 
> >> responsible driver trims all trailing whitespace, which is quite 
> >> annoying if you want to scroll some text. The attached trivial patch 
> >> (against 2.6.20.1) removes this behaviour.
> > 
> > I'm sure, there was a reason to strip the whitespaces. 
> > But I forgot it by now and it was probably a not very good reason :-)
> > 
> > Nevertheless, the patch looks good.
> > 
> > Kyle, could you add the patch to your git tree ?
> > -> http://lists.parisc-linux.org/pipermail/parisc-linux/attachments/20070419/d58ce234/no-space-removal.bin
> 
> As I was just browsing the git tree, I did not see the patch. Any reason 
> it was not committed?

It seems it has been forgotten to be merged into Kyle's tree and thus it didn't went upstream.
Please, resend the full patch again to this list, add Kyle McMartin <kyle@parisc-linux.org> to CC and (most important) do not forget to add your "signed-off" line.

Thanks,
Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
