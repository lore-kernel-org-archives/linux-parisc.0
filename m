From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Merge progress update
Date: Sat, 19 Nov 2005 20:50:23 -0700
Message-ID: <20051120035023.GA5466@colo.lackof.org>
References: <20051119164259.GO28276@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051119164259.GO28276@tachyon.int.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Nov 19, 2005 at 11:42:59AM -0500, Kyle McMartin wrote:
> So, the following went upstream to Linus yesterday:
> 
> 	68K     linus_to_parisc_2.diff
> 
> Shortlog and diffstat are contained below.

That's awesome!

> Approximate remaining bits,
> 
> 	100K    parisc_remainingish.diff

dude! That's even more awesome! :)

> 	-rw-r--r--  1 kyle kyle 3676 Nov 19 11:41 tulip
> 		(tulip modifications)

Tulips patches are mine and will likely remain mine.
akpm has them in his tree but jgarzik has neither signed them off
nor managed to get someone else to fix the issues to his liking.
This stale mate has been going on for, oh, maybe 3 years now with me
and for almost a year with akpm.

> The rest of the diff is primarily small little hacks and a few things
> that need to be resolved with subsystem maintainers. For example,
> James' fixes for pcmcia, and Grant's fixes for usb hid.

ugh. I'm pretty sure I posted the usb hid changes to the usb devel list.
If you point me at the diff, I'll repost it to USB devel to get a response.

Might ask Arnaldo De Carmelo if he could drive the PCMCIA changes back
to the maintainers....he's done that before.

kudos and thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
