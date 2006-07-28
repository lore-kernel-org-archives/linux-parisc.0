From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [parisc-linux] 712 and booting.
Date: Fri, 28 Jul 2006 20:21:52 +0200 (MEST)
Message-ID: <200607281821.k6SILrwm014061@arbas.nms.ulrich-teichert.org>
References: <1429.10.80.1.1.1154072576.squirrel@turbine.brezh.nyet>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: leandro@con.ca
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1429.10.80.1.1.1154072576.squirrel@turbine.brezh.nyet>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

>I have an HP 712 and decided to install Debian on it.  Followed the
>instructions, got the SCSI CD-ROM to work, booted, installed it and then
>it said that it had made the system bootable.  This, oddly enough, sent it
>back to asking me for language.

Which version of debian (sarge?), which kind of install (mini-iso & net,
full CD-install?). How much RAM?

>I rebooted and the system still ended up looking for HPUX and then dumped
>me into an ISL menu (if memory serves me correctly).  Read the entirety of
>the FAQ but I can't seem to find a part explaining how to get the 712 to
>use Debian and boot from it at start-up--unless of course I was looking
>for something and it was right in front of my face with a different name.
>
>Suggestions?  Do I need to reinstall it all over again?

Do you have more than one disk? Perhaps you're trying to boot from the
wrong one? Interrupt the boot process and type "search" on the prompt
to get all choices.

How does your partition layout looks like?

HTH,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de
Stormweg 24               |listening to: Cauchemar (Opération S)
24539 Neumuenster, Germany|Good Looks, Big Deal (Sweatmaster)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
